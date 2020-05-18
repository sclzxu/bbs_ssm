package com.bbs.listener;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.codec.digest.DigestUtils;

import com.bbs.pojo.Level;
import com.bbs.pojo.User;
import com.bbs.service.InitService;

// 监听器
public class InitListener implements ServletContextListener {
	private InitService initService = new InitService();
	// 在系统启动的时候执行
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// 调用服务
		List<User> users = initService.findUsersByLevelMessage("系统管理员");
		if(users.size()==0) {// 没有系统管理员
			// 查找对应 levelMessage 的 Level 对象
			Level level = initService.findLevelByLevelMessage("系统管理员");
			// 创建 User 对象
			User user = new User();
			user.setUserId("admin");
			user.setUserPsw(DigestUtils.md5Hex("666666"));
			user.setUserAlice("系统管理员");
			user.setUserLevel(level);
			user.setUserCreateDate(new Date());
			// 添加用户
			initService.addNewUser(user);
		}
	}
}



