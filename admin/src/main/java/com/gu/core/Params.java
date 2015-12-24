package com.gu.core;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * 查询参数类
 * Params
 * 创建人:gulj
 * 时间：2015年12月23日-下午3:49:17 
 * @version 1.0.0
 *
 */
public class Params {
	private Integer isDelete;
	private Integer pageNo = 0;
	private Integer pageSize = 12;
	private Integer totalCount = 0;
	private String order ;
	private String keyword;
	private String  startDate;
	private String endDate;
	
	//用户参数
	private String account;//姓名，注意不能使用username字段否则sql报错
	private String mobile;
	private String sex;
	
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate){
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
}
