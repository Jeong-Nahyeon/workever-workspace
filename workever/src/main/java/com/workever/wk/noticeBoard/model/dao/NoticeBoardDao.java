package com.workever.wk.noticeBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.noticeBoard.model.vo.NoticeBoard;

@Repository
public class NoticeBoardDao {
	
	/** 공지사항 게시글 목록 페이징 처리용 총 게시글 수 조회
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("noticeBoardMapper.selectListCount");
		
	}
	
	/** 공지사항 게시글 목록 조회(최신순/페이징 처리)
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<NoticeBoard> selectNoticeBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeBoardMapper.selectNoticeBoardList", null, rowBounds);
		
	}
	
	/** 공지사항 게시글 목록 조회(오래된순/페이징 처리)
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<NoticeBoard> selectAscList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeBoardMapper.selectAscList", null, rowBounds);
		
	}
	
	/** 공지사항 게시글 검색 목록 페이징 처리용 총 게시글 수 조회
	 * @param sqlSession
	 * @return
	 */
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("noticeBoardMapper.selectSearchCount", map);
		
	}
	
	/** 공지사항 게시글 검색 목록 조회(최신순/페이징 처리)
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<NoticeBoard> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeBoardMapper.selectSearchList", map, rowBounds);
		
	}
	
	/** 공지사항 게시글 검색 목록 조회(오래된순/페이징 처리)
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<NoticeBoard> selectSearchAscList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeBoardMapper.selectSearchAscList", map, rowBounds);
		
	}
	
	/** 공지사항 게시글 조회수 증가
	 * @param sqlSession
	 * @param nbNo
	 * @return
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, int nbNo) {
		
		return sqlSession.update("noticeBoardMapper.increaseCount", nbNo);
		
	}
	
	/** 공지사항 게시글 상세 조회
	 * @param sqlSession
	 * @param nbNo
	 * @return
	 */
	public NoticeBoard selectNoticeBoard(SqlSessionTemplate sqlSession, int nbNo) {
		
		return sqlSession.selectOne("noticeBoardMapper.selectNoticeBoard", nbNo);
		
	}
	
	/** 공지사항 게시글 첨부파일 조회
	 * @param sqlSession
	 * @param nbNo
	 * @return
	 */
	public ArrayList<CommunityFiles> selectCommunityFilesList(SqlSessionTemplate sqlSession, int nbNo) {
		
		return (ArrayList)sqlSession.selectList("noticeBoardMapper.selectCommunityFilesList", nbNo);
		
	}

}
