package com.gu.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gu.core.action.BaseAction;
import com.gu.entity.User;
import com.gu.service.MenuService;
import com.gu.service.RoleService;
import com.gu.service.UserService;
import com.gu.util.Constant;
import com.gu.util.StringUtils;

@RequestMapping("/sys")
@Controller("loginAction")
public class LoginAction extends BaseAction{
	
	@Resource
	private UserService userService; //用户服务类
	@Resource
	private MenuService menuService; //菜单服务类
	@Resource
	private RoleService roleService; //角色服务类
	
	
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(){
		User user = (User)getSession().getAttribute(Constant.USER_SESSION_KEY);
		if(null != user){
			return "index";
		}
		return "login";
	}
	
	@RequestMapping(value="/logined",method= RequestMethod.POST)
	public String logined(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)){
			password = StringUtils.md5Base64(password);
			//根据用户名和密码查询用户
			return "error";
			/*User user = userService.queryExsitUser(username, password);
			if(null != user){
				//用户放入session
				request.getSession().setAttribute(Constant.USER_SESSION_KEY, user);
				//查询用户拥有的菜单列表
				List<Object[]> menuList = (List<Object[]>) menuService.queryMenuByUserId(user.getId());
				//查询用户拥有的角色列表
				List<Object[]> roleList = (List<Object[]>) roleService.queryRoleByUserId(user.getId());
				//用户拥有的菜单列表放入session中
				request.getSession().setAttribute(Constant.MENU_SESSION_KEY, menuList);
				return "index";
			}else{
				return "login";
			}*/
		}else{
			return "login"; //用户名或者密码为空
		}
	}
	
	
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
