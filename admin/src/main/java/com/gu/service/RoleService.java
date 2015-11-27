package com.gu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gu.core.service.BaseService;
import com.gu.dao.mapper.RoleMapper;
import com.gu.entity.Role;

@Service
public class RoleService extends BaseService<RoleMapper, Role>{
	
	
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
	public List<Role> queryRoleByUserId(Integer UserId){
		return mapper.queryRoleByUserId(UserId);
	}
	
	

}
