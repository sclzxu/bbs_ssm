package com.bbs.dao;

import java.util.List;

import com.bbs.pojo.InvitationAns;

public interface InvitationAnsMapper {
	int addNewInvitationAns(InvitationAns invitationAns);
	
	List<InvitationAns> findInvitationAnsByInvitationId(String invitationId);
}
