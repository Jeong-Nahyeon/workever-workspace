package com.workever.wk.deptBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DeptBoardController {
	
	/** 부서별 게시글 작성 페이지 응답하는 메소드
	 * @return : deptBoardForm.jsp
	 */
	@RequestMapping("enrollForm.dbo")
	public String deptBoardForm() {
		
		return "deptBoard/deptBoardForm";
		
	}
	
	/** 부서별 게시글 목록 페이지 응답하는 메소드
	 * @return : deptBoardListView.jsp
	 */
	@RequestMapping("list.dbo")
	public String deptBoardListView() {
		
		return "deptBoard/deptBoardListView";
		
	}
	
	/** 부서별 게시글 상세 페이지 응답하는 메소드
	 * @return : deptBoardDetailView.jsp
	 */
	@RequestMapping("detail.dbo")
	public String deptBoardDetailView() {
		
		return "deptBoard/deptBoardDetailView";
		
	}
	
	/** 나의 부서별 게시글 목록 페이지 응답하는 메소드
	 * @return : myDeptBoardListView.jsp
	 */
	@RequestMapping("dlist.mybo")
	public String myDeptBoardListView() {
		
		return "myBoard/myDeptBoardListView";
		
	}
	
	
	
}
