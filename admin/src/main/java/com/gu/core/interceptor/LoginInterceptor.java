package com.gu.core.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.gu.entity.User;
import com.gu.util.Constant;
/**
 * 登陆拦截器 
 * LoginInterceptor
 * 创建人:gulj
 * 时间：2015年11月26日-下午1:38:10 
 * @version 1.0.0
 *
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("====afterCompletion==="+LoginInterceptor.class);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj, ModelAndView mv) throws Exception {
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		 //请求的路径
		String contextPath=request.getContextPath();
        String  url=request.getServletPath().toString();
        HttpSession session = request.getSession();
        System.out.println("loginInterceptor");
        User user = (User)session.getAttribute(Constant.USER_SESSION_KEY);
       /* if(user == null){
        	response.sendRedirect("/login");
        	return false;
        }*/
		return true;
	}

}
