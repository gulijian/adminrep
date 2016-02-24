package com.gu.util;

import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSON;
import com.gu.entity.User;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoOptions;

/**
 * 参考学习使用mogodb进行增删改查
 * 
 * ImUserMongodbUtil
 * 创建人:gulj
 * 时间：2016年2月24日-上午10:31:47 
 * @version 1.0.0
 *
 */
public class MongodbCRUL {

	private static Mongo mongo = null;
	public static Log logger = LogFactory.getLog(MongodbCRUL.class);

	private MongodbCRUL(){
		init();
	}

	private void init(){
		try{
			MongoOptions mp = new MongoOptions();
			mp.connectionsPerHost = Integer.parseInt(MongodbConfig.getInstance()
					.getConnectionsPerHost());
			mp.threadsAllowedToBlockForConnectionMultiplier = Integer
					.parseInt(MongodbConfig.getInstance().getThreadConnection());
			mp.socketKeepAlive = MongodbConfig.getInstance().getSocketKeepAlive();
			mp.autoConnectRetry = MongodbConfig.getInstance().getAutoConnectRetry();
			mp.slaveOk = MongodbConfig.getInstance().getSlaveOk();
			mongo = new Mongo(MongodbConfig.getInstance().getMongoList(), mp);
		}catch(Exception e){
			logger.error("mongo---error----", e);
		}
	}


	private DB getMongoDBClient() throws Exception{
		if (mongo == null) {
			init();
		}
		DB db = mongo.getDB(MongodbConfig.getInstance().getMongoDBName());
		if (MongodbConfig.getInstance().getMongoisauth()&&!db.isAuthenticated()) {
			boolean auth = db.authenticate(MongodbConfig.getInstance()
					.getUserName(), MongodbConfig.getInstance().getPassword()
					.toCharArray());
			if (auth) {
				return db;
			} else {
				throw new Exception("Mongodb auth failed.");
			}
		}
		return db;
	}

	private static class SingletonConfig{
		private static MongodbCRUL mongodbUtil = new MongodbCRUL();
	}
	
	
	public static DB getMongoDB()throws Exception{
		DB db = SingletonConfig.mongodbUtil.getMongoDBClient();
		return db;
	}
	
	
	/**
	 * 分页查询机器人
	 * @param currPage
	 * @param pageSize
	 * @param map
	 * @return
	 */
	public static String querByPage(int currPage, int pageSize, Map<String, Object> map){
		String result="[";
		int skip = (currPage-1)*pageSize;
		BasicDBObject query = new BasicDBObject();
		BasicDBObject sort = new BasicDBObject();
		
		BasicDBList values = new BasicDBList();  

		query.put("companyCode",map.get("companycode"));
		
		if(null != map.get("deptid") && !"".equals(map.get("deptid"))){
			values.add(new BasicDBObject("parentDepartid", new Long(map.get("deptid").toString())));  
			values.add(new BasicDBObject("departid", new Long(map.get("deptid").toString())));
			query.put("$or",values);
		}
		
	    if(null != map.get("userName") && !"".equals(map.get("userName"))){
	    	//相当于sql中的'%amin%' 
	    	Pattern pattern=Pattern.compile("^.*"+map.get("userName").toString()+".*$", Pattern.CASE_INSENSITIVE); 
	    	query.put("userName", pattern);
	    }
	    sort.put("id", 1);
		sort.put("status", 1);
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			DBCursor cursor = table.find(query).sort(sort).skip(skip).limit(pageSize);//PAGESIZE=10
			db.requestDone();
			while(cursor.hasNext()){
				result += cursor.next()+",";
			}
			if(result.contains(",")){
				result = result.substring(0, result.length() -1)+"]";
			}else{
				result = "[]";
			}
//			System.out.println(result);
			return result;
		}catch(Exception e){
			logger.error("Mongodb querByPage is error ",e);
		}
		return null;
	}
	
	/**
	 * 查询总条数
	 * @param map
	 * @return
	 */
	public static int robotCount(Map<String, Object> map){
		int rr = 0;
		BasicDBObject query = new BasicDBObject();

		BasicDBList values = new BasicDBList();  
		query.put("companyCode",map.get("companycode"));
		if(null != map.get("deptid") && !"".equals(map.get("deptid"))){
			values.add(new BasicDBObject("parentDepartid", new Long(map.get("deptid").toString())));  
			values.add(new BasicDBObject("departid", new Long(map.get("deptid").toString())));
			query.put("$or",values);
		}
		
	    if(null != map.get("userName") && !"".equals(map.get("userName"))){
	    	//相当于sql中的'%amin%' 
	    	Pattern pattern=Pattern.compile("^.*"+map.get("userName").toString()+".*$", Pattern.CASE_INSENSITIVE); 
	    	query.put("userName", pattern);
	    }
	    
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			DBCursor cursor = table.find(query);
			db.requestDone();
			rr = cursor.count();
		}catch(Exception e){
			logger.error("Mongodb robotCount is error ",e);
		}
		return rr;
	}
	
	
	
	
	
	/**
	 * 添加一个机器人
	 * @param agentInfo
	 * @return
	 */
	public static Integer saveUser(Map<Object, Object> map){
		int rr = 0;
		BasicDBObject query = new BasicDBObject();
		BasicDBObject save = new BasicDBObject();
		
		try{
			query.put("id",Integer.parseInt(map.get("id").toString()));
			save.put("username", map.get("username").toString());
			save.put("password", map.get("password").toString());
			save.put("names", map.get("names").toString());
			save.put("valid", "youXiao");
			save.put("status", map.get("STATURE").toString());
			save.put("sex", map.get("sex").toString());
			save.put("speek", "1");
			save.put("userclass", map.get("userclass").toString());
			save.put("usertype", map.get("usertype").toString());
			save.put("companyCode", map.get("companycode").toString());
			save.put("createTime","");
			
			
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			rr  = table.update(query,new BasicDBObject("$set",save),false,false).getN();
			if(rr == 0){
				save.put("id", map.get("id").toString());
				table.insert(save);
				rr = 1; 
			}
			db.requestDone();
			rr = 1;
		}catch(Exception e){
			logger.error("Mongodb saveUser is error ",e);
		}
		return rr;
	}
	
	
	
	
	/**
     * 查询任务(根据GroupType分组)
     * @return
     */
	public static List<User> queryRobotGroupType(){
		BasicDBList values = new BasicDBList();
		values.add(new BasicDBObject("status", "0"));  
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			DBObject cursor = table.group(new BasicDBObject("companyCode",true),
	                new BasicDBObject("$or",values),
	                new BasicDBObject("count",0), 
	                "function (doc, out) {out.count +=1}",
	                "function (out) {return out;}");
			db.requestDone();
			String result = cursor.toString();
			List<User> list = JSON.parseArray(result, User.class);
			return list;
		}catch(Exception e){
			logger.error("Mongodb queryRobotGroupType is error ",e);
		}
		return null;
	}
	
	
	
	/**
	 * 查询机器人
	 * @param companyCode
	 * @return
	 */
	public static List<User> queryByCompanyCode(String companyCode,String status,String speek){
		String result = "[";
		BasicDBObject query = new BasicDBObject();
		query.put("companyCode", companyCode);
		query.put("status", status);
		query.put("speek", speek);
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			DBCursor cursor = table.find(query);
			while(cursor.hasNext()){
				result += cursor.next()+",";
			}
			
			if(result.contains(",")){
				result = result.substring(0, result.length() -1)+"]";
			}else{
				result = "[]";
			}
			db.requestDone();
			List<User> list = JSON.parseArray(result, User.class);
			return list;
		}catch(Exception e){
			logger.error("Mongodb queryByCompanyCode is error ",e);
		}
		return null;
	}
	
	
	/**
	 * 查询机器人
	 * @param status
	 * @return
	 */
	public static List<User> queryByStatus(String status){
		String result = "[";
		BasicDBObject query = new BasicDBObject();
		query.put("status", status);
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			DBCursor cursor = table.find(query);
			while(cursor.hasNext()){
				result += cursor.next()+",";
			}
			
			if(result.contains(",")){
				result = result.substring(0, result.length() -1)+"]";
			}else{
				result = "[]";
			}
			db.requestDone();
			List<User> list = JSON.parseArray(result, User.class);
			return list;
		}catch(Exception e){
			logger.error("Mongodb queryByCompanyCode is error ",e);
		}
		return null;
	}
	
	
	/**
	 * 根据用户id查询
	 * @param id
	 * @return
	 */
	public static User getByJoId(String id){
		String result = "[";
		BasicDBObject query = new BasicDBObject();
		query.put("id", id);
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			DBCursor cursor = table.find(query);
			while(cursor.hasNext()){
				result += cursor.next()+",";
			}
			
			if(result.contains(",")){
				result = result.substring(0, result.length() -1)+"]";
			}else{
				result = "[]";
			}
			db.requestDone();
//			System.out.println(result);
			List<User> list = JSON.parseArray(result, User.class);
			if(null != list && list.size() > 0){
				return list.get(0);
			}
		}catch(Exception e){
			logger.error("Mongodb getByJoId is error ",e);
		}
		return null;
	}
	
	
	/**
	 * 修改一个机器人
	 * @param User
	 * @return
	 */
	public static Integer updateUser(User  User){
		int rr = 0;
		BasicDBObject insertAndUpdate = new BasicDBObject();
		BasicDBObject query = new BasicDBObject();
		
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			
			query.put("id", User.getId().toString());
			insertAndUpdate.put("status", "");
			
			rr = table.update(query,new BasicDBObject("$set",insertAndUpdate),false,false).getN();
			db.requestDone();
			rr=1;
		}catch(Exception e){
			logger.error("Mongodb updateAgentInfo is error ",e);
		}
		return rr;
	}
	
	
	
	/**
	 * 禁言发言
	 * @param User
	 * @return
	 */
	public static Integer updateRobotSpeek(User  User){
		int rr = 0;
		BasicDBObject insertAndUpdate = new BasicDBObject();
		BasicDBObject query = new BasicDBObject();
		
		try{
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			
			query.put("id", User.getId().toString());
			insertAndUpdate.put("speek", "");
			
			rr = table.update(query,new BasicDBObject("$set",insertAndUpdate),false,false).getN();
			db.requestDone();
			rr=1;
		}catch(Exception e){
			logger.error("Mongodb updateRobotSpeek is error ",e);
		}
		return rr;
	}
	
	
}
