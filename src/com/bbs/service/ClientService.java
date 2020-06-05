package com.bbs.service;

import java.util.List;

import com.bbs.pojo.Invitation;
import com.bbs.pojo.InvitationAns;
import com.bbs.pojo.InvitationInter;
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
	
	List<Invitation> findAllInvitations(Integer isPass,Integer plateId,Integer categoryId);
	
	Invitation findInvitationById(String invitationId);
	
	int updateAccessCountById(String invitationId);
	
	int addNewInvitationAns(InvitationAns invitationAns);
	
	List<InvitationAns> findInvitationAnsByInvitationId(String invitationId);
	
	InvitationInter findInvitationInterByUidAndIid(String userId,String invitationId);
	
	int addNewInvitationInter(String userId,String invitationId);
	
	int delInvitationInterByUidAndIid(String userId,String invitationId);
	
	List<Invitation> findAllHotInvitations();
	
	List<Invitation> findCreamByPlateId(Integer plateId);
	
	List<Invitation> findAllInvitationsByUid(String userId);
	
	int updateInvitationById(Invitation invitation);
}
