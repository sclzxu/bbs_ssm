package com.bbs.initializer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;

import com.bbs.controller.CodeImgServlet;
import com.bbs.controller.FileUploadController;
// 因为在Servlet3.0环境中，容器会在类路径中查找实现
// javax.servlet.ServletContainerInitializer接口的类，并用它来配置Servlet容器
public class MyInitializer implements WebApplicationInitializer {
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		// 自定义Servlet
        ServletRegistration.Dynamic myServlet 
        	= servletContext.addServlet("upload",FileUploadController.class);
        myServlet.addMapping("/upload");
        ServletRegistration.Dynamic myServlet2 
    		= servletContext.addServlet("code_img",CodeImgServlet.class);
        myServlet2.addMapping("/code_img");
	}
}
