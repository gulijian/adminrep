package com.gu.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gu.entity.User;
import com.gu.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring-core.xml"})
public class JunitApplication {
	
	@Autowired
	private UserService userService;
	
	@Test
	public void queryExsitUser(){
		User user =userService.queryExsitUser("gulj", "123456");
		System.out.println(user.getAccount());
	}

}
