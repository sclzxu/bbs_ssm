package com.bbs.controller;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bbs.pojo.Invitation;
import com.bbs.pojo.Level;
import com.bbs.pojo.User;
import com.bbs.service.ClientService;
import com.bbs.service.UserService;

@Controller
public class UserController {
	@Resource
	private UserService userService;
	@Resource
	private ClientService clientService;
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
		// 判断账户是否被锁定
		if(result.getUserLock()!=null 
				&& result.getUserLock().getTime() > new Date().getTime()) {
			model.addAttribute("error","账户被锁定");
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
	// 跳转到  client_regist 页面
	@RequestMapping(value="/regist",method=RequestMethod.GET)
	public String clientRegist(@ModelAttribute User user) {
		user.setUserSex("男");
		return "client_regist";
	}
	// 实现注册功能
	@RequestMapping(value="/regist",method=RequestMethod.POST)
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
	// 跳转到 client_view_invitation
	@RequestMapping(
			value="/client_view_invitation/{invitationId}",method=RequestMethod.GET)
	public String clientViewInvitation(@PathVariable String invitationId,Model model) {
		Invitation invitation = clientService.findInvitationById(invitationId);
		model.addAttribute("invitation",invitation);
		return "client_view_invitation";
	}
}
