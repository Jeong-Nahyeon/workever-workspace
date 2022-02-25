package com.workever.wk.organogram.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.organogram.model.service.OrganogramService;
import com.workever.wk.user.model.service.UserService;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

@Controller
public class OrganogramController {
	
	@Autowired
	private OrganogramService oService;
	
	@Autowired
	private UserService uService; 
	
	// 조직도 화면 연결
	@RequestMapping("organogram.do")
	public String organogramPage(@RequestParam(value="opage", defaultValue="1") int currentPage, HttpSession session, Model model) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		String comNo = loginUser.getComNo();
		System.out.println("조직도 : "  + loginUser);
		
		// 부서 목록 조회
		ArrayList<Dept> deptList = oService.selectDept(comNo); 
		
		// 사원 조회
		int listCount = oService.selectUserListCount(loginUser);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<User> userList = oService.selectAllUser(loginUser, pi);
		
		model.addAttribute("userList", userList);
		model.addAttribute("pi", pi);
		model.addAttribute("deptList", deptList);
		
		
		return "organogram/organogram";
	}
}
