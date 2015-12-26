package com.gu.dao.mapper;

import java.util.List;
import java.util.Map;

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
	 * @return List<Role>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Role> queryRoleByUserId(Integer UserId);
	
	/**
	 * 
	 * 角色授权
	 * 方法名：roleauthorize
	 * 创建人：gulj
	 * 时间：2015年12月26日-上午10:52:14 
	 * @param map
	 * @return int
	 * @exception 
	 * @since  1.0.0
	 */
	public int roleAuthorize(Map<String,String> map);

}
