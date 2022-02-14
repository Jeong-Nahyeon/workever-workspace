package com.workever.wk.deptBoard.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.deptBoard.model.service.DeptBoardService;
import com.workever.wk.deptBoard.model.vo.DeptBoard;
import com.workever.wk.noticeBoard.model.vo.NoticeBoard;
import com.workever.wk.user.model.vo.User;

@Controller
public class DeptBoardController {
	
	@Autowired
	private DeptBoardService dService;
	
	/** 로그인한 사원의 해당 부서명, 부서별 게시글 목록 조회 (최신순||오래된순 / 페이징 처리) 후 부서별 게시글 목록 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param orderList : 사용자가 요청한 게시글 목록 정렬용 키워드 asc(오래된순)
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.dbo")
	public ModelAndView selectDeptBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String orderList, HttpSession session, ModelAndView mv) {
				
		User loginUser = (User)session.getAttribute("loginUser");
		
		// 로그인한 사원의 부서명
		String deptName = dService.selectDeptName(loginUser.getUserNo());
		
		// 해당 부서별 게시판 게시글 총 개수
		int listCount = dService.selectListCount(loginUser.getDeptNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		
		if(orderList != null) { // 오래된순 조회
			
			ArrayList<DeptBoard> list = dService.selectAscList(pi, loginUser.getDeptNo());
			
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("orderList", orderList)
			.addObject("deptName", deptName)
			.setViewName("deptBoard/deptBoardListView");
			
			return mv;
			
		} else { // 최신순(기본) 조회
			
			ArrayList<DeptBoard> list = dService.selectDeptBoardList(pi, loginUser.getDeptNo());
		
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("deptName", deptName)
			.setViewName("deptBoard/deptBoardListView");
			
			return mv;
			
		}
		
	}

	@RequestMapping("detail.dbo")
	public ModelAndView selectdeptBoard(int dbno, HttpSession session, ModelAndView mv) {
		
		// 로그인한 사원의 부서명
		String deptName = dService.selectDeptName(((User)session.getAttribute("loginUser")).getUserNo());

		// 조회수 증가
		int result = dService.increaseCount(dbno);
		
		if(result > 0) { // 유효한 게시글 조회
			
			// 게시글 상세 조회
			DeptBoard db = dService.selectDeptBoard(dbno);
			
			// 첨부파일 조회
			ArrayList<CommunityFiles> list = dService.selectCommunityFileList(dbno);
			
			mv.addObject("db", db)
			  .addObject("list", list)
			  .setViewName("deptBoard/deptBoardDetailView");
			
			return mv;
		
		} else { // 유효하지 않은 게시글 조회
			
			mv.addObject("errorMsg", "유효하지 않은 게시글 입니다")
			  .setViewName("common/errorPage");
			
			return mv;
			
		}
					
	}
	
	
	
	
	
	
	
	
	
	// ↓ 테스트용 삭제 예정
	
	/** 부서별 게시글 작성 페이지 응답하는 메소드
	 * @return : deptBoardForm.jsp
	 */
	@RequestMapping("enrollForm.dbo")
	public String deptBoardForm() {
		
		return "deptBoard/deptBoardForm";
		
	}
	
	
	/** 나의 부서별 게시글 목록 페이지 응답하는 메소드
	 * @return : myDeptBoardListView.jsp
	 */
	@RequestMapping("dlist.mybo")
	public String myDeptBoardListView() {
		
		return "myBoard/myDeptBoardListView";
		
	}
	
	
	
}
