package com.gu.core.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.gu.core.PageParam;
import com.gu.core.dao.BaseMapper;
import com.gu.util.StringUtils;

/**
 * 所有服务类的超级父类
 */
public class BaseService <D extends BaseMapper <T>, T> {

    @Autowired
    protected D mapper;

    /**
     * 根据ID查询一条数据
     * @param id
     * @return
     */
    public T queryById (String id){
        return mapper.queryById(id);
    }

    /**
     * 查询列表
     * @param entity
     * @return
     */
    public List<T> queryList (T entity) {
        return mapper.queryList(entity);
    }



    /**
     * 分页查询列表 pageHelper PageInfo 分页参数，起始页码 每一页的大小， 排序
     * @param entity
     * @param pageParam
     * @return
     */
    public PageInfo<T> queryListWithPage (T entity, PageParam pageParam) {
        //判断是否含有排序的字符串
        if (StringUtils.isNotEmpty(pageParam.getOrderBy())) {
            PageHelper.orderBy(pageParam.getOrderBy());
        }
        PageHelper.startPage(pageParam.getPageNum(), pageParam.getPageSize());
        List<T> resultList = mapper.queryList(entity);
        return new PageInfo<T>(resultList);
    }

    /**
     * 保存数据 
     * @param entity
     * @return
     */
    public boolean save (T entity) {
        int res = 0;
        res = mapper.save(entity);
        return res > 0;
    }
    
    /**
     * 更新数据 
     * @param entity
     * @return
     */
    public boolean update (T entity) {
        int res = 0;
        res = mapper.update(entity);
        return res > 0;
    }
    

    /**
     * 删除数据
     * @param entity
     * @return
     */
    public boolean delete (T entity) {
        int res = mapper.delete(entity);
        return res > 0;
    }
}



