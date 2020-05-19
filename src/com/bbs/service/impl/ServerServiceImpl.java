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
	@Override
	public Plate findPlateByTitle(String plateTitle) {
		return plateMapper.findPlateByTitle(plateTitle);
	}

}
