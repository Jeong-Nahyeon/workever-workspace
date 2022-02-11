package com.workever.wk.commute.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.commute.model.service.CommuteService;
import com.workever.wk.commute.model.vo.Commute;

@Controller
public class CommuteController {
	
	@Autowired
	private CommuteService cService;
	
	
	@RequestMapping("commute.cm")
	public String commuteManagement() {
		return "commute/commuteManagement";
	}
	
	@ResponseBody
	@RequestMapping("list.cm")
	public String selectCommuteList(/*@RequestParam(value="cpage", defaultValue="1")*/ int currentPage , int userNo) {
		
		int listCount = cService.cmSelectListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Commute> list = cService.cmSelectList(userNo, pi);
		
		HashMap<String, Object> result = new HashMap<>();
		result.put("pi", pi);
		result.put("list", list);
		
		return new Gson().toJson(result);
	}
	
	/*
	@RequestMapping("enter.cm")
	public void insertEnter(int uno) {
		
		int result = cService.insertEnter(uno);
		
	}
	*/
	
	@RequestMapping("commute.wh")
	public String workingHours() {
		return "commute/workingHours";
	}
	
	@RequestMapping("commute.do")
	public String dayoffList() {
		return "commute/dayoffList";
	}
	
	@RequestMapping("commute.ot")
	public String overtimeList() {
		return "commute/overtimeList";
	}
}
