package com.bbs.service.impl;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.bbs.dao.UserMapper;
import com.bbs.pojo.User;
import com.bbs.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;
	// 根据账户和密码查找对应账户信息
	@Override
	public User findUserByIdAndPsw(String userId, String userPsw) {
		// 对密码加密处理
		return userMapper.findUserByIdAndPsw(userId, DigestUtils.md5Hex(userPsw));
	}
}
