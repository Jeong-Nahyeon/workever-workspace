package com.workever.wk.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class projectController {
	
	@RequestMapping("list.pro")
	public String projectList() {
		return "project/projectListView";
		
	}
	

}
