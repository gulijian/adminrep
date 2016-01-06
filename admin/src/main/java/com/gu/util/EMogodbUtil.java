package com.gu.util;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.Mongo;
import com.mongodb.MongoOptions;
public class EMogodbUtil {
	private static Mongo mongo = null;
	public static Log logger = LogFactory.getLog(EMogodbUtil.class);

	private EMogodbUtil(){
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
		private static EMogodbUtil mongodbUtil = new EMogodbUtil();
	}
	
	
	public static DB getMongoDB()throws Exception{
		DB db = SingletonConfig.mongodbUtil.getMongoDBClient();
		return db;
	}
	
	/**
	 * 
	 * im游客本地注册
	 * 方法名：saveImUser
	 * 创建人：gulj
	 * 时间：2015年12月30日-上午11:33:14 
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	@SuppressWarnings("deprecation")
	public static int saveImUser(Map<String,Object> map){
		BasicDBObject save = new BasicDBObject();
		try {
			if(map.get("username") != null){
				save.put("username", map.get("username"));
			}
			if(map.get("nickname") != null){
				save.put("names", map.get("nickname"));
			}
			if(map.get("password") != null){
				save.put("password", map.get("password"));
			}
			save.put("userClass", map.get("userClass"));
			DB db = getMongoDB();
			DBCollection table = db.getCollection("IM_USER");
			db.requestStart();
			table.insert(save);
			db.requestDone();
		} catch (Exception e) {
			logger.error("Mongodb saveImUser is error ",e);
			return -1;
		}
		return 1;
	}
	

}
