package com.workever.wk.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workever.wk.user.model.service.UserService;
import com.workever.wk.user.model.vo.User;

@Controller
public class UserController {
	
	@Autowired
	private UserService uService;

	// 회원가입 폼 페이지 연결
	@RequestMapping("enrollForm.ad")
	public String enrollFormAdmin() {
		return "user/enrollFormCompany";
	}
	
	// 로그인 페이지 연결
	@RequestMapping("login.do")
	public String loginPage() {
		return "user/login";
	}
	
	// 로그인 서비스
	@RequestMapping("login.us")
	public String loginUser(User u, HttpSession session, Model model) {
		User loginUser = uService.loginUser(u);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "user/main";
		}else {
			model.addAttribute("errorMsg", "로그인 실패");
			return "common/errorPage";
		}
	}
}
