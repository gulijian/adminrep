package com.gu.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class IndexAction {
	
	@RequestMapping("/index")
	public String index(){
		System.out.println("indexaction");
		return "index";
	}
	
	
	@RequestMapping("/table")
	public String table(){
		return "table";
	}
	
	@RequestMapping("/jqgrid")
	public String jqgrid(){
		return "jqgrid";
	}
	
	@RequestMapping("/email")
	public String email(){
		return "email";
	}
	
	@RequestMapping("/fusionchart")
	public String fusionchart(){
		return "fusionchart";
	}
	
	@RequestMapping("/echart")
	public String echart(){
		return "echart";
	}
	
	@RequestMapping("/treeview")
	public String treeview(){
		return "treeview";
	}
	@RequestMapping("/form")
	public String form(){
		return "form";
	}
}
