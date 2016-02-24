package com.gu.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCUtil {
	private static Properties prop;
	static{
		try {
			prop = new Properties();
			InputStream in = JDBCUtil.class.getResourceAsStream("/jdbc.properties");
			prop.load(in);
			Class.forName(prop.getProperty("jdbc.driver"));
		} catch (ClassNotFoundException e) {
			System.out.println("oracle驱动包异常");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("加载jdbc配置文件异常");
			e.printStackTrace();
		}
	}
	public static synchronized Connection getConnection(){
		try {
			return DriverManager.getConnection(prop.getProperty("jdbc.url"),prop.getProperty("jdbc.username"),prop.getProperty("jdbc.password"));
		} catch (SQLException e) {
			System.out.println("获取连接异常");
			e.printStackTrace();
		}
		return null;
	}
	public static synchronized void close(Connection conn,Statement sta,Statement stb,Statement stc,ResultSet rs){
		try{
			if(rs!=null){
				rs.close();
			}
			if(sta!=null){
				sta.close();
			}
			if(stb!=null){
				stb.close();
			}
			if(stc!=null){
				stc.close();
			}
			if(conn!=null){
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("连接关闭异常");
			e.printStackTrace();
		}
	}
	public static synchronized void close(Connection conn,Statement sta,Statement stb,ResultSet rs){
		try{
			if(rs!=null){
				rs.close();
			}
			if(sta!=null){
				sta.close();
			}
			if(stb!=null){
				stb.close();
			}
			if(conn!=null){
				conn.close();
			}
		}catch (Exception e) {
			System.out.println("连接关闭异常");
			e.printStackTrace();
		}
	}
	public static synchronized void close(Connection conn,Statement sta,ResultSet rs){
		close(conn,sta,null,null,rs);
	}
	
	public static synchronized void close(Connection conn,Statement sta){
		close(conn,sta,null,null,null);
	}
	
	public static synchronized void close(Connection conn){
		close(conn,null,null,null,null);
	}
}
