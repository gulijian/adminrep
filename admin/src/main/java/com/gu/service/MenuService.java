package com.gu.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gu.core.service.BaseService;
import com.gu.dao.mapper.MenuMapper;
import com.gu.entity.Menu;

@Service
public class MenuService extends BaseService<MenuMapper, Menu>{
	
	/**
	 * 
	 * 根据用户id查询拥有菜单列表
	 * 方法名：queryMenuByUserId
	 * 创建人：gulj
	 * 时间：2015年11月26日-下午3:31:54 
	 * @param userId
	 * @return List<Menu>
	 * @exception 
	 * @since  1.0.0
	 */
	public List<Menu> queryMenuByUserId(Integer userId){
		return mapper.queryMenuByUserId(userId);
	}
	
}
