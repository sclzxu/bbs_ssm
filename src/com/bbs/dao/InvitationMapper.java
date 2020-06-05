package com.bbs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbs.pojo.Invitation;

public interface InvitationMapper {
	List<Invitation> findAllInvitationByCategoryId(Integer categoryId);
	
	int addNewInvitation(Invitation invitation);
	
	List<Invitation> findAllInvitations(
			@Param("isPass") Integer isPass,
			@Param("plateId") Integer plateId,
			@Param("categoryId") Integer categoryId);
	
	Invitation findInvitationById(String invitationId);
	
	int updateIsPassById(@Param("invitationId") String invitationId,
			@Param("isPass") Integer isPass);
	
	int updateAccessCountById(String invitationId);
	
	List<Invitation> findAllHotInvitations();
	
	List<Invitation> findCreamByPlateId(Integer plateId);
	
	List<Invitation> findAllInvitationsByUid(String userId);
	
	int updateInvitationById(Invitation invitation);
}
