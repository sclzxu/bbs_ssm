package com.bbs.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bbs.dao.PlateMapper;
import com.bbs.pojo.Plate;
import com.bbs.service.ServerService;

@Service("serverService")
public class ServerServiceImpl implements ServerService {
	@Resource
	private PlateMapper plateMapper;
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

}
