package com.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/client")
public class ClientController {
	// 访问 index 页面
	@RequestMapping(value="index",method=RequestMethod.GET)
	public String index() {
		return "index";
	}
}
