package com.gu.dao.mapper;

import java.util.List;

import com.gu.core.dao.BaseMapper;
import com.gu.entity.Menu;

public interface MenuMapper extends BaseMapper<Menu> {
	
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
	public List<Menu> queryMenuByUserId(Integer userId);

}
