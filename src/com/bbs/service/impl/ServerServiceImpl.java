package com.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.dao.CategoryMapper;
import com.bbs.dao.InvitationMapper;
import com.bbs.dao.PlateMapper;
import com.bbs.pojo.Category;
import com.bbs.pojo.Invitation;
import com.bbs.pojo.Plate;
import com.bbs.service.ServerService;

@Service("serverService")
public class ServerServiceImpl implements ServerService {
	@Resource
	private PlateMapper plateMapper;
	@Resource
	private CategoryMapper categoryMapper;
	@Resource
	private InvitationMapper invitationMapper;
	// 根据板块名称查找对应板块
	@Override
	public Plate findPlateByTitle(String plateTitle) {
		return plateMapper.findPlateByTitle(plateTitle);
	}
	// 添加新的板块
	@Override
	public int addNewPlate(Plate plate) {
		return plateMapper.addNewPlate(plate);
	}
	// 获取所有板块信息
	@Override
	public List<Plate> findAllPlates() {
		return plateMapper.findAllPlates();
	}
	// 根据 id 修改对应 plate 为屏蔽状态
	@Override
	public int updatePlateIsEnableById(Integer plateId) {
		return plateMapper.updatePlateIsEnableById(plateId);
	}
	// 根据 id 修改对应的 plate 为解除屏蔽状态
	@Override
	public int updatePlateUnIsEnableById(Integer plateId) {
		return plateMapper.updatePlateUnIsEnableById(plateId);
	}
	// 根据 id 查找对应 plate
	@Override
	public Plate findPlateById(Integer plateId) {
		return plateMapper.findPlateById(plateId);
	}
	// 根据 id 修改板块的标题和描述
	@Override
	public int updatePlateById(Plate plate) {
		return plateMapper.updatePlateById(plate);
	}
	// 根据分类名称查找分类
	@Override
	public Category findCategoryByTitle(String category) {
		return categoryMapper.findCategoryByTitle(category);
	}
	// 添加新分类
	@Override
	public int addNewCategory(String category) {
		if(findCategoryByTitle(category) != null)
			return 0;
		return categoryMapper.addNewCategory(category);
	}
	// 查找所有分类
	@Override
	public List<Category> findAllCategories() {
		return categoryMapper.findAllCategories();
	}
	// 根据 id 获取分类信息
	@Override
	public Category findCategoryById(Integer categoryId) {
		return categoryMapper.findCategoryById(categoryId);
	}
	// 根据 id 修改分类名称
	@Override
	public int updateCategoryById(Category category) {
		return categoryMapper.updateCategoryById(category);
	}
	// 根据分类 id 删除分类
	@Override
	public int delCategoryById(Integer categoryId) {
		// 已经存在贴子的分类，不能删除
		List<Invitation> invitations = findAllInvitationByCategoryId(categoryId);
		if(invitations.size() != 0)
			return 0;
		return categoryMapper.delCategoryById(categoryId);
	}
	// 根据分类 id 获取所有对应的贴子列表
	@Override
	public List<Invitation> findAllInvitationByCategoryId(Integer categoryId) {
		return invitationMapper.findAllInvitationByCategoryId(categoryId);
	}

}
