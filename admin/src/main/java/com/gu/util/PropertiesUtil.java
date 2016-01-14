/*
 *  Copyright (c) 2013 The CCP project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a Beijing Speedtong Information Technology Co.,Ltd license
 *  that can be found in the LICENSE file in the root of the web site.
 *
 *   http://www.cloopen.com
 *
 *  An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */
package com.gu.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {

	public static Properties pps = new Properties();
	
	/**
	 * Get default cinfig file path
	 * @return the default file path
	 */
	public static String getFilePath(){
		return PropertiesUtil.class.getClassLoader().getResource("/").getPath().replaceAll("%20", " ") + "config.properties";
	}

	/**
	 * 根据key读取value
	 * @param filePath 资源文件路径
	 * @param key 资源文件中key名称
	 */
	public static String readValue(String filePath, String key) {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(filePath));
			props.load(in);
			String value = props.getProperty(key);
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public static void main(String[] args) {
		System.out.println(PropertiesUtil.class.getClassLoader().getResource("/"));
		System.out.println(getFilePath());
	}
}
