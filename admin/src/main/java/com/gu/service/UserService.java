package com.gu.service;

import java.util.Map;

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
	 * @param user
	 * @return User
	 * @exception 
	 * @since  1.0.0
	 */
	public User queryExsitUser(User user){
		return mapper.queryExsitUser(user);
	}
	
	/**
	 * 
	 * 角色分配给有用户
	 * 方法名：roleDistributeUser
	 * 创建人：gulj
	 * 时间：2015年12月25日-下午4:07:29 
	 * @param map
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	public int roleDistributeUser(Map<String,String> map){
		return mapper.roleDistributeUser(map);
	}

	

}
