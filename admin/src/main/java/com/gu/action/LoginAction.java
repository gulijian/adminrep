package com.gu.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gu.core.action.BaseAction;
import com.gu.entity.Menu;
import com.gu.entity.Role;
import com.gu.entity.User;
import com.gu.service.MenuService;
import com.gu.service.RoleService;
import com.gu.service.UserService;
import static com.gu.util.Constant.*;
import com.gu.util.StringUtils;

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
		User user = (User)session.getAttribute(SESSION_USER_KEY);
		if(null != user){
			return "index";
		}
		return "login";
	}
	
	@ResponseBody
	@RequestMapping(value="/logined",method= RequestMethod.POST)
	public String logined(HttpServletRequest request){
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(StringUtils.isNotEmpty(username) && StringUtils.isNotEmpty(password)){
			password = StringUtils.md5Base64(password);
			//根据用户名和密码查询用户
			User user = userService.queryExsitUser(new User(username, password));
			if(null != user){
				//用户放入session
				session.setAttribute(SESSION_USER_KEY, user);
				//查询用户拥有的菜单列表
				List<Menu> menuList = menuService.queryMenuByUserId(user.getId());
				//用户拥有的菜单列表放入session中
				session.setAttribute(SESSION_MENU_KEY, menuList);
				//查询用户拥有的角色列表
				List<Role> roleList = roleService.queryRoleByUserId(user.getId());
				//用户拥有的角色列表放入session中
				session.setAttribute(SESSIOIN_ROLE_KEY, roleList);
				return "success";
			}else{
				return "error";
			}
		}else{
			return "null"; //用户名或者密码为空
		}
	}
	
	@RequestMapping("/loginOut")
	public String loginOut(){
		session.invalidate();
		return "redirect:login";
	}
	
}
