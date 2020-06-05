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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.bbs.pojo.Invitation;
import com.bbs.pojo.InvitationAns;
import com.bbs.pojo.InvitationInter;
import com.bbs.pojo.User;
import com.bbs.service.ClientService;
import com.bbs.service.ServerService;
import com.mysql.jdbc.StringUtils;

@Controller
@RequestMapping("/client")
public class ClientController {
	@Resource
	private ClientService clientService;
	@Resource
	private ServerService serverService;
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
            	fileName = userId+new Date().getTime()+random.nextInt(100)+"."+prefix;
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
	// 跳转到 client_send_invitation 页面
	@RequestMapping(value="client_send_invitation",method=RequestMethod.GET)
	public String clientSendInvitation(Model model) {
		return "client_send_invitation";
	}
	// 实现发帖功能
	@RequestMapping(value="client_send_invitation",method=RequestMethod.POST)
	public String clientSendInvitation(Invitation invitation,HttpSession session,
			Model model) {
		if(StringUtils.isNullOrEmpty(invitation.getInvitationTitle())
				|| StringUtils.isNullOrEmpty(invitation.getInvitationMessage())) {
			model.addAttribute("error","贴子标题和内容都不能为空");
			return "client_send_invitation";
		}
		if(invitation.getPlate().getPlateId() == 0) {
			model.addAttribute("error","板块信息没有选择");
			return "client_send_invitation";
		}
		if(invitation.getCategory().getCategoryId()== 0) {
			model.addAttribute("error","分类信息没有选择");
			return "client_send_invitation";
		}
		// 把 invitation 添加到数据库中
		User loginer = (User)session.getAttribute("loginer");
		invitation.setInvitationId(loginer.getUserId()+new Date().getTime());
		invitation.setInvitationCreate(new Date());
		invitation.setUser(loginer);
		clientService.addNewInvitation(invitation);
		model.addAttribute("error", "发帖成功");
		
		return "client_send_invitation";
	}
	// 回复贴子功能
	@RequestMapping(value="/client_view_invitation",method=RequestMethod.POST)
	public String clientViewInvitation(InvitationAns ans,HttpSession session,Model model) {
		// 通过 invitationId 获取 invitation
		Invitation invitation 
			= clientService.findInvitationById(ans.getInvitation().getInvitationId());
		model.addAttribute("invitation",invitation);
		// 给 ans 设置数据
		User loginer = (User)session.getAttribute("loginer");
		ans.setAnsId(ans.getInvitation().getInvitationId()
				+loginer.getUserId()+new Date().getTime());
		ans.setUser(loginer);
		ans.setAnsDate(new Date());
		// 保存到数据库
		clientService.addNewInvitationAns(ans);
		model.addAttribute("error","贴子回复成功");
		// 获取所有的回复信息
		model.addAttribute("anss",
				clientService.findInvitationAnsByInvitationId(ans.getInvitation().getInvitationId()));
		// 根据 storeUserId和invitationId 判断用户是否收藏对应贴子
		InvitationInter inter = clientService.findInvitationInterByUidAndIid(
				loginer.getUserId(),ans.getInvitation().getInvitationId());
		model.addAttribute("inter",inter);
		
		return "client_view_invitation";
	}
	// 收藏贴子
	@RequestMapping("/add_new_invitation_inter")
	public String addNewInvitationInter(String invitationId,
			HttpSession session,Model model) {
		// 通过 invitationId 获取 invitation
		Invitation invitation 
			= clientService.findInvitationById(invitationId);
		model.addAttribute("invitation",invitation);
		// 获取所有的回复信息
		model.addAttribute("anss",
				clientService.findInvitationAnsByInvitationId(invitationId));
		// 保存 InvitationInter 到数据库
		User loginer = (User)session.getAttribute("loginer");
		clientService.addNewInvitationInter(loginer.getUserId(),invitationId);
		// 在 model中设置一个 inter 值
		model.addAttribute("inter",new InvitationInter());
		
		return "client_view_invitation";
	}
	// 取消收藏贴子
	@RequestMapping("/del_invitation_inter")
	public String delInvitationInter(String invitationId,
			HttpSession session,Model model) {
		// 通过 invitationId 获取 invitation
		Invitation invitation 
			= clientService.findInvitationById(invitationId);
		model.addAttribute("invitation",invitation);
		// 获取所有的回复信息
		model.addAttribute("anss",
				clientService.findInvitationAnsByInvitationId(invitationId));
		// 删除表 bbs_invitation_inter 中对应的记录
		User loginer = (User)session.getAttribute("loginer");
		clientService.delInvitationInterByUidAndIid(loginer.getUserId(),invitationId);
		// 在 model中设置一个 inter 值
		model.addAttribute("inter",null);
		
		return "client_view_invitation";
	}
	// 跳转到 client_manage_invitation 页面
	@RequestMapping(value="/client_manage_invitation",method=RequestMethod.GET)
	public String clientManageInvitation() {
		return "client_manage_invitation";
	}
	// 跳转到 client_sended_invitation
	@RequestMapping(value="/client_sended_invitation",method=RequestMethod.GET)
	public String clientSendedInvitation(HttpSession session,Model model) {
		User loginer = (User)session.getAttribute("loginer");
		model.addAttribute("invitations",clientService.findAllInvitationsByUid(loginer.getUserId()));
		return "client_sended_invitation";
	}
	// 跳转到 client_invitation_person
	@RequestMapping(value="client_invitation_person/{invitationId}",method=RequestMethod.GET)
	public String clientInvitationPerson(@PathVariable String invitationId,Model model) {
		Invitation invitation = clientService.findInvitationById(invitationId);
		model.addAttribute("invitation",invitation);
		return "client_invitation_person";
	}
	// 实现修改贴子功能
	@RequestMapping(value="client_invitation_person",method=RequestMethod.POST)
	public String clientInvitationPerson(
			@ModelAttribute("invitation") Invitation invitation,Model model) {
		// 验证 title 非空
		if(StringUtils.isNullOrEmpty(invitation.getInvitationTitle())) {
			model.addAttribute("error","标题不能为空！");
			return "client_invitation_person";
		}
		// 修改数据库中对应记录
		invitation.setIsPass(0);
		invitation.setInvitationModify(new Date());
		clientService.updateInvitationById(invitation);
		
		return "redirect:/client/client_invitation_person/"+invitation.getInvitationId();
	}
}



















