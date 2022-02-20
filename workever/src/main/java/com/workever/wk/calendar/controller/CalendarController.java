package com.workever.wk.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController {
	
	@RequestMapping("deptCalendar.do")
	public String deptCalendar() {
		return "schedule/deptCalendar";
	}
}
