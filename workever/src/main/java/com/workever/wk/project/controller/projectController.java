package com.workever.wk.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class projectController {
	
	@RequestMapping("list.pro")
	public String projectList() {
		return "project/projectDetailView";
		
	}
	
	@RequestMapping("enroll.pro")
	public String enrollProject() {
		return "project/projectEnrollForm";
		
	}
	
	@RequestMapping("detail.pro")
	public String detailProject() {
		return "project/projectDetailView";
		
	}
	
	//업무조회 리스트이동 
	@RequestMapping("list.work")
	public String workList() {
		return "project/workListView";
		
	}
}
