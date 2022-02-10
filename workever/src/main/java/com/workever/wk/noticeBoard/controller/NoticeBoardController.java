package com.workever.wk.noticeBoard.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.noticeBoard.model.service.NoticeBoardService;
import com.workever.wk.noticeBoard.model.vo.NoticeBoard;

@Controller
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService nService;
	
	/** 공지사항 게시글 목록 조회(최신순||오래된순 / 페이징 처리) 후 공지사항 게시글 목록 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param orderList : 사용자가 요청한 게시글 목록 정렬용 키워드 asc(오래된순)
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.nbo" )
	public ModelAndView selectNoticeBoardList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String orderList, ModelAndView mv) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		if(orderList != null) { // 오래된순
			
			ArrayList<NoticeBoard> list = nService.selectAscList(pi);
			
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("orderList", orderList)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		} else { // 최신순(기본)
			
			ArrayList<NoticeBoard> list = nService.selectNoticeBoardList(pi);
		
			mv.addObject("list", list)
			.addObject("pi", pi)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		}
		
	}
	
	
	/** 공지사항 게시글 검색 목록 조회(최신순||오래된순 / 페이징 처리) 후 공지사항 게시글 목록 페이지 포워딩
	 * @param currentPage : 사용자가 요청한 검색 목록 페이지 수
	 * @param orderList : 사용자가 요청한 검색 목록 정렬용 키워드 asc(오래된순)
	 * @param condition : 사용자가 요청한 검색 조건
	 * @param keyword : 사용자가 요청한 검색 키워드
	 * @param mv
	 * @return
	 */
	@RequestMapping("search.nbo" )
	public ModelAndView selectSearchList(@RequestParam(value="cpage", defaultValue="1") int currentPage,
			String orderList, String condition, String keyword, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = nService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		if(orderList != null) { // 오래된순
			
			ArrayList<NoticeBoard> list = nService.selectSearchAscList(map, pi);
			
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("orderList", orderList)
			.addObject("condition", condition)
			.addObject("keyword", keyword)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		} else { // 최신순(기본)
			
			ArrayList<NoticeBoard> list = nService.selectSearchList(map, pi);
		
			mv.addObject("list", list)
			.addObject("pi", pi)
			.addObject("condition", condition)
			.addObject("keyword", keyword)
			.setViewName("noticeBoard/noticeBoardListView");
			
			return mv;
			
		}
		
	}
	
	
	
	
	
	
	// 테스트용 삭제 예정
	
	/** 공지사항 게시글 작성 페이지 응답하는 메소드
	 * @return : noticeBoardForm.jsp
	 */
	@RequestMapping("enrollForm.nbo")
	public String noticeBoardForm() {
		
		return "noticeBoard/noticeBoardForm";
		
	}
	
	/** 공지사항 게시글 상세 페이지 응답하는 메소드
	 * @return : noticeBoardDetailView.jsp
	 */
	@RequestMapping("detail.nbo")
	public String noticeBoardDetailView() {
		
		return "noticeBoard/noticeBoardDetailView";
		
	}
	
}
