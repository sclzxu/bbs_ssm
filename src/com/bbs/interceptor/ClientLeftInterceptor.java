package com.bbs.interceptor;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.pojo.Category;
import com.bbs.pojo.Plate;
import com.bbs.service.ServerService;

public class ClientLeftInterceptor implements HandlerInterceptor {
	@Resource
	private ServerService serverService;
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		// 获取板块列表
		List<Plate> plates = serverService.findAllPlates();
		// 获取分类列表、
		List<Category> categories = serverService.findAllCategories();
		// 放入数据
		request.setAttribute("plates", plates);
		request.setAttribute("categories", categories);
		return true;
	}
}










