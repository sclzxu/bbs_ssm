package com.bbs.dao;

import com.bbs.pojo.Level;

public interface LevelMapper {
	Level findLevelByMessage(String levelMessage);
}
