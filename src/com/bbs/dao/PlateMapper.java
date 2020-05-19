package com.bbs.dao;

import java.util.List;

import com.bbs.pojo.Plate;

public interface PlateMapper {
	Plate findPlateByTitle(String plateTitle);
	
	int addNewPlate(Plate plate);
	
	List<Plate> findAllPlates();
}
