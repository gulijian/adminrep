package com.gu.dao.mapper;

import com.gu.core.dao.BaseMapper;
import com.gu.entity.User;

public interface UserMapper extends BaseMapper<User> {
	
	/**
	 * 
	 * 根据用户名和密码查询用户
	 * 方法名：queryExsitUser
	 * 创建人：gulj
	 * 时间：2015年11月26日-下午3:19:39 
	 * @param username
	 * @param password
	 * @return User
	 * @exception 
	 * @since  1.0.0
	 */
	public User queryExsitUser(String username,String password);

}
