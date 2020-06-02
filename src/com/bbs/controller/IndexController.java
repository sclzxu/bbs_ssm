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
	public String index(Integer plateId,Integer categoryId,Model model) {
		// 获取所有的贴子信息
		model.addAttribute("invitations",clientService.findAllInvitations(1,plateId,categoryId));
		return "index";
	}
	// 获取热门主题
	@RequestMapping("/hot_invitations")
	public String hot(Model model) {
		// 获取所有的贴子信息
		model.addAttribute("invitations",clientService.findAllHotInvitations());
		return "index";
	}
}
