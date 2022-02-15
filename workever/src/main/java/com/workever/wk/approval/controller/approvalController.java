package com.workever.wk.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.approval.model.service.ApprovalService;
import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.approval.model.vo.ApprovalBuisnessTripForm;
import com.workever.wk.approval.model.vo.ApprovalDayOffForm;
import com.workever.wk.approval.model.vo.ApprovalExpenseReportForm;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.approval.model.vo.ApprovalOverTimeForm;
import com.workever.wk.approval.model.vo.ApprovalWorkReportForm;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

@Controller
public class approvalController {
	
	@Autowired
	private ApprovalService aService;

	
	// 내가 작성한 결재 리스트 조회
	@RequestMapping("writeList.ap")
	public String userWriteApprovalList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());
		
		int listCount = aService.userWriteListCount(loginUserNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> list = aService.userWriteApprovalList(pi, loginUserNo);
		ArrayList<ApprovalLine> lineList = new ArrayList<>();
		for(Approval a : list) {
			
			switch(a.getApvlStatus()) {
				case "S": a.setApvlStatus("결재 대기"); break;
				case "I": a.setApvlStatus("진행중"); break;
				case "C": a.setApvlStatus("승인"); break;
				case "R": a.setApvlStatus("반려"); break;
				case "D": a.setApvlStatus("회수"); break;
			}
			lineList.addAll(aService.approvalLineList(a.getApvlNo()));
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lineList", lineList);
		
		return "approval/approvalUserWriteList";
	}
	
	// 내가 작성한 결재 리스트 카테고리별 조회
	@RequestMapping("writeChangeCategory.ap")
	public String writeChangeCategoryList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, String category, HttpSession session) {
		
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());
		System.out.println(category);
		int listCount = aService.writeChangeCategoryListCount(category, loginUserNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> list = aService.writeChangeCategoryList(pi, category, loginUserNo);
		
		ArrayList<ApprovalLine> lineList = new ArrayList<>();
		for(Approval a : list) {			
			switch(a.getApvlStatus()) {
				case "S": a.setApvlStatus("결재 대기"); break;
				case "I": a.setApvlStatus("진행중"); break;
				case "C": a.setApvlStatus("승인"); break;
				case "R": a.setApvlStatus("반려"); break;
				case "D": a.setApvlStatus("회수"); break;
			}
			lineList.addAll(aService.approvalLineList(a.getApvlNo()));
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lineList", lineList);
		model.addAttribute("category", category);
		
		return "approval/approvalUserWriteList";
	}
	
	// 내가 수신한 결재 리스트 조회
	@RequestMapping("receiveList.ap")
	public String userReceiveApprovalList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());
		
		int listCount = aService.userReceiveListCount(loginUserNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> list = aService.userReceiveApprovalList(pi, loginUserNo);
		ArrayList<ApprovalLine> lineList = new ArrayList<>();
		for(Approval a : list) {
			switch(a.getApvlStatus()) {
				case "S": a.setApvlStatus("결재 대기"); break;
				case "A": a.setApvlStatus("승인 처리"); break;
				case "R": a.setApvlStatus("반려 처리"); break;
			}
			lineList.addAll(aService.approvalLineList(a.getApvlNo()));
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lineList", lineList);

		return "approval/approvalUserReceiveList";
	}
	
	// 내가 수신한 결재 리스트 카테고리별 조회
		@RequestMapping("receiveChangeCategory.ap")
		public String receiveChangeCategoryList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, String category, HttpSession session) {
			
			int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());
			
			int listCount = aService.receiveChangeCategoryListCount(category, loginUserNo);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Approval> list = aService.receiveChangeCategoryList(category, pi, loginUserNo);
			ArrayList<ApprovalLine> lineList = new ArrayList<>();
			for(Approval a : list) {
				switch(a.getApvlStatus()) {
					case "S": a.setApvlStatus("결재 대기"); break;
					case "A": a.setApvlStatus("승인 처리"); break;
					case "R": a.setApvlStatus("반려 처리"); break;
				}
				lineList.addAll(aService.approvalLineList(a.getApvlNo()));
			}
			
			model.addAttribute("pi", pi);
			model.addAttribute("list", list);
			model.addAttribute("lineList", lineList);
			model.addAttribute("category", category);

			return "approval/approvalUserReceiveList";
		}
	/*
	// 내가 작성한 결재 리스트 카테고리별 조회(ajax)
	@ResponseBody
	@RequestMapping(value="receiveChangeCategory.ap", produces="application/json; charset=utf-8")
	public String ajaReceiveChangeCategoryList(String category, String loginUser, int cpage, Model model) {
		int loginUserNo = Integer.parseInt(loginUser);
		
		int listCount = aService.receiveChangeCategoryListCount(category, loginUserNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 10);
		
		ArrayList<Approval> list = aService.receiveChangeCategoryList(category, pi, loginUserNo);
		ArrayList<ApprovalLine> lineList = new ArrayList<>();
		for(Approval a : list) {			
			switch(a.getApvlStatus()) {
				case "S": a.setApvlStatus("결재 대기"); break;
				case "I": a.setApvlStatus("진행중"); break;
				case "C": a.setApvlStatus("승인"); break;
				case "R": a.setApvlStatus("반려"); break;
				case "D": a.setApvlStatus("회수"); break;
			}
			lineList.addAll(aService.approvalLineList(a.getApvlNo()));
		}
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("lineList", lineList);
		
		System.out.println(new Gson().toJson(model));
		return new Gson().toJson(model);
	}
	*/
	
	// 전자결재 등록 페이지
	@RequestMapping("enrollForm.ap")
	public String enrollForm(Model model, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		ArrayList<Dept> dept = aService.selectDeptList(Integer.parseInt(loginUser.getComNo()));
		
		model.addAttribute("dept", dept);
		return "approval/approvalEnrollForm";
	}
	
	// 부서별 사원 조회(ajax)
	@ResponseBody
	@RequestMapping(value="deptUserSelect.ap", produces="application/json; charset=utf-8")
	public String ajaxDeptUserSelect(String deptNo, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("deptNo", deptNo);
		map.put("loginUserNo", Integer.parseInt(loginUser.getUserNo()));
		map.put("comNo", Integer.parseInt(loginUser.getComNo()));
		ArrayList<User> deptUser = aService.selectDeptUserList(map);
		return new Gson().toJson(deptUser);
	}
	
	// 사원 검색(ajax)
	@ResponseBody
	@RequestMapping(value="userSearch.ap", produces="application/json; charset=utf-8")
	public String ajaxUserSearchList(String keyword, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("loginUserNo", Integer.parseInt(loginUser.getUserNo()));
		map.put("comNo", Integer.parseInt(loginUser.getComNo()));
		ArrayList<User> searchUser = aService.userSearchList(map);

		return new Gson().toJson(searchUser);
	}
	
	// 사원 선택(ajax)
	@ResponseBody
	@RequestMapping(value="userSelect.ap", produces="application/json; charset=utf-8")
	public String ajaxSelectUser(int selectUserNo) {
		User user = aService.selectUser(selectUserNo);
		System.out.println(user);
		return new Gson().toJson(user);
	}
	
	// 휴가 신청서
	@RequestMapping("dayOffForm.ap")
	public String dayOffForm(HttpSession session, Model model) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());		
		String userDeptName = aService.loginUSerDeptName(loginUserNo);
		model.addAttribute("userDeptName", userDeptName);
		
		return "approval/approvalDayOffForm";
	}
	
	// 연장근무 신청서
	@RequestMapping("overTimeForm.ap")
	public String overTimeForm(HttpSession session, Model model) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());		
		String userDeptName = aService.loginUSerDeptName(loginUserNo);
		model.addAttribute("userDeptName", userDeptName);
		return "approval/approvalOverTimeForm";
	}
	
	// 업무보고서
	@RequestMapping("workReportForm.ap")
	public String workReportForm(HttpSession session, Model model) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());		
		String userDeptName = aService.loginUSerDeptName(loginUserNo);
		model.addAttribute("userDeptName", userDeptName);
		return "approval/approvalWorkReportForm";
	}
	
	// 출장 신청서
	@RequestMapping("buisnessTripForm.ap")
	public String buisnessTripForm(HttpSession session, Model model) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());		
		String userDeptName = aService.loginUSerDeptName(loginUserNo);
		model.addAttribute("userDeptName", userDeptName);
		return "approval/approvalBuisnessTripForm";
	}
	
	// 지출품의서
	@RequestMapping("expenseReportForm.ap")
	public String expenseReportForm(HttpSession session, Model model) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());		
		String userDeptName = aService.loginUSerDeptName(loginUserNo);
		model.addAttribute("userDeptName", userDeptName);
		return "approval/approvalExpenseReportForm";
	}  
	
	// 전자결재 등록
	@RequestMapping("insert.ap")
	public String insertApproval(String lineUser, Approval apvl, ApprovalBuisnessTripForm apvlBtf, ApprovalDayOffForm apvlDof, ApprovalExpenseReportForm apvlErf, ApprovalOverTimeForm apvlOtf, ApprovalWorkReportForm apvlWrf) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		String[] lineUserNo = lineUser.split(","); 
		map.put("apvl", apvl);
		map.put("lineUserNo", lineUserNo);		
		
		switch(Integer.parseInt(apvl.getApvlFormNo())) {
			case 1 : 
				map.put("apvlDof", apvlDof);break;
			case 2 : 
				map.put("apvlOtf", apvlDof);break;
			case 3 : 
				map.put("apvlWrf", apvlWrf);break;
			case 4 : 
				map.put("apvlErf", apvlErf);break;
			case 5 : 
				map.put("apvlBtf", apvlBtf);break;
		}
		
		int result = aService.insertApproval(map);
		
		System.out.println(lineUser);
		System.out.println(apvl);
		System.out.println(apvlBtf);
		System.out.println(apvlDof);
		System.out.println(apvlErf);
		System.out.println(apvlOtf);
		System.out.println(apvlWrf);
		
		return "redirect:writeList.ap";
	}
}
