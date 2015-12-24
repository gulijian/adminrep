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
	private String sex;//性别 0：男；1：女
	private int isDelete;//是否删除
	private String address;//地址
	private String mobile;//手机号
	private Date updateTime;//更新时间
	private Date createTime;//创建时间
	private List<Role> role = new ArrayList<Role>();
	
	public User() {
		super();
	}
	
	public User(String account, String password) {
		super();
		this.account = account;
		this.password = password;
	}

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

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public List<Role> getRole() {
		return role;
	}

	public void setRole(List<Role> role) {
		this.role = role;
	}
}
