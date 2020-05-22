package com.bbs.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbs.pojo.Level;
import com.bbs.pojo.User;
import com.bbs.service.ClientService;

@Controller
@RequestMapping("/client")
public class ClientController {
	@Resource
	private ClientService clientService;
	// 跳转到  client_regist 页面
	@RequestMapping(value="/client_regist",method=RequestMethod.GET)
	public String clientRegist(@ModelAttribute User user) {
		user.setUserSex("男");
		return "client_regist";
	}
	// 实现注册功能
	@RequestMapping(value="/client_regist",method=RequestMethod.POST)
	public String clientRegist(@Valid User user,BindingResult bindingResult,
			String reUserPsw,Model model) {
		if(bindingResult.hasErrors()) {
			return "client_regist";
		}
		// 校验密码和确认密码是否相同
		if(!user.getUserPsw().equals(reUserPsw)) {
			model.addAttribute("error","密码和确认密码不同");
			return "client_regist";
		}
		// 判断账户是否已经存在
		User result = clientService.findUserById(user.getUserId());
		if(result != null) {
			model.addAttribute("error","账户已经存在");
			return "client_regist";
		}
		// 添加账户信息然后跳转到登录页面
		user.setUserCreateDate(new Date());
		Level level = clientService.findLevelByMessage("初级会员");
		user.setUserLevel(level);
		clientService.addNewUser(user);
		return "redirect:/login";
	}
}



















