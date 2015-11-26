package com.gu.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class User implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;// 主键
	private String account;// 账号
	private String password;// 密码
	private String username;// 用户名
	private Date createTime;// 创建时间
	private List<Role> role = new ArrayList<Role>();
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public List<Role> getRole() {
		return role;
	}
	public void setRole(List<Role> role) {
		this.role = role;
	}

}
