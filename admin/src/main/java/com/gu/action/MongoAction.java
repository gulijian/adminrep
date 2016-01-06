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

}
