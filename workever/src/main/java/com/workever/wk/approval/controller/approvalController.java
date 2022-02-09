package com.workever.wk.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class approvalController {

	@RequestMapping("enrollForm.ap")
	public String enrollForm() {
		
		return "approval/approvalEnrollForm";
	}
	
	@RequestMapping("writeList.ap")
	public String userWriteList() {
		
		return "approval/approvalUserWriteList";
	}
	
	@RequestMapping("receiveList.ap")
	public String userReceiveList() {
		
		return "approval/approvalUserReceiveList";
	}

}
