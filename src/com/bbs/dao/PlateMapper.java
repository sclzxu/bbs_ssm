package com.bbs.dao;

import com.bbs.pojo.Plate;

public interface PlateMapper {
	Plate findPlateByTitle(String plateTitle);
}
