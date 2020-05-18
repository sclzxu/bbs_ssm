package com.bbs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bbs.pojo.Level;
import com.bbs.pojo.User;

public class InitDao {
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {e.printStackTrace();}
	}
	private final String URL = "jdbc:mysql://127.0.0.1:3306/bbs_system?useUnicode=true&characterEncoding=utf-8";
	private final String USER = "root";
	private final String PASSWORD = "root";
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

















