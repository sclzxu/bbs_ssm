package com.bbs.service;

import java.util.List;

import com.bbs.pojo.Plate;

public interface ServerService {
	Plate findPlateByTitle(String plateTitle);
	
	int addNewPlate(Plate plate);
	
	List<Plate> findAllPlates();
}
