package com.bbs.service.impl;

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

}
