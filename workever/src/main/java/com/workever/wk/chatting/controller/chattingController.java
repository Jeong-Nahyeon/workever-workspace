package com.workever.wk.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chattingController {
	
	@RequestMapping("addressBook.do")
	public String addressBook() {
		return "chatting/addressBook"; 
	}
	
	@RequestMapping("detail.ch")
	public String chatDetailView() {
		return "chatting/chatDetailView";
	}
	
	@RequestMapping("invitation.ch")
	public String chatInvitationList() {
		return "chatting/chatInvitationList";
	}
}
