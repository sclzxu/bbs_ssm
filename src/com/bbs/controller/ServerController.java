package com.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/server")
public class ServerController {
	// 访问 manage.jsp 页面
	@RequestMapping(value="/manage",method=RequestMethod.GET)
	public String manage() {
		return "manage";
	}
}
