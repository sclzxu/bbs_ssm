package com.bbs.dao;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.bbs.pojo.Level;
import com.bbs.pojo.User;

public class InitDao {
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {e.printStackTrace();}
	}
	private String URL = null;
	private String USER = null;
	private String PASSWORD = null;
	public InitDao() {
		try {
			InputStream in = InitDao.class.getClassLoader()
					.getResourceAsStream("database.properties");
			 Properties prop = new Properties();   
			 prop.load(in);
			 URL = prop.getProperty("url");
			 USER = prop.getProperty("user");
			 PASSWORD = prop.getProperty("password");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据 levelMessage 查找对应用户列表
	 * @param levelMessage
	 * @return 用户列表
	 */
	public List<User> findUsersByLevelMessage(String levelMessage){
		List<User> users = new ArrayList<>();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			String sql = "select * from bbs_user left join bbs_level "
					+ "on bbs_user.userLevel=bbs_level.levelId "
					+ "where levelMessage=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,levelMessage);
			rs = ps.executeQuery();
			while(rs.next()) {
				users.add(new User());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return users;
	}
	/**
	 * 根据 levelMessage 查找对应 Level
	 * @param levelMessage
	 * @return
	 */
	public Level findLevelByLevelMessage(String levelMessage) {
		Level level = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			String sql = "select * from bbs_level where levelMessage=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1,levelMessage);
			rs = ps.executeQuery();
			if(rs.next()) {
				level = new Level();
				level.setLevelId(rs.getInt("levelId"));
				level.setLevelMessage(rs.getString("levelMessage"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return level;
	}
	/**
	 * 添加用户到数据库
	 * @param user
	 * @return
	 */
	public int addNewUser(User user) {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			String sql 
				= "insert into bbs_user(userId,userPsw,userLevel,userCreateDate,userAlice)" 
						+" values(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1,user.getUserId());
			ps.setString(2,user.getUserPsw());
			ps.setInt(3,user.getUserLevel().getLevelId());
			ps.setObject(4,user.getUserCreateDate());
			ps.setString(5,user.getUserAlice());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return 0;
	}
}

















