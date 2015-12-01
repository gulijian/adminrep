package com.gu.core.action;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.gu.util.UuidUtil;


/**
 * 控制器父类
 */
public class BaseAction {

    /**
     * 日志对象
     */
    protected Logger logger = LoggerFactory.getLogger(getClass());
    
  	protected HttpServletResponse response;
  	protected HttpServletRequest request;
  	protected HttpSession session;
  	
  	@ModelAttribute  
  	public void setReqAndRes(HttpServletRequest request, HttpServletResponse response,HttpSession session){  
  	    this.response= response;  
  	    this.request = request;
  	    this.session = session;
  	}
    
    /**	【zb】用于测试*/
	public void outJSONData(Object obj){
		PrintWriter out = null;
		try{
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(obj);
		}catch (Exception e) {
			e.printStackTrace();   
		}finally{
			if(out != null){
				out.flush();
				out.close();
			}
		}
	}
	/**	【zb】用于测试*/
	public void outJSONDataString(String str){
		PrintWriter out = null;
		try{
			response.setContentType("text/json;charset=UTF-8");
			out = response.getWriter();
			out.print(str);
		}catch (Exception e) {
			e.printStackTrace();   
		}finally{
			if(out != null){
				out.flush();
				out.close();
			}
		}
	}
    

	/**
	 * 得到32位的uuid
	 * @return
	 */
	public String get32UUID(){
		
		return UuidUtil.get32UUID();
	}
	/**
	 * 得到时间戳+随机数 UniqueId
	 * @author yanhao
	 * @return Long
	 */
	public Long getUniqueId(){
		
		return UuidUtil.getUniqueId();
	}
	
	
	public static void logBefore(Logger logger, String interfaceName){
		logger.info("");
		logger.info("start");
		logger.info(interfaceName);
	}
	
	public static void logAfter(Logger logger){
		logger.info("end");
		logger.info("");
	}
   
}
