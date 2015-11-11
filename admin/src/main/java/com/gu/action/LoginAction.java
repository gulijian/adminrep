package com.gu.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gu.core.action.BaseAction;

@Controller
public class LoginAction extends BaseAction{
	
	@RequestMapping("/index")
	public String test(){
		return "index";
	}

}
