package com.workever.wk.chatting.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.chatting.model.service.ChattingService;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.user.model.vo.User;

@Controller
public class ChattingController {
	
	@Autowired
	private ChattingService cService;
	
	private Logger logger = LoggerFactory.getLogger(ChattingController.class);
	
	
	
	@RequestMapping("addressBook.do")
	public String addressBook(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = cService.abSelectListCount(); // 현재 유효한 사원이 몇명이냐
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		ArrayList<User> list = cService.abSelectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "chatting/addressBook"; 
	}
	
	@ResponseBody
	@RequestMapping(value="search.ab", produces="application/json; charset=UTF-8")
	public String ajaxAddressBookSearch(String keyword) {
		
		ArrayList<User> searchList = cService.abSelectSearchList(keyword);
		return new Gson().toJson(searchList);
	}
	
	
	@RequestMapping("detail.ch")
	public String chatDetailView() {
		return "chatting/chatDetailView";
	}
	
	@RequestMapping("invitation.ch")
	public String chatInvitationList(Model model) {
		
		int listCount = cService.abSelectListCount();
		
		ArrayList<User> list = cService.ivSelectList();
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "chatting/chatInvitationList"; 
	}
	
	
	@RequestMapping("chat.do")
	public String chat(Model model) {
		logger.info("[Controller] : chat.do");
		
		return "chatting/chatting";
	}
}
