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

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.commute.model.service.CommuteService;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.User;

@Controller
public class adCommuteController {
	
	@Autowired
	private CommuteService cService;
	
	

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
	
	@RequestMapping("adCommute.wh")
	public String adWorkingHours() {
		return "commute/adWorkingHours";
	}
	
	@RequestMapping("adCommute.do")
	public String adDayoffList() {
		return "commute/adDayoffList";
	}
	
	@RequestMapping("adCommute.ot")
	public String adOvertimeList() {
		return "commute/adOvertimeList";
	}
}
