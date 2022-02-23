package com.workever.wk.calendar.controller;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

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
	private CalendarService cServcie;
	
	@RequestMapping("deptCalendar.do")
	public String deptCalendar() {
		
		return "schedule/deptCalendar";
	}
	
	// 전사캘린더 페이지 연결
	@RequestMapping("companyCalendar.do")
	public String companyCalendarList(HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("loginUser");
		ArrayList<Calendar> campanyCalendar = cServcie.selectCompanyCalendar(user);
		
		model.addAttribute("companyCalendar", campanyCalendar);
		return "schedule/companyCalendar";
	}
	
	// 전사 일정 조회 (ajax)
	@ResponseBody
	@RequestMapping("calendarlist.co")
	public String companyCalendarList(HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		System.out.println(user);
		
		ArrayList<Calendar> campanyCalendar = cServcie.selectCompanyCalendar(user);
		Gson gson = new Gson();
		return gson.toJson(campanyCalendar);
	}
	
	@RequestMapping("insertCalendar.cam")
	public String insertCalendarCompany(Calendar calendar, HttpSession session, Model model) throws ParseException {
		//System.out.println(calendar);
		
		String sstart = calendar.getCalStartDate();
		String send = calendar.getCalEndDate();
		
		// 날짜 형식 변환
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm a", Locale.ENGLISH);
		SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm", Locale.ENGLISH);
		Date dStart = format.parse(sstart);
		Date dEnd = format.parse(send);
		String startDate = format2.format(dStart);
		String endDate = format2.format(dEnd);
		
		calendar.setCalStartDate(startDate);
		calendar.setCalEndDate(endDate);
		
		int result = cServcie.insertCalendarCompany(calendar);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "일정을 등록했습니다.");
			return "redirect:/companyCalendar.do";
		}else {
			model.addAttribute("errorMsg", "일정등록 실패");
			return "common/errorPage";
		}
	}

}
