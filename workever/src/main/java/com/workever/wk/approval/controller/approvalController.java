package com.workever.wk.approval.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;


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
import com.workever.wk.approval.model.vo.ApprovalForm;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.approval.model.vo.ApprovalOverTimeForm;
import com.workever.wk.approval.model.vo.ApprovalWorkReportForm;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

@Controller
public class approvalController {
	
	@Autowired
	private ApprovalService aService;

	
	private static String AddDate(String strDate, int year, int month, int day) throws Exception { 
		SimpleDateFormat dtFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date dt = dtFormat.parse(strDate);
		cal.setTime(dt);
		cal.add(Calendar.YEAR, year);
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE, day);
		return dtFormat.format(cal.getTime()); 
	}

	
	
	// 내가 작성한 결재 리스트 조회
	@RequestMapping("writeList.ap")
	public String userWriteApprovalList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, HttpSession session) {
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		int listCount = aService.userWriteListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> list = aService.userWriteApprovalList(pi, loginUser);
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
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("category", category);
		map.put("loginUser", loginUser);
		int listCount = aService.writeChangeCategoryListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> list = aService.writeChangeCategoryList(pi, map);
		
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
		
		User loginUser = (User)session.getAttribute("loginUser");
		
		int listCount = aService.userReceiveListCount(loginUser);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Approval> list = aService.userReceiveApprovalList(pi, loginUser);
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
			
			User loginUser = (User)session.getAttribute("loginUser");
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("category", category);
			map.put("loginUser", loginUser);
			System.out.println(category);
			int listCount = aService.receiveChangeCategoryListCount(map);
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
			ArrayList<Approval> list = aService.receiveChangeCategoryList(pi, map);
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
		ArrayList<ApprovalForm> formList = aService.selectFormList(Integer.parseInt(loginUser.getComNo()));
		model.addAttribute("formList", formList);
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
	public String insertApproval(String lineUser, Approval apvl, ApprovalBuisnessTripForm apvlBtf, ApprovalDayOffForm apvlDof, ApprovalExpenseReportForm apvlErf, ApprovalOverTimeForm apvlOtf, ApprovalWorkReportForm apvlWrf, HttpSession session, Model model) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		String[] lineUserNo = lineUser.split(","); 
		map.put("apvl", apvl);
		map.put("lineUserNo", lineUserNo);		
		
		switch(Integer.parseInt(apvl.getApvlFormNo())) {
			case 1 : 
				map.put("form", apvlDof);break;
			case 2 : 
				map.put("form", apvlOtf);break;
			case 3 : 
				map.put("form", apvlWrf);break;
			case 4 : 
				map.put("form", apvlErf);break;
			case 5 : 
				map.put("form", apvlBtf);break;
		}
		
		
		int result = aService.insertApproval(map);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "전자결재가 성공적으로 등록되었습니다.");
			return "redirect:writeList.ap";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}
		
	}
	
	// 전자결제 상세 조회
	@RequestMapping("detail.ap")
	public String selectApproval(int apvlNo, Model model) {
		Approval apvl = aService.selectApproval(apvlNo);
		ArrayList<ApprovalLine> lineList = aService.approvalLineList(apvlNo);
		int apvlFormNo = Integer.parseInt(apvl.getApvlFormNo());
		model.addAttribute("apvl", apvl);
		model.addAttribute("lineList", lineList);
		String page = "";
		switch(apvlFormNo) {
			case 1:
				ApprovalDayOffForm apvlDof = aService.selectDayOffForm(apvlNo);
				switch(apvlDof.getOffKind()) {
					case "1": apvlDof.setOffKind("연차"); break;
					case "2": apvlDof.setOffKind("병가"); break;
					case "3": apvlDof.setOffKind("공가"); break;
					case "4": apvlDof.setOffKind("정기 휴가"); break;
					case "5": apvlDof.setOffKind("출산 휴가"); break;
				}
				model.addAttribute("form", apvlDof);
				page =  "approval/approvalDayOffFormView";
				break;
			case 2:
				ApprovalOverTimeForm apvlOtf = aService.selectOverTimeForm(apvlNo);
				model.addAttribute("form", apvlOtf);
				page = "approval/approvalOverTimeFormView";
				break;
			case 3:
				ApprovalWorkReportForm apvlWrf = aService.selectWorkReportForm(apvlNo);
				model.addAttribute("form", apvlWrf);
				page = "approval/approvalWorkReportFormView";
				break;
			case 4:
				ApprovalExpenseReportForm apvlErf = aService.selectExpenseReportForm(apvlNo);
				model.addAttribute("form", apvlErf);
				page = "approval/approvalExpenseReportFormView";
				break;
			case 5:
				ApprovalBuisnessTripForm apvlBtf = aService.selectBuisnessTripForm(apvlNo);
				model.addAttribute("form", apvlBtf);
				page = "approval/approvalBuisnessTripFormView";
				break;
		}
		
		return page;
	}
	
	// 작성한 전자결재 삭제
	@RequestMapping("delete.ap")
	public String deleteApproval(int apvlNo, Model model, HttpSession session) {
		int result = aService.deleteApproval(apvlNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "전자결재가 성공적으로 삭제되었습니다.");
			return "redirect:writeList.ap";
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
		}

	}
	
	// 수신한 전자결재 반려
	@RequestMapping("return.ap")
	public String returnApproval(int apvlNo, String apvlReturnComment, Model model, HttpSession session) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());
		
		ApprovalLine returnApvl = new ApprovalLine();
		returnApvl.setApvlNo(apvlNo);
		returnApvl.setUserNo(loginUserNo);
		returnApvl.setApvlReturnComment(apvlReturnComment);
		
		int result = aService.returnApproval(returnApvl);
		
		if(result > 0) {
			return "redirect:detail.ap?apvlNo=" + apvlNo;
		}else {
			model.addAttribute("errorMsg", "반려 처리 실패");
			return "common/errorPage";
		}
	}
	
	// 수신한 전자결재 승인
	@RequestMapping("approve.ap")
	public String approveApproval(int apvlNo, Model model, HttpSession session) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());
		
		ApprovalLine approveApvl = new ApprovalLine();
		approveApvl.setApvlNo(apvlNo);
		approveApvl.setUserNo(loginUserNo);		
		
		int result = aService.approveApproval(approveApvl);
		
		if(result > 0) {
			return "redirect:detail.ap?apvlNo=" + apvlNo;
		}else {
			model.addAttribute("errorMsg", "승인 처리 실패");
			return "common/errorPage";
		}
	}
	
	// 수신한 전자결재 승인 (마지막 순번)
	@RequestMapping("lastApprove.ap")
	public String lastApproveApproval(int apvlNo, String apvlFormNo, Model model, HttpSession session) {
		int loginUserNo = Integer.parseInt(((User)session.getAttribute("loginUser")).getUserNo());
		ApprovalLine approveApvl = new ApprovalLine();
		approveApvl.setApvlNo(apvlNo);
		approveApvl.setUserNo(loginUserNo);
		
		int result = aService.lastApproveApproval(approveApvl, apvlFormNo);
		
		if(apvlFormNo.equals("1")) {
			Map<String,Object> map = new HashMap<>();
			ArrayList<Commute> cmList = new ArrayList<>();
			
			Approval apvl = aService.selectApproval(apvlNo);
			ApprovalDayOffForm dayOff = aService.selectDayOffForm(apvlNo);
			
			for(int i=0; i<dayOff.getOffTotalDate(); i++) {
				Commute cm = new Commute();
				
				cm.setUserNo(String.valueOf(apvl.getApvlWriter()));
				
				try {
					cm.setCmDate(AddDate(dayOff.getOffStartDate(), 0, 0, i));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				cm.setCmState("5");
				
				cmList.add(cm);
				
				map.put("cmList", cmList);
			}
			
			aService.dayOffCommuteInsert(map);
			
		}
		
		
		
		if(result > 0) {
			return "redirect:detail.ap?apvlNo=" + apvlNo;
		}else {
			model.addAttribute("errorMsg", "승인 처리 실패");
			return "common/errorPage";
		}
	}
	
	// 수정하기 페이지 이동
	@RequestMapping("updateForm.ap")
	public String updateApproval(int apvlNo, Model model, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		ArrayList<Dept> dept = aService.selectDeptList(Integer.parseInt(loginUser.getComNo()));
		Approval apvl = aService.selectApproval(apvlNo);
		ArrayList<ApprovalLine> lineList = aService.approvalLineList(apvlNo);
		
		
		model.addAttribute("dept", dept);
		model.addAttribute("apvl", apvl);
		model.addAttribute("lineList", lineList);
		
		int apvlFormNo = Integer.parseInt(apvl.getApvlFormNo());
		switch(apvlFormNo) {
			case 1:
				ApprovalDayOffForm apvlDof = aService.selectDayOffForm(apvlNo);
				switch(apvlDof.getOffKind()) {
					case "1": apvlDof.setOffKind("연차"); break;
					case "2": apvlDof.setOffKind("병가"); break;
					case "3": apvlDof.setOffKind("공가"); break;
					case "4": apvlDof.setOffKind("정기 휴가"); break;
					case "5": apvlDof.setOffKind("출산 휴가"); break;
				}
				model.addAttribute("form", apvlDof);
				break;
			case 2:
				ApprovalOverTimeForm apvlOtf = aService.selectOverTimeForm(apvlNo);
				model.addAttribute("form", apvlOtf);
				break;
			case 3:
				ApprovalWorkReportForm apvlWrf = aService.selectWorkReportForm(apvlNo);
				model.addAttribute("form", apvlWrf);
				break;
			case 4:
				ApprovalExpenseReportForm apvlErf = aService.selectExpenseReportForm(apvlNo);
				model.addAttribute("form", apvlErf);
				break;
			case 5:
				ApprovalBuisnessTripForm apvlBtf = aService.selectBuisnessTripForm(apvlNo);
				model.addAttribute("form", apvlBtf);
				break;
		}
		
		return "approval/approvalUpdateForm";
	}
	
	// 수정하기
	@RequestMapping("update.ap")
	public String updateApproval(int apvlNo, String lineUser, Approval apvl, ApprovalBuisnessTripForm apvlBtf, ApprovalDayOffForm apvlDof, ApprovalExpenseReportForm apvlErf, ApprovalOverTimeForm apvlOtf, ApprovalWorkReportForm apvlWrf, HttpSession session, Model model) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		String[] lineUserNo = lineUser.split(","); 
		map.put("apvl", apvl);
		map.put("lineUserNo", lineUserNo);		
		
		switch(Integer.parseInt(apvl.getApvlFormNo())) {
			case 1 : 
				map.put("form", apvlDof);break;
			case 2 : 
				map.put("form", apvlOtf);break;
			case 3 : 
				map.put("form", apvlWrf);break;
			case 4 : 
				map.put("form", apvlErf);break;
			case 5 : 
				map.put("form", apvlBtf);break;
		}
		
		
		int result = aService.updateApproval(map);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "전자결재가 성공적으로 수정되었습니다.");
			return "redirect:detail.ap?apvlNo=" + apvlNo;
		}else {
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 작성한 전자결재 검색하기
	@RequestMapping("writerSearch.ap")
	public String searchWriteApproval(Model model, int cpage, String category, String keyword, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("loginUser", loginUser);
		
		int listCount = aService.searchWriteApvlListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 10);
		
		ArrayList<Approval> list = aService.searchWriteApvlList(pi, map);
		
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
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		
		return "approval/approvalUserWriteList";
		
		
	}
	
	// 수신한 전자결재 검색하기
	@RequestMapping("receiveSearch.ap")
	public String searchReceiveApproval(Model model, int cpage, String category, String keyword, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("loginUser", loginUser);
		
		int listCount = aService.searchReceiveApvlListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, cpage, 5, 10);
		ArrayList<Approval> list = aService.searchReceiveApvlList(pi, map);
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
		model.addAttribute("keyword", keyword);
		model.addAttribute("category", category);
		System.out.println(category);
		return "approval/approvalUserReceiveList";
	}
	
	// 관리자 전자결재 양식 관리
	@RequestMapping("admin.ap")
	public String adminApprovalForm(Model model, HttpSession session) {
		User admin = (User)session.getAttribute("loginUser");
		ArrayList<ApprovalForm> formList = aService.selectAllFormList(Integer.parseInt(admin.getComNo()));
		model.addAttribute("formList", formList);
		return "approval/adminApprovalForm";
	}
	
	// 관리자 결재 양식 remove(ajax)
	@ResponseBody
	@RequestMapping(value="setRemoveForm.ap", produces="application/json; charset=utf-8")
	public String ajaxRemoveForm(@RequestParam(value="apvlFormNo[]") List<Integer> apvlFormNo, int comNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("comNo", comNo);
		map.put("apvlFormNo", apvlFormNo);
		
		int result = aService.ajaxRemoveForm(map); 
		
		ArrayList<ApprovalForm> formList = aService.selectAllFormList(comNo);

		return new Gson().toJson(formList);
	}
	
	// 관리자 결재 양식 add (ajax)
	@ResponseBody
	@RequestMapping(value="setAddForm.ap", produces="application/json; charset=utf-8")
	public String ajaxAddForm(@RequestParam(value="apvlFormNo[]") List<Integer> apvlFormNo, int comNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("comNo", comNo);
		map.put("apvlFormNo", apvlFormNo);
		
		int result = aService.ajaxAddForm(map); 
		
		ArrayList<ApprovalForm> formList = aService.selectAllFormList(comNo);
		
		return new Gson().toJson(formList);
	}

	// 관리자 결재 양식 리스트 조회(ajax)
	@ResponseBody
	@RequestMapping(value="formList.ap", produces="application/json; charset=utf-8")
	public String ajaxFormList(int comNo) {

		ArrayList<ApprovalForm> formList = aService.selectAllFormList(comNo);
		return new Gson().toJson(formList);
	}
	
	// 메인 페이지 작성한 결재 조회
	@ResponseBody
	@RequestMapping(value="mainWriteApvl.ap", produces="application/json; charset=utf-8")
	public String ajaxMainWriteApvl(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		ArrayList<Approval> apvlList = aService.mainWriteApvl(loginUser);
		
		for(Approval a : apvlList) {			
			switch(a.getApvlStatus()) {
				case "S": a.setApvlStatus("결재 대기"); break;
				case "I": a.setApvlStatus("진행중"); break;
				case "C": a.setApvlStatus("승인"); break;
				case "R": a.setApvlStatus("반려"); break;
				case "D": a.setApvlStatus("회수"); break;
			}
		}
		return new Gson().toJson(apvlList);
	}

	@ResponseBody
	@RequestMapping(value="mainReceiveApvl.ap", produces="application/json; charset=utf-8")
	public String ajaxMainReceiveApvl(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		ArrayList<Approval> apvlList = aService.mainReceiveApvl(loginUser);
		
		for(Approval a : apvlList) {
			switch(a.getApvlStatus()) {
				case "S": a.setApvlStatus("결재 대기"); break;
				case "A": a.setApvlStatus("승인 처리"); break;
				case "R": a.setApvlStatus("반려 처리"); break;
			}
		}
		return new Gson().toJson(apvlList);
	}
}
