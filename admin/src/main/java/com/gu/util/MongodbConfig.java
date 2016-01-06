package com.gu.util;

import java.io.File;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import com.mongodb.MongoOptions;
import com.mongodb.ServerAddress;

public class MongodbConfig {

	private static Logger log = Logger.getLogger(MongodbConfig.class);

	// mongoDB
	private List<ServerAddress> mongoList = new ArrayList<ServerAddress>();
	private MongoOptions mp = new MongoOptions();
	private String connectionsPerHost;
	private String threadConnection;
	private Boolean socketKeepAlive;
	private Boolean autoConnectRetry;
	private Boolean slaveOk;
	private String userName;
	private String password;
	private String mongoDBName;
	private Boolean mongoisauth;
	private String validationQueryMongo;
	private String validationTimeoutMongo;
	
	private MongodbConfig(){
		//加载系统配置属性.
		loadSysProp();
	}

	private void loadSysProp(){
		try {
			String path = (getClass().getClassLoader().getResource("/").toURI()).getPath();
			
			System.out.println("============"+path);
			beginConfig(path+"mongoConfig.xml");
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 读取配置文件里的内容
	 * 
	 * @param res is the xml file location
	 */
	private void beginConfig(String res) {
		try {
			File f = new File(res);
			SAXReader reader = new SAXReader();
			Document doc = reader.read(f);
			Element root = doc.getRootElement();
			Element foo, foomem;

			Iterator<?> i = root.elementIterator("mongodbs");
			if (i.hasNext()) {
				foo = (Element) i.next();
				Iterator<?> mongos = foo.elementIterator("mongodb");
				while (mongos.hasNext()) {
					foomem = (Element) mongos.next();
					mongoList.add(new ServerAddress(foomem
							.elementTextTrim("host"), Integer.parseInt(foomem
							.elementTextTrim("port"))));
				}
				mongoDBName = foo.elementTextTrim("mongoDbName");
				connectionsPerHost = foo.elementTextTrim("connectionsPerHost");
				threadConnection = foo.elementTextTrim("threadConnection");
				socketKeepAlive = foo.elementTextTrim("socketKeepAlive")
						.equals("true") ? true : false;
				autoConnectRetry = foo.elementTextTrim("autoConnectRetry")
						.equals("true") ? true : false;
				slaveOk = foo.elementTextTrim("slaveOk").equals("true") ? true
						: false;
				// 读取mongodb的安全认证信心
				mongoisauth = foo.elementTextTrim("mongoisauth").equals("true") ? true
						: false;// 是否需要认证
				userName = foo.elementTextTrim("userName");// 安全认证用户名
				password = foo.elementTextTrim("password");// 安全认证用户密码
				validationQueryMongo = foo.elementTextTrim("validationQuery");
				validationTimeoutMongo = foo
						.elementTextTrim("validationTimeout");
			} else {
				log.error("mongo，请检查config.xml文件！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			log.error(e);
		}
	}
	
	public static MongodbConfig getInstance() {
		return SingletonConfig.mongodbConfig;
	}
	
	private static class SingletonConfig{
		private static MongodbConfig mongodbConfig = new MongodbConfig();
	}
	
	public List<ServerAddress> getMongoList() {
		return mongoList;
	}

	public void setMongoList(List<ServerAddress> mongoList) {
		this.mongoList = mongoList;
	}

	public MongoOptions getMp() {
		return mp;
	}

	public void setMp(MongoOptions mp) {
		this.mp = mp;
	}

	public String getConnectionsPerHost() {
		return connectionsPerHost;
	}

	public void setConnectionsPerHost(String connectionsPerHost) {
		this.connectionsPerHost = connectionsPerHost;
	}

	public String getThreadConnection() {
		return threadConnection;
	}

	public void setThreadConnection(String threadConnection) {
		this.threadConnection = threadConnection;
	}

	public Boolean getSocketKeepAlive() {
		return socketKeepAlive;
	}

	public void setSocketKeepAlive(Boolean socketKeepAlive) {
		this.socketKeepAlive = socketKeepAlive;
	}

	public Boolean getAutoConnectRetry() {
		return autoConnectRetry;
	}

	public void setAutoConnectRetry(Boolean autoConnectRetry) {
		this.autoConnectRetry = autoConnectRetry;
	}

	public Boolean getSlaveOk() {
		return slaveOk;
	}

	public void setSlaveOk(Boolean slaveOk) {
		this.slaveOk = slaveOk;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMongoDBName() {
		return mongoDBName;
	}

	public void setMongoDBName(String mongoDBName) {
		this.mongoDBName = mongoDBName;
	}

	public Boolean getMongoisauth() {
		return mongoisauth;
	}

	public void setMongoisauth(Boolean mongoisauth) {
		this.mongoisauth = mongoisauth;
	}

	public String getValidationQueryMongo() {
		return validationQueryMongo;
	}

	public void setValidationQueryMongo(String validationQueryMongo) {
		this.validationQueryMongo = validationQueryMongo;
	}

	public String getValidationTimeoutMongo() {
		return validationTimeoutMongo;
	}

	public void setValidationTimeoutMongo(String validationTimeoutMongo) {
		this.validationTimeoutMongo = validationTimeoutMongo;
	}
}
