package com.workever.wk.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.report.model.vo.Report;

@Repository
public class ReportDao {
	
	/** 익명 게시글신고글 총 개수
	 * @param sqlSession
	 * @return
	 */
	public int selectBoardReportListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("reportMapper.selectBoardReportListCount");
		
	}
	
	/** 익명 게시글 신고글 목록 조회
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Report> selectBoardReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectBoardReportList", null, rowBounds);
		
	}
	
	/** 익명 게시글 신고글 상세 조회
	 * @param sqlSession
	 * @param reportNo
	 * @return
	 */
	public Report selectBoardReportDetail(SqlSessionTemplate sqlSession, String reportNo) {
		
		return sqlSession.selectOne("reportMapper.selectBoardReportDetail", reportNo);
		
	}
	
	/** 익명 게시글 블라인드 처리
	 * @param sqlSession
	 * @param abNo
	 * @return
	 */
	public int updateBoardBlind(SqlSessionTemplate sqlSession, String abNo) {
		
		return sqlSession.update("reportMapper.updateBoardBlind", abNo);
		
	}
	
	/** 익명 게시글 블라인드 해제
	 * @param abNo
	 * @return
	 */
	public int updateBoardBlindCancel(SqlSessionTemplate sqlSession, String abNo) {
		
		return sqlSession.update("reportMapper.updateBoardBlindCancel", abNo);
		
	}
	
	/** 익명 게시글 신고글 삭제
	 * @param sqlSession
	 * @param reportNo
	 * @return
	 */
	public int deleteReport(SqlSessionTemplate sqlSession, String reportNo) {
		
		return sqlSession.update("reportMapper.deleteReport", reportNo);
		
	}
	
	/** 익명 게시글 신고글 참조 게시글 신고 횟수 감소
	 * @param sqlSession
	 * @param abNo
	 * @return
	 */
	public int decreaseBoardReportCount(SqlSessionTemplate sqlSession, String abNo) {
		
		return sqlSession.update("reportMapper.decreaseBoardReportCount", abNo);
		
	}
	
	/** 익명 댓글 신고글 총 개수
	 * @param sqlSession
	 * @return
	 */
	public int selectReplyReportListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("reportMapper.selectReplyReportListCount");
		
	}
	
	/** 익명 댓글 신고글 목록 조회
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Report> selectReplyReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.selectReplyReportList", null, rowBounds);
		
	}
	
	/** 익명 댓글 신고글 상세 조회
	 * @param sqlSession
	 * @param reportNo
	 * @return
	 */
	public Report selectReplyReportDetail(SqlSessionTemplate sqlSession, String reportNo) {
		
		return sqlSession.selectOne("reportMapper.selectReplyReportDetail", reportNo);
		
	}
	
	/** 익명 댓글 블라인드 처리
	 * @param sqlSession
	 * @param crNo
	 * @return
	 */
	public int updateReplyBlind(SqlSessionTemplate sqlSession, String crNo) {
		
		return sqlSession.update("reportMapper.updateReplyBlind", crNo);
		
	}
	
	/** 익명 댓글 블라인드 해제
	 * @param sqlSession
	 * @param crNo
	 * @return
	 */
	public int updateReplyBlindCancel(SqlSessionTemplate sqlSession, String crNo) {
	
		return sqlSession.update("reportMapper.updateReplyBlindCancel", crNo);
		
	}

	/** 익명 댓글 신고글 참조 게시글 신고 횟수 감소
	 * @param sqlSession
	 * @param crNo
	 * @return
	 */
	public int decreaseReplyReportCount(SqlSessionTemplate sqlSession, String crNo) {
		
		return sqlSession.update("reportMapper.decreaseReplyReportCount", crNo);
		
	}
	
}
