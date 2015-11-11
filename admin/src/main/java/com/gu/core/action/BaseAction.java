package com.gu.core.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * 控制器父类
 */
public class BaseAction {

    /**
     * 日志对象
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());
    
   
}
