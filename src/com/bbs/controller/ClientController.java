package com.bbs.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
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
	// 跳转到 client_alter_user 页面
	@RequestMapping(value="/client_alter_user",method=RequestMethod.GET)
	public String clientAlterUser(Model model,HttpSession session) {
		model.addAttribute("user",session.getAttribute("loginer"));
		return "client_alter_user";
	}
	// 修改用户信息
	@RequestMapping(value="/client_alter_user",method=RequestMethod.POST)
	public String clientAlterUser(User user,HttpSession session,
			Model model) {
		clientService.updateUserById(user);
		// 重新获取登录用户的信息
		User newUser = clientService.findUserById(user.getUserId());
		session.setAttribute("loginer",newUser);
		model.addAttribute("user", newUser);
		model.addAttribute("error","个人信息修改完毕！");
		return "client_alter_user";
	}
	// 处理头像上传功能
	@RequestMapping(value="/upload",method=RequestMethod.POST)
	@ResponseBody
	public Object upload(String userId,MultipartFile photo,HttpServletRequest request) {
		String fileName = null;
		Map<String,String> status = new HashMap<String, String>();
		//判断文件是否为空
		if(!photo.isEmpty()){
			String path = request.getSession().getServletContext()
					.getRealPath("statics"+File.separator+"file");//文件上传路径
			String oldFileName = photo.getOriginalFilename();//原文件名
			String prefix=FilenameUtils.getExtension(oldFileName);//原文件后缀 
			int filesize = 1048576;//1M
	        if(photo.getSize() >  filesize){//上传大小不得超过 1M
	        	status.put("status","文件不能超过1M");
	        	return JSON.toJSONString(status);
            }else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png") 
            		|| prefix.equalsIgnoreCase("gif")){//上传图片格式不正确
            	Random random = new Random();
            	fileName = userId+new Date().getTime()+random.nextInt(10)+"."+prefix;
                File targetFile = new File(path,fileName);
                try {  
                	photo.transferTo(targetFile);  //上传文件
                } catch (Exception e) {  
                    e.printStackTrace();
                }
            }else{
            	status.put("status","图片格式不对");
            	return JSON.toJSONString(status);
            }
		}
		// 修改数据库中对应 userId 的 userPhoto
		clientService.updateUserPhotoById(userId, fileName);
		// 修改 loginer 的头像
		((User)request.getSession().getAttribute("loginer")).setUserPhoto(fileName);
		status.put("status","success");
		status.put("filename", fileName);
		
		return JSON.toJSONString(status);
	}
}



















