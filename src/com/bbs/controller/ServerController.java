package com.bbs.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.bbs.pojo.Category;
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
	public String manageAddPlate(@Valid Plate plate,BindingResult bindingResult,
			Model model) {
		model.addAttribute("plate", plate);
		if(bindingResult.hasErrors()) {
			model.addAttribute("error", "标题不能少于两个字符");
			return "manage_add_plate";
		}
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
	// 跳转到 manage_alter_plate.jsp 页面
	@RequestMapping(value="/manage_alter_plate/{plateId}",method=RequestMethod.GET)
	public String manageAlterPlate(@PathVariable Integer plateId,Model model) {
		// 根据 id 查找 plate
		Plate result = serverService.findPlateById(plateId);
		model.addAttribute("plate", result);
		return "manage_alter_plate";
	}
	// 根据 id 修改对的板块信息
	@RequestMapping(value="/manage_alter_plate",method=RequestMethod.POST)
	public String manageAlterPlate(@Valid Plate plate,BindingResult bindingResult,
			Model model) {
		model.addAttribute("plate", plate);
		if(bindingResult.hasErrors()) { // 校验失败
			model.addAttribute("error","标题不能少于两个字符");
			return "manage_alter_plate";
		}
		// 根据板块标题查找板块信息
		Plate result = serverService.findPlateByTitle(plate.getPlateTitle());
		// 判断查找到的这个 Plate 是否存在并且是否是当前的 Plate（标题重名）
		if(result!=null && result.getPlateId()!=plate.getPlateId()) {
			model.addAttribute("error","标题重复了");
			return "manage_alter_plate";
		}
		// 根据 id 修改板块信息
		serverService.updatePlateById(plate);
		model.addAttribute("error", "修改成功");
		return "manage_alter_plate";
	}
	// 跳转到分类列表页面
	@RequestMapping(value="/manage_category",method=RequestMethod.GET)
	public String manageCategory(Model model) {
		List<Category> categories = serverService.findAllCategories();
		model.addAttribute("categories", categories);
		return "manage_category";
	}
	// 跳转到添加分页页面
	@RequestMapping(value="/manage_add_category",method=RequestMethod.GET)
	public String manageAddCategory(@ModelAttribute Category category) {
		return "manage_add_category";
	}
	// 实现添加分类功能
	@RequestMapping(value="/manage_add_category",method=RequestMethod.POST)
	public String manageAddCategory(@Valid Category category,BindingResult bindingResult,
			Model model) {
		model.addAttribute("category", category);
		if(bindingResult.hasErrors()) {
			return "manage_add_category";
		}
		if(serverService.addNewCategory(category.getCategory()) == 0) {
			model.addAttribute("error","不同添加相同的分类名称");
			return "manage_add_category";
		}
		return "redirect:/server/manage_category";
	}
	// 跳转到分类修改页面
	@RequestMapping(value="/manage_alter_category/{categoryId}",method=RequestMethod.GET)
	public String manageAlterCategory(@PathVariable Integer categoryId,Model model) {
		// 根据 id 获取分类类型
		Category category = serverService.findCategoryById(categoryId);
		model.addAttribute("category", category);
		return "manage_alter_category";
	}
	// 实现修改分类功能
	@RequestMapping(value="/manage_alter_category",method=RequestMethod.POST)
	public String manageAlterCategory(@ModelAttribute Category category,Model model) {
		// 根据标题获取分类类型
		Category result = serverService.findCategoryByTitle(category.getCategory());
		// 判断输入的新标题是否跟其他的标题同名
		if(result!=null && result.getCategoryId()!=category.getCategoryId()) {
			model.addAttribute("error","此分类已经存在");
			return "manage_alter_category";
		}
		// 修改分类名称
		serverService.updateCategoryById(category);
		model.addAttribute("error", "修改分类名称成功");
		return "manage_alter_category";
	}
	@RequestMapping(value="/del_category/{categoryId}",method=RequestMethod.GET)
	public String delCategory(@PathVariable Integer categoryId) {
		serverService.delCategoryById(categoryId);
		return "redirect:/server/manage_category";
	}
}






