package com.bbs.service;

import java.util.List;

import com.bbs.dao.InitDao;
import com.bbs.pojo.Level;
import com.bbs.pojo.User;

public class InitService {
	private InitDao initDao = new InitDao();
	/**
	 * 根据 levelMessage 查找对应用户列表
	 * @param levelMessage
	 * @return 用户列表
	 */
	public List<User> findUsersByLevelMessage(String levelMessage){
		return initDao.findUsersByLevelMessage(levelMessage);
	}
	/**
	 * 根据 levelMessage 查找对应 Level
	 * @param levelMessage
	 * @return
	 */
	public Level findLevelByLevelMessage(String levelMessage) {
		return initDao.findLevelByLevelMessage(levelMessage);
	}
	/**
	 * 添加用户到数据库
	 * @param user
	 * @return
	 */
	public int addNewUser(User user) {
		return initDao.addNewUser(user);
	}
}
