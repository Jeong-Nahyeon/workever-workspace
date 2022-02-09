package com.workever.wk.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
	
	/** 익명게시판 게시글 신고 관리 목록 페이지 응답하는 메소드
	 * @return : adminReportAnonymousBoardListView.jsp
	 */
	@RequestMapping("blist.arep")
	public String adminReportAnonymousBoardListView() {
		
		return "report/adminReportAnonymousBoardListView";
		
	}
	
	/** 익명게시판 댓글 신고 관리 목록 페이지 응답하는 메소드
	 * @return : adminReportAnonymousReplyListView.jsp
	 */
	@RequestMapping("rlist.arep")
	public String adminReportAnonymousReplyListView() {
		
		return "report/adminReportAnonymousReplyListView";
		
	}
	
	
	
}
