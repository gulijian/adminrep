package com.gu.core.dao;

import java.util.List;

import com.gu.core.Params;

/**
 * 所有数据库持久化操作超类
 */
public interface BaseMapper<T> {

    /**
     * 查询列表
     * @param entity
     * @return
     */
    List<T> queryList (T entity);
    
    /**
     * 使用pageHelper插件分页查询
     * @param entity
     * @return List<T>
     */
    List<T> queryListPageInfo(T entity);
    
    /**
     * 使用e-page.js分页查询
     * @param entity
     * @return List<T>
     */
    List<T> queryListWithPage(Params params);
    
    /**
     * 使用e-page.js分页查询求总数
     * @param entity
     * @return List<T>
     */
    int count(Params params);

    /**
     * 根据ID查询数据
     * @param id 实体类的ID
     * @return
     */
    T queryById (String id);


    /**
     * 执行插入操作
     * @param entity
     * @return
     */
    int save (T entity);

    /**
     * 执行更新操作
     * @param entity
     * @return
     */
    int update (T entity);

    /**
     * 执行删除操作
     * @param entity
     * @return
     */
    int delete (T entity);
}
