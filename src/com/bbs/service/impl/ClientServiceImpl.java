package com.bbs.service.impl;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.bbs.dao.InvitationMapper;
import com.bbs.dao.LevelMapper;
import com.bbs.dao.UserMapper;
import com.bbs.pojo.Invitation;
import com.bbs.pojo.Level;
import com.bbs.pojo.User;
import com.bbs.service.ClientService;

@Service("clientService")
public class ClientServiceImpl implements ClientService {
	@Resource
	private UserMapper userMapper;
	@Resource
	private LevelMapper levelMapper;
	@Resource
	private InvitationMapper invitationMapper;
	// 根据 userId 查找用户
	@Override
	public User findUserById(String userId) {
		return userMapper.findUserById(userId);
	}
	// 根据 levelMessage 查找对应 Level
	@Override
	public Level findLevelByMessage(String levelMessage) {
		return levelMapper.findLevelByMessage(levelMessage);
	}
	// 添加新的用户
	@Override
	public int addNewUser(User user) {
		// 加密密码
		user.setUserPsw(DigestUtils.md5Hex(user.getUserPsw()));
		return userMapper.addNewUser(user);
	}
	// 通过 userId 修改用户密码
	@Override
	public int updateUserPswById(User user) {
		// 加密密码
		user.setUserPsw(DigestUtils.md5Hex(user.getUserPsw()));
		return userMapper.updateUserPswById(user);
	}
	// 通过 userId 修改 usrAlice、userSex和userEmail 
	@Override
	public int updateUserById(User user) {
		return userMapper.updateUserById(user);
	}
	// 根据 userId 修改 userPhoto
	@Override
	public int updateUserPhotoById(String userId, String userPhoto) {
		return userMapper.updateUserPhotoById(userId, userPhoto);
	}
	// 添加新的贴子
	@Override
	public int addNewInvitation(Invitation invitation) {
		// 对内容进行编码处理(采用UTF-8编码格式)
		String title = null;
		String meg = null;
		try {
			title = URLEncoder.encode(invitation.getInvitationTitle(),"utf-8");
			meg = URLEncoder.encode(invitation.getInvitationMessage(), "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		invitation.setInvitationTitle(title);
		invitation.setInvitationMessage(meg);
		return invitationMapper.addNewInvitation(invitation);
	}
	// 查询出所有的贴子
	@Override
	public List<Invitation> findAllInvitations(Integer isPass) {
		List<Invitation> invitations = invitationMapper.findAllInvitations(isPass);
		String title = null;
		String meg = null;
		for(Invitation inv : invitations) {
			try {
				// 对内容进行解码处理(采用UTF-8编码格式)
				title = URLDecoder.decode(inv.getInvitationTitle(),"utf-8");
				meg = URLDecoder.decode(inv.getInvitationMessage(),"utf-8");
				// 屏蔽掉敏感内容
				meg = meg.replaceAll("(共产党)|(操)","*");
			} catch (Exception e) {
				e.printStackTrace();
			}
			inv.setInvitationTitle(title);
			inv.setInvitationMessage(meg);
		}
		return invitations;
	}
	
}







