package com.workever.wk.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuteController {
	
	@RequestMapping("commute.cm")
	public String commuteManagement() {
		return "commute/commuteManagement";
	}
	
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
