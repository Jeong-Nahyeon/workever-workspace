package com.workever.wk.commute.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommuteController {
	
	@RequestMapping("main.cm")
	public String commuteManagement() {
		return "commute/commuteManagement";
	}
}
