package com.bbs.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbs.pojo.Level;
import com.bbs.pojo.User;
import com.bbs.service.ClientService;
import com.mysql.jdbc.StringUtils;

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
	// 跳转到 client_view_user 页面
	@RequestMapping("/client_view_user")
	public String clientViewUser() {
		return "client_view_user";
	}
	// 跳转到 client_alter_password 页面
	@RequestMapping(value="/client_alter_password",method=RequestMethod.GET)
	public String clientAlterPassword(Model model,HttpSession session) {
		model.addAttribute("user",session.getAttribute("loginer"));
		return "client_alter_password";
	}
	// 修改密码功能
	@RequestMapping(value="/client_alter_password",method=RequestMethod.POST)
	public String clientAlterPassword(@Valid User user,BindingResult bindingResult,
			Model model,String newUserPsw,String rNewUserPsw,HttpSession session) {
		model.addAttribute("user",user);
		User loginer = (User)session.getAttribute("loginer");
		// 校验原密码是否符合要求
		if(bindingResult.hasErrors()) {
			return "client_alter_password";
		}
		// 校验新密码长度是否大于等于5个字符
		if(StringUtils.isNullOrEmpty(newUserPsw) 
				|| newUserPsw.length()<5) {
			model.addAttribute("error", "新密码长度不能少于5个字符");
			return "client_alter_password";
		}
		// 验证新密码和确认密码是否相同
		if(!newUserPsw.equals(rNewUserPsw)) {
			model.addAttribute("error", "新密码和确认密码不同");
			return "client_alter_password";
		}
		// 验证原始密码是否正确
		if(!DigestUtils.md5Hex(user.getUserPsw()).equals(loginer.getUserPsw())) {
			model.addAttribute("error", "原密码不正确");
			return "client_alter_password";
		}
		// 调用服务，修改密码
		user.setUserPsw(newUserPsw);
		clientService.updateUserPswById(user);
		model.addAttribute("error", "修改密码成功");
		
		return "client_alter_password";
	}
}



















