package com.gu.dao.mapper;

import java.util.Map;

import com.gu.core.dao.BaseMapper;
import com.gu.entity.User;

public interface UserMapper extends BaseMapper<User> {
	
	/**
	 * 
	 * 根据用户名和密码查询用户
	 * 方法名：queryExsitUser
	 * 创建人：gulj
	 * 时间：2015年11月26日-下午3:19:39 
	 * @param user
	 * @return User
	 * @exception 
	 * @since  1.0.0
	 */
	public User queryExsitUser(User user);
	
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
	public int roleDistributeUser(Map<String,String> map);

}
