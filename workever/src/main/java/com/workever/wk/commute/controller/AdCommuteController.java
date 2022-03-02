package com.workever.wk.commute.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.commute.model.service.CommuteService;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.User;

@Controller
public class AdCommuteController {
	
	@Autowired
	private CommuteService cService;
	
	
	// 출퇴근 관리

	@RequestMapping("adCommute.cm")
	public String adCommuteManagement() {
		return "commute/adCommuteManagement";
	}
	
	@ResponseBody
	@RequestMapping(value="adList.cm", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxAdSelectCommuteList(int currentPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		int listCount = cService.adCmSelectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Commute> list = cService.adCmSelectList(pi);
		
		map.put("listCount", listCount);
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping("adAbsenceHandle.cm")
	public String adAbsenceHandle(HttpSession session) {
		
		ArrayList<User> absenceUserList = cService.adSelectAbsenceUserList();
		
		System.out.println(absenceUserList);
		
		int result = cService.adInsertAbsence(absenceUserList);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "결근 처리 성공");
			return "redirect:adCommute.cm";
		} else {
			session.setAttribute("alertMsg", "결근 처리 실패");
			return "redircet:adCommute.cm";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="adSearch.cm", produces="application/json; charset=UTF-8")
	public String ajaxAdCmSelectSearch(String startday, String endday, String userName, int cmStatus, int currentPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startday", startday);
		map.put("endday", endday);
		map.put("userName", userName);
		map.put("cmStatus", cmStatus);
		
		int searchCount = cService.adCmSelectSearchCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		ArrayList<Commute> searchList = cService.adCmSelectSearchList(map, pi);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("searchCount", searchCount);
		result.put("searchList", searchList);
		result.put("pi", pi);
		
		return new Gson().toJson(result);
		
	}
	
	
	
	// 근무 내역
	
	@RequestMapping("adCommute.wh")
	public String adWorkingHours() {
		return "commute/adWorkingHours";
	}
	
	
	// 휴가 관리
	
	@RequestMapping("adCommute.do")
	public String adDayoffList() {
		return "commute/adDayoffList";
	}
	
	@ResponseBody
	@RequestMapping(value="adList.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxAdSelectDayoffList(int currentPage) {
		
		int listCount = cService.adDoSelectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Approval> list = cService.adDoSelectList(pi);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listCount", listCount);
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="adSearch.do", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxAdSelectDayoffSearch(String startday, String endday, int offdayKind, String userName, int currentPage) {
		
		System.out.println("startday : " + startday);
		System.out.println("endday :" + endday);
		System.out.println("offdayKind : " + offdayKind);
		System.out.println("userName : " + userName);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startday", startday);
		map.put("endday", endday);
		map.put("offdayKind", offdayKind);
		map.put("userName", userName);
		
		int searchCount = cService.adDoSelectSearchCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		System.out.println("Count : " + searchCount);
		
		ArrayList<Approval> searchList = cService.adDoSelectSearchList(map, pi);
		
		System.out.println("searchList : " + searchList);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("searchCount", searchCount);
		result.put("searchList", searchList);
		result.put("pi", pi);
		
		return new Gson().toJson(result);
	}
	
	
	
	// 연장근무 관리
	
	@RequestMapping("adCommute.ot")
	public String adOvertimeList() {
		return "commute/adOvertimeList";
	}
	
	@ResponseBody
	@RequestMapping(value="adList.ot", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxAdSelectOvertimeList(int currentPage) {
		
		int listCount = cService.adOtSelectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Approval> list = cService.adOtSelectList(pi);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listCount", listCount);
		map.put("list", list);
		map.put("pi", pi);
		
		return new Gson().toJson(map);
		
	}
	
	@ResponseBody
	@RequestMapping(value="adSearch.ot", method=RequestMethod.POST, produces="application/json; charset=UTF-8")
	public String ajaxAdSelectOvertimeSearch(String startday, String endday, String userName, int currentPage) {
		
		System.out.println("startday : " + startday);
		System.out.println("endday :" + endday);
		System.out.println("userName : " + userName);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startday", startday);
		map.put("endday", endday);
		map.put("userName", userName);
		
		int searchCount = cService.adOtSelectSearchCount(map);
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 10);
		
		System.out.println("Count : " + searchCount);
		
		ArrayList<Approval> searchList = cService.adOtSelectSearchList(map, pi);
		
		System.out.println("searchList : " + searchList);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("searchCount", searchCount);
		result.put("searchList", searchList);
		result.put("pi", pi);
		
		return new Gson().toJson(result);
	}
}
