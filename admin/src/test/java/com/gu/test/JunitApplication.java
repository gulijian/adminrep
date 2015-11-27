package com.gu.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gu.entity.Menu;
import com.gu.entity.Role;
import com.gu.entity.User;
import com.gu.service.MenuService;
import com.gu.service.RoleService;
import com.gu.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-core.xml"})
public class JunitApplication {
	
	@Autowired
	private UserService userService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private RoleService roleService;
	
	@Test
	public void queryExsitUser(){
		User user = new User("gulj", "4QrcOUm6Wau+VuBX8g+IPg==");
		User users =userService.queryExsitUser(user);
		System.out.println(users.getAccount());
	}

	@Test
	public void queryMenuByUserId(){
		List<Menu> menuList = menuService.queryMenuByUserId(2);
		if(menuList.size()>0){
			for (Menu menu : menuList) {
				System.out.println("=="+menu.getUrl());
			}
		}
	}
	
	@Test
	public void queryRoleByUserId(){
		List<Role> roleList = roleService.queryRoleByUserId(2);
		if(roleList.size()>0){
			for (Role role : roleList) {
				System.out.println("=="+role.getName());
			}
		}
		
	}
	
	
	
	
	
}
