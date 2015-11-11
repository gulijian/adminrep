package com.gu.core;



/**
 * 分页参数类
 */
public class PageParam {
    private String pageNum = "1"; //页码
    private Integer pageSize = 15; //每一页大小
    private String orderBy; //排序的字符串


    public Integer getPageNum() {
    	 return Integer.valueOf(pageNum);
//        if (StringUtils.isNumeric(pageNum)) {
//           
//        } else {
//            return 1;
//        }
    }

    public void setPageNum(String pageNum) {
        this.pageNum = pageNum;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }
}
