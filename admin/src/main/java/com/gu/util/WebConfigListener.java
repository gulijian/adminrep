package com.gu.util;

import java.io.FileInputStream;
import java.util.Properties;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class WebConfigListener implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		PropertiesUtil.pps = new Properties();

		try {
			String path = (getClass().getClassLoader().getResource("").toURI()).getPath();
			FileInputStream fis = new FileInputStream(path+"config.properties");
			PropertiesUtil.pps.load(fis);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
