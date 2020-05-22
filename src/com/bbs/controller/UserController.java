package com.bbs.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbs.pojo.User;
import com.bbs.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;
	// 跳转到 login 页面
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(@ModelAttribute User user) {
		return "login";
	}
	// 登录校验
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(@Valid User user,BindingResult bindingResult,HttpSession session,Model model) {
		model.addAttribute("user",user);
		// 判断是否有校验错误
		if(bindingResult.hasErrors())
			return "login";
		// 根据账户密码查找账户
		User result = userService.findUserByIdAndPsw(user.getUserId(),user.getUserPsw());
		// 没有找到
		if(null == result) {
			model.addAttribute("error","账户或密码错误");
			return "login";
		}
		// 把账户放入 session
		session.setAttribute("loginer",result);
		// 判断其权限
		if(result.getUserLevel().getLevelMessage().equals("系统管理员")) 
			return "manage";
		return "redirect:/";
	}
	// 实现登出功能
	@RequestMapping("/loginout")
	public String loginout(HttpSession session) {
		session.removeAttribute("loginer");
		return "redirect:/";
	}
}
