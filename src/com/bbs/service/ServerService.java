package com.bbs.service;

import java.util.List;

import com.bbs.pojo.Category;
import com.bbs.pojo.Invitation;
import com.bbs.pojo.Plate;

public interface ServerService {
	Plate findPlateByTitle(String plateTitle);
	
	int addNewPlate(Plate plate);
	
	List<Plate> findAllPlates();
	
	int updatePlateIsEnableById(Integer plateId);
	
	int updatePlateUnIsEnableById(Integer plateId);
	
	Plate findPlateById(Integer plateId);
	
	int updatePlateById(Plate plate);
	
	Category findCategoryByTitle(String category);
	
	int addNewCategory(String category);
	
	List<Category> findAllCategories();
	
	Category findCategoryById(Integer categoryId);
	
	int updateCategoryById(Category category);
	
	int delCategoryById(Integer categoryId);
	
	List<Invitation> findAllInvitationByCategoryId(Integer categoryId);
}













