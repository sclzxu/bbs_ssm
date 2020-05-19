package com.bbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.bbs.pojo.Plate;
import com.bbs.service.ServerService;

@Controller
@RequestMapping("/server")
public class ServerController {
	@Resource
	private ServerService serverService;
	// 访问 manage.jsp 页面
	@RequestMapping(value="/manage",method=RequestMethod.GET)
	public String manage() {
		return "manage";
	}
	// 访问板块管理界面
	@RequestMapping(value="/manage_plate",method=RequestMethod.GET)
	public String managePlate(Model model) {
		// 获取所有的板块信息
		List<Plate> plates = serverService.findAllPlates();
		model.addAttribute("plates",plates);
		return "manage_plate";
	}
	// 访问添加板块界面
	@RequestMapping(value="/manage_add_plate",method=RequestMethod.GET)
	public String manageAddPlate(@ModelAttribute Plate plate) {
		return "manage_add_plate";
	}
	// 实现添加板块功能
	@RequestMapping(value="/manage_add_plate",method=RequestMethod.POST)
	public String manageAddPlate(@ModelAttribute Plate plate,Model model) {
		// 判断是否已经存在同标题的板块
		Plate result = serverService.findPlateByTitle(plate.getPlateTitle());
		if(result != null) {
			model.addAttribute("error", "不能添加同标题的板块");
			return "manage_add_plate";
		}
		serverService.addNewPlate(plate);
		return "redirect:/server/manage_plate";
	}
	// 异步校验板块标题是否已经存在
	@RequestMapping(value="manage_palte_exists",method=RequestMethod.POST)
	@ResponseBody
	public Object managePlateExists(String plateTitle) {
		Plate result = serverService.findPlateByTitle(plateTitle);
		Map<String,String> map = new HashMap<String,String>();
		if(null == result)
			map.put("status","noexists");
		else
			map.put("status","exists");
		return JSON.toJSONString(map);
	}
	// 屏蔽掉对应 plateId 的板块
	@RequestMapping(value="/manage_plate_shield/{plateId}",method=RequestMethod.GET)
	public String managePlateShield(@PathVariable Integer plateId) {
		serverService.updatePlateIsEnableById(plateId);
		return "redirect:/server/manage_plate";
	}
	// 解除掉对应 plateId 的 plate的屏蔽状态
	@RequestMapping(value="/manage_plate_unshield/{plateId}",method=RequestMethod.GET)
	public String managePlateUnShield(@PathVariable Integer plateId) {
		serverService.updatePlateUnIsEnableById(plateId);
		return "redirect:/server/manage_plate";
	}
}
