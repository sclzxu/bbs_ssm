package com.bbs.pojo;

import java.util.Date;

public class Invitation {
	private String invitationId;
	private String invitationTitle;
	private String invitationMessage;
	private User user;
	private Plate plate;
	private Category category;
	private Integer isPass;
	private Integer isEnable;
	private Integer isCream;
	private Date invitationCreate;
	private Date invitationModify;
	public String getInvitationId() {
		return invitationId;
	}
	public void setInvitationId(String invitationId) {
		this.invitationId = invitationId;
	}
	public String getInvitationTitle() {
		return invitationTitle;
	}
	public void setInvitationTitle(String invitationTitle) {
		this.invitationTitle = invitationTitle;
	}
	public String getInvitationMessage() {
		return invitationMessage;
	}
	public void setInvitationMessage(String invitationMessage) {
		this.invitationMessage = invitationMessage;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Plate getPlate() {
		return plate;
	}
	public void setPlate(Plate plate) {
		this.plate = plate;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Integer getIsPass() {
		return isPass;
	}
	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
	public Integer getIsEnable() {
		return isEnable;
	}
	public void setIsEnable(Integer isEnable) {
		this.isEnable = isEnable;
	}
	public Integer getIsCream() {
		return isCream;
	}
	public void setIsCream(Integer isCream) {
		this.isCream = isCream;
	}
	public Date getInvitationCreate() {
		return invitationCreate;
	}
	public void setInvitationCreate(Date invitationCreate) {
		this.invitationCreate = invitationCreate;
	}
	public Date getInvitationModify() {
		return invitationModify;
	}
	public void setInvitationModify(Date invitationModify) {
		this.invitationModify = invitationModify;
	}
}
