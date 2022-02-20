package com.workever.wk.report.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.common.template.Pagination;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
import com.workever.wk.report.model.service.ReportService;
import com.workever.wk.report.model.vo.Report;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	/** 익명 게시글 신고 목록 조회
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.bo")
	public ModelAndView selectBoardReportList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		// 신고글 총 개수
		int listCount = rService.selectBoardReportListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
	
		ArrayList<Report> list = rService.selectBoardReportList(pi);
		
		mv.addObject("list", list)
		.addObject("pi", pi)
		.setViewName("report/adminReportAnonymousBoardListView");
		
		return mv;
		
	}
	
	/** [Ajax] 익명 게시글 신고 상세 조회  후 처리 상태 응답 데이터로 전달
	 * @param reportNo : 신고 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="detail.bo", produces="application/json; charset=UTF-8")
	public String ajaxSelectBoardReportDetail(String reportNo) {
		
		Report report = rService.selectBoardReportDetail(reportNo);
		
		return new Gson().toJson(report);
		
	}
	
	/** [Ajax] 익명 게시글 블라인드 처리 후 처리 상태 응답 데이터로 전달
	 * @param abNo : 익명 게시글 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping("blind.bo")
	public String ajaxUpdateBoardBlind(String abNo) {
		
		int result = rService.updateBoardBlind(abNo);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 익명 게시글 블라인드 해제 후 처리 상태 응답 데이터로 전달
	 * @param abNo : 익명 게시글 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping("cancel.bo")
	public String ajaxUpdateBoardBlindCancel(String abNo) {
		
		int result = rService.updateBoardBlindCancel(abNo);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 익명 게시글 신고글 삭제 요청 처리 후 처리 상태 응답 데이터로 전달
	 * @param deleteNo : 사용자가 삭제 요청한 다수의 신고글
	 * @return
	 */
	@ResponseBody
	@RequestMapping("delete.bo")
	public String ajaxDeleteBoardReportList(@RequestParam(value="deleteList[]") List<String> deleteList, HttpSession session) {
		
		int result = 0; // 게시글 삭제
		
		for(String reportNo : deleteList) {
			
			// 신고 횟수 감소용
			Report r = rService.selectBoardReportDetail(reportNo);
			
			if(r != null) {
				
				String abNo = r.getReportRefNo();
				
				result = rService.deleteBoardReport(reportNo, abNo);
				
			}
			
		}
		
		return result > 0 ? new Gson().toJson("success") : new Gson().toJson("fail");
		
	}
	
	/** 익명 댓글 신고 목록 조회
	 * @param currentPage : 사용자가 요청한 페이지 수
	 * @param session
	 * @param mv
	 * @return
	 */
	@RequestMapping("list.re")
	public ModelAndView selectReplyReportList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session, ModelAndView mv) {
		
		// 신고글 총 개수
		int listCount = rService.selectReplyReportListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
	
		ArrayList<Report> list = rService.selectReplyReportList(pi);
		
		mv.addObject("list", list)
		.addObject("pi", pi)
		.setViewName("report/adminReportAnonymousReplyListView");
		
		return mv;
		
	}
	
	/** [Ajax] 익명 댓글 신고 상세 조회  후 처리 상태 응답 데이터로 전달
	 * @param reportNo : 신고 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="detail.re", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyReportDetail(String reportNo) {
		
		Report report = rService.selectReplyReportDetail(reportNo);
		
		return new Gson().toJson(report);
		
	}
	
	/** [Ajax] 익명 댓글 블라인드 처리 후 처리 상태 응답 데이터로 전달
	 * @param crNo : 익명 댓글 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping("blind.re")
	public String ajaxUpdateReplyBlind(String crNo) {
		
		int result = rService.updateReplyBlind(crNo);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 익명 댓글 블라인드 해제 후 처리 상태 응답 데이터로 전달
	 * @param crNo : 익명 댓글 번호
	 * @return
	 */
	@ResponseBody
	@RequestMapping("cancel.re")
	public String ajaxUpdateReplyBlindCancel(String crNo) {
		
		int result = rService.updateReplyBlindCancel(crNo);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/** [Ajax] 익명 댓글 신고글 삭제 요청 처리 후 처리 상태 응답 데이터로 전달
	 * @param deleteNo : 사용자가 삭제 요청한 다수의 신고글
	 * @return
	 * @throws ParseException 
	 */
	@ResponseBody
	@RequestMapping("delete.re")
	public String ajaxDeleteReplyReportList(@RequestParam(value="deleteList[]") List<String> deleteList, HttpSession session) {
		
		int result = 0; // 게시글 삭제
		
		for(String reportNo : deleteList) {
			
			// 신고 횟수 감소용
			Report r = rService.selectReplyReportDetail(reportNo);
			
			if(r != null) {
				
				String crNo = r.getReportRefNo();
				
				result = rService.deleteReplyReport(reportNo, crNo);
				
			}
			
		}
		
		return result > 0 ? new Gson().toJson("success") : new Gson().toJson("fail");
		
	}
	
}
