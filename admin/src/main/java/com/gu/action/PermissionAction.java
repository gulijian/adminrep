package com.gu.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.gu.core.PageParam;
import com.gu.core.Params;
import com.gu.core.action.BaseAction;
import com.gu.entity.Menu;
import com.gu.entity.Role;
import com.gu.entity.User;
import com.gu.service.MenuService;
import com.gu.service.RoleService;
import com.gu.service.UserService;
@Controller
@RequestMapping("/admin/permission")
public class PermissionAction  extends BaseAction{
	
	@Resource
	private UserService userService; //用户服务类
	@Resource
	private MenuService menuService; //菜单服务类
	@Resource
	private RoleService roleService; //角色服务类
	
	
	@RequestMapping("/list")
	public String list(){
		return "permission/list";
	}
	
	@ResponseBody
	@RequestMapping("/menu")
	public List<HashMap<String,Object>> queryPermissions(){
		HashMap<String,Object> map = null;
		List<HashMap<String,Object>> mapLst = new ArrayList<HashMap<String,Object>>();
 		List<Menu> menuLst = menuService.queryList(new Menu());
		if(null != menuLst && menuLst.size() > 0){
			for (Menu menu : menuLst) {
				map = new HashMap<String,Object>();
				map.put("id", menu.getId());
				map.put("pId", menu.getParentId());
				map.put("name", menu.getName());
				if(menu.getParentId().equals("1")){//默认父级节点全部展开，按顺序加载
					map.put("open", true);
				}
				mapLst.add(map);
			}
		}
		return mapLst;
	}
	
	@RequestMapping("/user")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public ModelAndView user(Params params){
		params.setOrder("id");
		List<User> userLst = userService.queryListWithPage(params);
		int count = userService.count(params);
		mv.addObject("userLst", userLst);
		mv.addObject("itemCount", count);
		mv.setViewName("permission/user");
		return mv;
	}
	
	@RequestMapping("/usertemplate")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	public ModelAndView usertemplate(Params params){
		params.setOrder("id");
		List<User> userLst = userService.queryListWithPage(params);
		int count = userService.count(params);
		mv.addObject("userLstTemplate", userLst);
		mv.addObject("itemCount", count);
		mv.setViewName("permission/usertemplate");
		return mv;
	}
	
	
	@RequestMapping("/role")
	public ModelAndView role(){
		List<Role> roleLst = roleService.queryList(new Role());
		mv.addObject("roleLst", roleLst);
		mv.setViewName("permission/role");
		return mv;
	}
	
	@RequestMapping(value="/distribute")
	public ModelAndView distribute(@RequestParam(value="roleId",required=false) String roleId  ,PageParam pageParam){
		PageInfo<User> pageInfo = userService.queryListPageInfo(new User(), pageParam);
		mv.addObject("pageInfo", pageInfo);
		mv.addObject("roleId", roleId);//roleId 传递给子页面
		mv.setViewName("permission/distribution");
		return mv;
	}
	
	//角色分配给用户
	@RequestMapping("/roleDistributeUser")
	@ResponseBody
	public void  distributeSure(){
		String userIds = request.getParameter("userIds");
		String roleId = request.getParameter("roleId");
		String[] userIdArr = userIds.split(",");
		Map<String,String> map = new HashMap<String,String>();
		for(int i=0;i<userIdArr.length;i++){//
			map.put("roleId", roleId);
			map.put("userId", userIdArr[i]);
			userService.roleDistributeUser(map);
		}
	}
	
	
	@RequestMapping("/authorize")
	public ModelAndView authorize(@RequestParam("roleId") String roleId){
		mv.addObject("roleId", roleId);
		mv.setViewName("permission/authorize");
		return mv;
	}
	
	//角色授权
	@RequestMapping("roleAuthorize")
	public void roleAuthorize(){
		Map<String,String> map = new HashMap<String,String>();
		String roleId = request.getParameter("roleId");
		String menuIds = request.getParameter("menuIds");
		String[] menuIdsArr = menuIds.split(",");
		for(int i=0;i<menuIdsArr.length;i++){
			map.put("roleId", roleId);
			map.put("menuId", menuIdsArr[i]);
			roleService.roleAuthorize(map);
		}
	}
}
