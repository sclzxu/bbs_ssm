package com.bbs.pojo;

import org.hibernate.validator.constraints.Length;

public class Category {
	private Integer categoryId;
	@Length(min=2,max=6,message="范围为2到6个字符")
	private String category;
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
