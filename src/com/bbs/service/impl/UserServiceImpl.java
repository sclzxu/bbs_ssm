package com.bbs.service.impl;

import java.util.Date;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

import com.bbs.dao.LevelMapper;
import com.bbs.dao.UserMapper;
import com.bbs.pojo.Level;
import com.bbs.pojo.User;
import com.bbs.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userMapper;
	@Resource
	private LevelMapper levelMapper;
	// 根据账户和密码查找对应账户信息
	@Override
	public User findUserByIdAndPsw(String userId, String userPsw) {
		// 对密码加密处理
		User result = userMapper.findUserByIdAndPsw(userId, DigestUtils.md5Hex(userPsw));
		// 判断用户是否被降级处理
		if(result!=null && result.getLevelDown()!=null 
				&& result.getLevelDown().getTime()>new Date().getTime()) {
			String[] levels = {"初级会员","中级会员","高级会员"};
			int index = 0;
			for(int i=0 ; i<levels.length ; i++) {
				if(levels[i].equals(result.getUserLevel().getLevelMessage())) {
					index = i;
					break;
				}
			}
			// 通过 levelMessage 查找 Level
			Level level = levelMapper.findLevelByMessage(levels[index-1]);
			result.setUserLevel(level);
		}
		return result;
	}
}
