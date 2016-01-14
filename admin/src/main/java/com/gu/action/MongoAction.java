package com.gu.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gu.util.EMogodbUtil;

@Controller
@RequestMapping("/admin/mongo")
public class MongoAction {
	
	
	@RequestMapping("/add")
	public void add(){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("username", "gulj");
		map.put("nickname", "gulj123");
		map.put("password", "123456");
		EMogodbUtil.saveImUser(map);
	}

	/**
	 * 
	 * 定时任务
	 * 方法名：testQuraz
	 * 创建人：gulj
	 * 时间：2016年1月14日-下午5:32:47  void
	 * @exception 
	 * @since  1.0.0
	 */
	public void testQuraz(){
		System.out.println("定时任务开启");
		
	}
	
}
