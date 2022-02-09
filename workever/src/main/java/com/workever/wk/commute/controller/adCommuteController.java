package com.workever.wk.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class adCommuteController {

	@RequestMapping("adCommute.cm")
	public String adCommuteManagement() {
		return "commute/adCommuteManagement";
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
