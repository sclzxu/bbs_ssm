package com.bbs.pojo;

import java.util.Date;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

public class User {
	@NotBlank(message="账户不能为空")
	@Length(min=5,message="账户字符不能少于5个")
	private String userId;
	@NotBlank(message="密码不能为空")
	@Length(min=5,message="密码字符不能少于5个")
	private String userPsw;
	private String userAlice;
	private String userEmail;
	private String userSex;
	private String userPhoto;
	private Double userScore;
	private Level userLevel;
	private Date userDown;
	private Date userLock;
	private Date userCreateDate;
	private Integer isPass;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPsw() {
		return userPsw;
	}
	public void setUserPsw(String userPsw) {
		this.userPsw = userPsw;
	}
	public String getUserAlice() {
		return userAlice;
	}
	public void setUserAlice(String userAlice) {
		this.userAlice = userAlice;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public Double getUserScore() {
		return userScore;
	}
	public void setUserScore(Double userScore) {
		this.userScore = userScore;
	}
	public Level getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(Level userLevel) {
		this.userLevel = userLevel;
	}
	public Date getUserDown() {
		return userDown;
	}
	public void setUserDown(Date userDown) {
		this.userDown = userDown;
	}
	public Date getUserLock() {
		return userLock;
	}
	public void setUserLock(Date userLock) {
		this.userLock = userLock;
	}
	public Date getUserCreateDate() {
		return userCreateDate;
	}
	public void setUserCreateDate(Date userCreateDate) {
		this.userCreateDate = userCreateDate;
	}
	public Integer getIsPass() {
		return isPass;
	}
	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
}
