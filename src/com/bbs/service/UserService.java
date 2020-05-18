package com.bbs.service;

import com.bbs.pojo.User;

public interface UserService {
	User findUserByIdAndPsw(String userId,String userPsw);
}
