package com.bbs.service;

import com.bbs.pojo.Plate;

public interface ServerService {
	Plate findPlateByTitle(String plateTitle);
	
	int addNewPlate(Plate plate);
}
