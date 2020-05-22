package com.bbs.service;

import com.bbs.pojo.Level;
import com.bbs.pojo.User;

public interface ClientService {
	User findUserById(String userId);
	
	Level findLevelByMessage(String levelMessage);
	
	int addNewUser(User user);
}
