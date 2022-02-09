package com.workever.wk.noticeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class NoticeBoardController {
	
	/** 공지사항 게시글 작성 페이지 응답하는 메소드
	 * @return : noticeBoardForm.jsp
	 */
	@RequestMapping("enrollForm.nbo")
	public String noticeBoardForm() {
		
		return "noticeBoard/noticeBoardForm";
		
	}
	
	/** 공지사항 게시글 목록 페이지 응답하는 메소드
	 * @return : noticeBoardListView.jsp
	 */
	@RequestMapping("list.nbo")
	public String noticeBoardListView() {
		
		return "noticeBoard/noticeBoardListView";
		
	}
	
	/** 공지사항 게시글 상세 페이지 응답하는 메소드
	 * @return : noticeBoardDetailView.jsp
	 */
	@RequestMapping("detail.nbo")
	public String noticeBoardDetailView() {
		
		return "noticeBoard/noticeBoardDetailView";
		
	}
	
	
	
}
