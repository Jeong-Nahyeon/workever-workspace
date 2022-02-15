package com.workever.wk.commute.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
