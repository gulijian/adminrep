package com.gu.service;

import org.springframework.stereotype.Service;

import com.gu.core.service.BaseService;
import com.gu.dao.mapper.UserMapper;
import com.gu.entity.User;

@Service
public class UserService extends BaseService<UserMapper, User>{
	
	/**
	 * 
	 * 根据用户名和密码查询用户
	 * 方法名：queryExitUser
	 * 创建人：gulj
	 * 时间：2015年11月26日-下午3:14:02 
	 * @param username
	 * @param password
	 * @return User
	 * @exception 
	 * @since  1.0.0
	 */
	public User queryExsitUser(String username,String password){
		return mapper.queryExsitUser(username, password);
	}
	

}
