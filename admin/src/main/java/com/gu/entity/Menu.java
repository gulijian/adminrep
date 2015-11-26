package com.gu.entity;

import java.util.Date;

public class Menu implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;// 主键
	private String name;// 权限名称
	private String url;// 权限链接,所有的功能操作
	private String model;// 访问模块
	private Integer sort;// 排序
	private String method;// 模块的什么方法
	private String icon;// 菜单图标
	private String parentId; //父菜单Id
	private Date createTime;// 创建时间
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
}
