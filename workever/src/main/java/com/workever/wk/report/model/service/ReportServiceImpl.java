package com.workever.wk.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.report.model.dao.ReportDao;
import com.workever.wk.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private ReportDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	 * 익명 게시글 신고글 총 개수
	 */
	@Override
	public int selectBoardReportListCount() {
		
		return rDao.selectBoardReportListCount(sqlSession);
		
	}

	/**
	 * 익명 게시글 신고글 목록 조회
	 */
	@Override
	public ArrayList<Report> selectBoardReportList(PageInfo pi) {
		
		return rDao.selectBoardReportList(sqlSession, pi);
		
	}

	/**
	 * 익명 게시글 신고글 상세 조회
	 */
	@Override
	public Report selectBoardReportDetail(String reportNo) {
		
		return rDao.selectBoardReportDetail(sqlSession, reportNo);
		
	}

	/**
	 * 익명 게시글 블라인드 처리
	 */
	@Override
	public int updateBoardBlind(String abNo) {
		
		return rDao.updateBoardBlind(sqlSession, abNo);
		
	}

	/**
	 * 익명 게시글 블라인드 해제
	 */
	@Override
	public int updateBoardBlindCancel(String abNo) {
		
		return rDao.updateBoardBlindCancel(sqlSession, abNo);
		
	}

	/**
	 * 익명 게시글 신고글 삭제 및 참조 게시글 신고 횟수 감소
	 */
	@Override
	public int deleteBoardReport(String reportNo, String abNo) {
		
		int result1 = rDao.deleteReport(sqlSession, reportNo);
		
		int result2 = rDao.decreaseBoardReportCount(sqlSession, abNo);
				
		
		return result1 * result2;
		
	}

	/**
	 * 익명 댓글 신고글 총 개수
	 */
	@Override
	public int selectReplyReportListCount() {
		
		return rDao.selectReplyReportListCount(sqlSession);
		
	}

	/**
	 * 익명 댓글 신고글 목록 조회
	 */
	@Override
	public ArrayList<Report> selectReplyReportList(PageInfo pi) {
		
		return rDao.selectReplyReportList(sqlSession, pi);
		
	}

	/**
	 * 익명 댓글 신고글 상세 조회
	 */
	@Override
	public Report selectReplyReportDetail(String reportNo) {
		
		return rDao.selectReplyReportDetail(sqlSession, reportNo);
		
	}

	/**
	 * 익명 댓글 블라인드 처리
	 */
	@Override
	public int updateReplyBlind(String crNo) {
		
		return rDao.updateReplyBlind(sqlSession, crNo);
		
	}

	/**
	 * 익명 댓글 블라인드 해제
	 */
	@Override
	public int updateReplyBlindCancel(String crNo) {
		
		return rDao.updateReplyBlindCancel(sqlSession, crNo);
		
	}

	/**
	 * 익명 댓글 신고글 삭제 및 참조 게시글 신고 횟수 감소
	 */
	@Override
	public int deleteReplyReport(String reportNo, String crNo) {
		
		int result1 = rDao.deleteReport(sqlSession, reportNo);
		
		int result2 = rDao.decreaseReplyReportCount(sqlSession, crNo);
				
		
		return result1 * result2;
		
	}
	
}
