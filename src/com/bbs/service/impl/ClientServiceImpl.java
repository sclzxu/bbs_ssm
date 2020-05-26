package com.bbs.service.impl;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.bbs.dao.LevelMapper;
import com.bbs.dao.UserMapper;
import com.bbs.pojo.Level;
import com.bbs.pojo.User;
import com.bbs.service.ClientService;

@Service("clientService")
public class ClientServiceImpl implements ClientService {
	@Resource
	private UserMapper userMapper;
	@Resource
	private LevelMapper levelMapper;
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

}







