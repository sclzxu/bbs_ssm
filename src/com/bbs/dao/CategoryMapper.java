package com.bbs.dao;

import java.util.List;

import com.bbs.pojo.Category;

public interface CategoryMapper {
	Category findCategoryByTitle(String category);
	
	int addNewCategory(String category);
	
	List<Category> findAllCategories();
	
	Category findCategoryById(Integer categoryId);
	
	int updateCategoryById(Category category);
	
	int delCategoryById(Integer categoryId);
}




