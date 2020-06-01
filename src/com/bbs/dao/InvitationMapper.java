package com.bbs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbs.pojo.Invitation;

public interface InvitationMapper {
	List<Invitation> findAllInvitationByCategoryId(Integer categoryId);
	
	int addNewInvitation(Invitation invitation);
	
	List<Invitation> findAllInvitations(Integer isPass);
	
	Invitation findInvitationById(String invitationId);
	
	int updateIsPassById(@Param("invitationId") String invitationId,
			@Param("isPass") Integer isPass);
}
