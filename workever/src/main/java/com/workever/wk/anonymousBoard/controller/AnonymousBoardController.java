package com.workever.wk.anonymousBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnonymousBoardController {

	/** 익명 게시글 작성 페이지 응답하는 메소드
	 * @return : anonymousBoardForm.jsp
	 */
	@RequestMapping("enrollForm.abo")
	public String anonymousBoardForm() {
		
		return "anonymousBoard/anonymousBoardForm";
		
	}
	
	/** 익명 게시글 목록 페이지 응답하는 메소드
	 * @return : anonymousBoardListView.jsp
	 */
	@RequestMapping("list.abo")
	public String anonymousBoardListView() {
		
		return "anonymousBoard/anonymousBoardListView";
		
	}
	
	/** 익명 게시글 상세 페이지 응답하는 메소드
	 * @return : anonymousBoardDetailView.jsp
	 */
	@RequestMapping("detail.abo")
	public String anonymousBoardDetailView() {
		
		return "anonymousBoard/anonymousBoardDetailView";
		
	}
	
	/** 나의 익명 게시글 목록 페이지 응답하는 메소드
	 * @return : myAnonymousBoardListView.jsp
	 */
	@RequestMapping("alist.mybo")
	public String myAnonymousBoardListView() {
		
		return "myBoard/myAnonymousBoardListView";
		
	}
	
	
	
}
