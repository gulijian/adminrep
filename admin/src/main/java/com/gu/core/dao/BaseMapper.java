package com.gu.core.dao;

import java.util.List;

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
