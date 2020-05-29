package com.bbs.service;

import java.util.List;

import com.bbs.pojo.Invitation;
import com.bbs.pojo.Level;
import com.bbs.pojo.User;

public interface ClientService {
	User findUserById(String userId);
	
	Level findLevelByMessage(String levelMessage);
	
	int addNewUser(User user);
	
	int updateUserPswById(User user);
	
	int updateUserById(User user);
	
	int updateUserPhotoById(String userId,String userPhoto);
	
	int addNewInvitation(Invitation invitation);
	
	List<Invitation> findAllInvitations(Integer isPass);
}
