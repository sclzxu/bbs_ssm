package com.bbs.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bbs.service.ClientService;

@Controller
public class IndexController {
	@Resource
	private ClientService clientService;
	// 访问 index 页面
	@RequestMapping("/")
	public String index(Model model) {
		// 获取所有的贴子信息
		model.addAttribute("invitations",clientService.findAllInvitations());
		return "index";
	}
}
