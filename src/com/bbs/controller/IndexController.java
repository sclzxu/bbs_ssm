package com.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	// 访问 index 页面
	@RequestMapping("/")
	public String index() {
		return "index";
	}
}
