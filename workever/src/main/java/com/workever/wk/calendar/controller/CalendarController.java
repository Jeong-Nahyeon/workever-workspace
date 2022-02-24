package com.workever.wk.calendar.controller;


import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.calendar.model.service.CalendarService;
import com.workever.wk.calendar.model.vo.Calendar;
import com.workever.wk.user.model.vo.User;

@Controller
public class CalendarController {
	
	@Autowired 
	private CalendarService cService;
	
	// 부서캘린더 페이지 연결
	@RequestMapping("deptCalendar.do")
	public String deptCalendar() {
		
		return "schedule/deptCalendar";
	}
	
	// 전사캘린더 페이지 연결
	@RequestMapping("companyCalendar.do")
	public String companyCalendar(HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("loginUser");
		ArrayList<Calendar> campanyCalendar = cService.selectCompanyCalendar(user);
		
		model.addAttribute("companyCalendar", campanyCalendar);
		return "schedule/companyCalendar";
	}
	
	// 개인캘린더 페이지 연결
	@RequestMapping("userCalendar.do")
	public String userCalendar() {
		return "schedule/userCalendar";
	}
	
	// 일정 조회 (ajax)
	@ResponseBody
	@RequestMapping("calendarlist.cal")
	public String companyCalendarList(String category, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		
		if(category.equals("전사")) {
			ArrayList<Calendar> campanyCalendar = cService.selectCompanyCalendar(user);
			Gson gson = new Gson();
			return gson.toJson(campanyCalendar);
			
		}else if(category.equals("부서")) {
			ArrayList<Calendar> deptCalendar = cService.selectDeptCalendar(user);
			ArrayList<Calendar> deptDayOff = cService.selectDeptDayoff(user);
			for(Calendar i : deptDayOff) {
				i.setCalColor("#A4A4A4");
			}
			System.out.println(deptDayOff);
			
			List<Calendar> allDeptCalendar = new ArrayList<>();
			allDeptCalendar.addAll(deptCalendar);
			allDeptCalendar.addAll(deptDayOff);
			
			Gson gson = new Gson();
			return gson.toJson(allDeptCalendar);
			
		}else {
			ArrayList<Calendar> userCalendar = cService.selectUserCalendar(user);
			Gson gson = new Gson();
			return gson.toJson(userCalendar);
		}
		
	}
	
	// 일정 등록
	@RequestMapping("insertCalendar.cal")
	public String insertCalendarCompany(Calendar calendar, HttpSession session, Model model) throws ParseException {
		
		int result = cService.insertCalendar(calendar);

		if(result > 0) {
			session.setAttribute("alertMsg", "일정을 등록했습니다.");
			if(calendar.getCalCategory().equals("전사")) {
				return "redirect:/companyCalendar.do";
			}else if(calendar.getCalCategory().equals("부서")) {
				return "redirect:/deptCalendar.do";
			}else {
				return "redirect:/userCalendar.do";
			}
		}else {
			model.addAttribute("errorMsg", "일정등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// 전사 일정 수정
	@RequestMapping("updateCalendar.cal")
	public String updateCalendarCompany(Calendar calendar, HttpSession session, Model model) {

		int result = cService.updateCalendar(calendar);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "일정을 수정했습니다.");
			if(calendar.getCalCategory().equals("전사")) {
				return "redirect:/companyCalendar.do";
			}else if(calendar.getCalCategory().equals("부서")) {
				return "redirect:/deptCalendar.do";
			}else {
				return "redirect:/userCalendar.do";
			}
		}else {
			model.addAttribute("errorMsg", "일정등록 실패");
			return "common/errorPage";
		}

	}
	
	// 전사 일정 삭제
	@RequestMapping("deleteCalendar.cal")
	public String deleteCalendarCompany(String calNo, HttpSession session, Model model) {
		//System.out.println(calNo);
		
		int result = cService.deleteCalendar(calNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "일정을 삭제했습니다.");
			return "redirect:/companyCalendar.do";
		}else {
			model.addAttribute("errorMsg", "일정삭제 실패");
			return "common/errorPage";
		}
	}

}
