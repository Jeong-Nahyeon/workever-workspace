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
	public String organogramPage(@RequestParam(value="opage", defaultValue="1") int currentPage, @RequestParam(value="dept", defaultValue="0")String dept,
			HttpSession session, Model model) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		loginUser.setOrgCategory(dept);
		String comNo = loginUser.getComNo();
		System.out.println("조직도 : "  + loginUser);
		
		int listCount = 0;
		PageInfo pi = new PageInfo();
		ArrayList<User> userList = new ArrayList<>();
		
		// 부서 목록 조회
		ArrayList<Dept> deptList = oService.selectDept(comNo); 
		
		if(dept.equals("0")) {
			listCount = oService.selectUserListCount(loginUser);
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			userList = oService.selectAllUser(loginUser, pi);
		}else {
			listCount = oService.selectUserDeptListCount(loginUser);
			pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
			userList = oService.selectUser(loginUser, pi);
		}
		
		// 사원 조회
		//int listCount = oService.selectUserListCount(loginUser);
		//PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		//ArrayList<User> userList = oService.selectAllUser(loginUser, pi);
		
		
		model.addAttribute("userList", userList);
		model.addAttribute("pi", pi);
		model.addAttribute("deptList", deptList);
		
		
		return "organogram/organogram";
	}
	
	// 부서 등록
	@RequestMapping("addDept.do")
	public String insertDept(Dept dept, HttpSession session, Model model) {
		int result = oService.insertDept(dept);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "새로운 부서를 추가했습니다.");
			return "redirect:/organogram.do";
		}else {
			model.addAttribute("errorMsg", "부서 추가 실패");
			return "common/errorMsg";
		}
	}
	
	// 부서 수정
	@RequestMapping("updateDept.do")
	public String updateDept(Dept dept, HttpSession session, Model model) {
		int result = oService.updateDept(dept);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "부서 이름을 수정했습니다.");
			return "redirect:/organogram.do";
		}else {
			model.addAttribute("errorMsg", "부서 수정 실패");
			return "common/errorMsg";
		}
	}
	
	// 부서 삭제
	@RequestMapping("deleteDept.do")
	public String deleteDept(Dept dept, HttpSession session, Model model) {
		int result = oService.deleteDept(dept);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "해당 부서를 삭제했습니다.");
			return "redirect:/organogram.do";
		}else {
			model.addAttribute("errorMsg", "부서 삭제 실패");
			return "common/errorMsg";
		}
	}
}
