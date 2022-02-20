package com.workever.wk.report.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.report.model.vo.Report;

public interface ReportService {

	// 익명 게시글 신고 목록 조회 서비스 (페이징 처리)
	int selectBoardReportListCount(); // 익명 게시글 신고글 총 개 수
	ArrayList<Report> selectBoardReportList(PageInfo pi); // 익명 게시글 신고글 목록 조회
	
	// 익명 게시글 신고 상세 조회 서비스
	Report selectBoardReportDetail(String reportNo); // 익명 게시글 신고글 상세 조회
	
	// 신고 대상 게시글 블라인드 등록 서비스
	int updateBoardBlind(String abNo); // 익명 게시글 블라인드 처리
	
	// 신고 대상 게시글 블라인드 해제 서비스
	int updateBoardBlindCancel(String abNo); // 익명 게시글 블라인드 해제
	
	// 익명 게시글 신고 목록 삭제 서비스
	int deleteBoardReport(String reportNo, String abNo); // 익명 게시글 신고글 삭제 및 참조 게시글 신고 횟수 감소

	// 익명 게시글 댓글 신고 목록 조회 서비스 (페이징 처리)
	int selectReplyReportListCount(); // 익명 댓글 신고글 총 개수
	ArrayList<Report> selectReplyReportList(PageInfo pi); // 익명 댓글 신고글 목록 조회
	
	// 익명 댓글 신고 상세 조회 서비스
	Report selectReplyReportDetail(String reportNo); // 익명 댓글 신고글 상세 조회
	
	// 신고 대상 댓글 블라인드 등록 서비스
	int updateReplyBlind(String crNo); // 익명 댓글 블라인드 처리
	
	// 신고 대상 댓글 블라인드 해제 서비스
	int updateReplyBlindCancel(String crNo); // 익명 댓글 블라인드 해제
	
	// 익명 댓글 신고 목록 삭제 서비스
	int deleteReplyReport(String reportNo, String crNo); // 익명 댓글 신고글 삭제 및 참조 게시글 신고 횟수 감소
	
}
