package com.bbs.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bbs.pojo.User;

public interface UserMapper {
	User findUserByIdAndPsw(@Param("userId") String userId,
			@Param("userPsw") String userPsw);

	User findUserById(String userId);
	
	int addNewUser(User user);
	
	List<User> findAllUsers();
	
	int updateUserLevelById(@Param("userId") String userId,
			@Param("userLevel") Integer userLevel);
	
	int updateLevelDownById(User user);
	
	int updateUserLockById(User user);
	
	int updateUserPswById(User user);
	
	int updateUserById(User user);
	
	int updateUserPhotoById(@Param("userId") String userId,
			@Param("userPhoto") String userPhoto);
}
