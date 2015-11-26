package com.gu.dao.mapper;

import com.gu.core.dao.BaseMapper;
import com.gu.entity.Role;

public interface RoleMapper extends BaseMapper<Role> {
	
	/**
	 * 
	 * 根据用户id查询用户拥有角色列表
	 * 方法名：queryRoleByUserId
	 * 创建人：gulj
	 * 时间：2015年11月26日-下午3:40:24 
	 * @param UserId
	 * @return Role
	 * @exception 
	 * @since  1.0.0
	 */
	public Role queryRoleByUserId(Integer UserId);

}
