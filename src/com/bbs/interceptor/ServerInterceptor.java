package com.bbs.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.pojo.User;

public class ServerInterceptor implements HandlerInterceptor {
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		Object loginer = request.getSession().getAttribute("loginer");
		if(null == loginer) {
			response.sendRedirect("/bbs_ssm/login");
			return false;
		}
		// 非系统管理员跳转到首页
		User user = (User)loginer;
		if(!user.getUserLevel().getLevelMessage().equals("系统管理员")) {
			response.sendRedirect("/bbs_ssm/client/index");
			return false;
		}
		return true;
	}
}
