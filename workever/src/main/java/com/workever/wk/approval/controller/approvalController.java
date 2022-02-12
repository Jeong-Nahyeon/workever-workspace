package com.workever.wk.approval.controller;

import java.util.ArrayList;

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
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.user.model.vo.User;

@Controller
public class approvalController {
	
	@Autowired
	private ApprovalService aService;

	@RequestMapping("enrollForm.ap")
	public String enrollForm() {
		
		return "approval/approvalEnrollForm";
	}
	
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
	
	@RequestMapping("dayOffForm.ap")
	public String dayOffForm() {
		return "approval/approvalDayOffForm";
	}
	
	@RequestMapping("overTimeForm.ap")
	public String overTimeForm() {
		return "approval/approvalOverTimeForm";
	}
	
	@RequestMapping("workReportForm.ap")
	public String workReportForm() {
		return "approval/approvalWorkReportForm";
	}
	
	@RequestMapping("buisnessTripForm.ap")
	public String buisnessTripForm() {
		return "approval/approvalBuisnessTripForm";
	}

	@RequestMapping("expenseReportForm.ap")
	public String expenseReportForm() {
		return "approval/approvalExpenseReportForm";
	}
}
