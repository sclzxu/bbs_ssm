package com.bbs.dao;

import org.apache.ibatis.annotations.Param;

import com.bbs.pojo.InvitationInter;

public interface InvitationInterMapper {
	InvitationInter findInvitationInterByUidAndIid(
			@Param("userId") String userId,@Param("invitationId") String invitationId);
}
