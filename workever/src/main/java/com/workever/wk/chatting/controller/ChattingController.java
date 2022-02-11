package com.workever.wk.chatting.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.workever.wk.chatting.model.service.ChattingService;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.user.model.vo.User;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService cService;
	
	
	@RequestMapping("addressBook.do")
	public String addressBook(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = cService.abSelectListCount(); // 현재 유효한 사원이 몇명이냐
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		ArrayList<User> list = cService.abSelectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
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