package com.gu.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtilBase {
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");


		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	public Connection conn;
	public Statement sta;
	public ResultSet rs;
	public void open()throws Exception{
		String ip="192.168.0.144";//GlobalUtil.pps.getProperty("mongoUrl");
		Properties prop=new Properties();
		prop.setProperty("user","rycf");
		prop.setProperty("password","rycf");
		prop.setProperty("oracle.jdbc.V8Compatible","true");
//		conn = DriverManager.getConnection("jdbc:oracle:thin:@"+ip+":1521:orcl",prop);
		conn = DriverManager.getConnection("jdbc:oracle:thin:@"+ip+":1521:oracledb",prop);

	}
	public ResultSet find(String sql)throws Exception{
		sta = conn.createStatement();
		return sta.executeQuery(sql);
	}
	public void save(String sql)throws Exception{
		sta=conn.createStatement();
		sta.executeUpdate(sql);
	}

	public void close(){
		 try {
			if(rs!=null){rs.close();}
			if(sta!=null){sta.close();}
			if(conn!=null){conn.close();}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}


}
