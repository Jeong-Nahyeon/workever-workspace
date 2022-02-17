package com.workever.wk.anonymousBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.anonymousBoard.model.vo.AnonymousBoard;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

@Repository
public class AnonymousBoardDao {

	/** 익명 게시글 총 개수
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("anonymousBoardMapper.selectListCount");
		
	}

	/** 익명 게시글 목록 조회(페이징 처리)
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<AnonymousBoard> selectAnonymousBoardList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("anonymousBoardMapper.selectAnonymousBoardList", null, rowBounds);
		
	}

	/** 익명 게시글 조회수 증가
	 * @param sqlSession
	 * @param abNo
	 * @return
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, String abNo) {
		
		return sqlSession.update("anonymousBoardMapper.increaseCount", abNo);
		
	}

	/** 익명 게시글 상세 조회
	 * @param sqlSession
	 * @param abNo
	 * @return
	 */
	public AnonymousBoard selectAnonymousBoard(SqlSessionTemplate sqlSession, String abNo) {
		
		return sqlSession.selectOne("anonymousBoardMapper.selectAnonymousBoard", abNo);
		
	}

	/** 익명 게시글번호로 첨부파일 목록 조회
	 * @param sqlSession
	 * @param abNo
	 * @return
	 */
	public ArrayList<CommunityFiles> selectCommunityFileList(SqlSessionTemplate sqlSession, String abNo) {
		
		return (ArrayList)sqlSession.selectList("anonymousBoardMapper.selectCommunityFileList", abNo);
		
	}
	
	/** 익명 게시글 등록
	 * @param sqlSession
	 * @param ab
	 * @return
	 */
	public int insertAnonymousBoard(SqlSessionTemplate sqlSession, AnonymousBoard ab) {
		
		return sqlSession.insert("anonymousBoardMapper.insertAnonymousBoard", ab);
		
	}
	
	/** 익명 게시글 첨부파일 등록
	 * @param sqlSession
	 * @param list
	 * @return
	 */
	public int insertCommunityFileList(SqlSessionTemplate sqlSession, ArrayList<CommunityFiles> list) {
		
		int result = 0;
		
		for(CommunityFiles file : list) {
			
			result = sqlSession.insert("anonymousBoardMapper.insertCommunityFileList", file);
			
		}
		
		return result;
		
	}
	
	/** 파일번호로 익명 게시글 첨부파일 조회
	 * @param sqlSession
	 * @param cfNo
	 * @return
	 */
	public CommunityFiles selectCommunityFile(SqlSessionTemplate sqlSession, int cfNo) {
		
		return sqlSession.selectOne("anonymousBoardMapper.selectCommunityFile", cfNo);
		
	}
	
	/** 파일번호로 익명 게시글 첨부파일 삭제
	 * @param sqlSession
	 * @param cfNo
	 * @return
	 */
	public int deleteCommunityFile(SqlSessionTemplate sqlSession, int cfNo) {
		
		return sqlSession.delete("anonymousBoardMapper.deleteCommunityFile", cfNo);
		
	}
	
	/** 부서별 게시글 수정
	 * @param sqlSession
	 * @param nb
	 * @return
	 */
	public int updateAnonymousBoard(SqlSessionTemplate sqlSession, AnonymousBoard ab) {
		
		return sqlSession.update("anonymousBoardMapper.updateAnonymousBoard", ab);
		
	}
	
	/** 부서별 게시글 수정 시 새로운 첨부파일 등록
	 * @param sqlSession
	 * @param list
	 * @return
	 */
	public int updateCommunityFileList(SqlSessionTemplate sqlSession, ArrayList<CommunityFiles> list) {
		
		int result = 0;
		
		for(CommunityFiles file : list) {
			
			result = sqlSession.insert("anonymousBoardMapper.updateCommunityFileList", file);
			
		}
		
		return result;
		
	}
	
	/** 익명 게시글 삭제
	 * @param sqlSession
	 * @param abNo
	 * @return
	 */
	public int deleteAnonymousBoard(SqlSessionTemplate sqlSession, String abNo) {	
		
		return sqlSession.update("anonymousBoardMapper.deleteAnonymousBoard", abNo);
		
	}
	
	/** 익명 게시글 삭제 시 해당 게시글의 댓글 목록 삭제
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public int deleteCommunityReplyList(SqlSessionTemplate sqlSession, String abNo) {
		
		return sqlSession.update("anonymousBoardMapper.deleteCommunityReplyList", abNo);
		
	}
	
	/** 익명 게시글 첨부파일 삭제
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public int deleteCommunityFileList(SqlSessionTemplate sqlSession, String abNo) {
		
		return sqlSession.delete("anonymousBoardMapper.deleteCommunityFileList", abNo);
		
	}
	
	/** 게시글 번호로 댓글 목록 조회
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public ArrayList<CommunityReply> selectReplyList(SqlSessionTemplate sqlSession, String abNo) {
		
		return (ArrayList)sqlSession.selectList("anonymousBoardMapper.selectReplyList", abNo);
		
	}
	
	/** 댓글 등록
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int insertReply(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.insert("anonymousBoardMapper.insertReply", cr);
		
	}
	
	/** 댓글 등록 시 해당 게시글 댓글 총 개수 증가
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int increaseReplyCount(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("anonymousBoardMapper.increaseReplyCount", cr);
		
	}
	
	/** 댓글 수정
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int updateReply(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("anonymousBoardMapper.updateReply", cr);
		
	}
	
	/** 댓글 삭제
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int deleteReply(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("anonymousBoardMapper.deleteReply", cr);
		
	}
	
	/** 댓글 삭제 시 해당 게시글 댓글 총 개수 감소
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int decreaseReplyCount(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("anonymousBoardMapper.decreaseReplyCount", cr);
		
	}
	
	/** 전체 익명 게시글의 게시글 번호 및 사원 번호 목록 조회
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<AnonymousBoard> selectTotalAnonymousBoardList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("anonymousBoardMapper.selectTotalAnonymousBoardList");
		
	}
	
	/** 나의 익명 게시글 목록 조회
	 * @param sqlSession
	 * @param pi
	 * @param abUserNo
	 * @return
	 */
	public ArrayList<AnonymousBoard> selectMyAnonymousBoardList(SqlSessionTemplate sqlSession, PageInfo pi, ArrayList<String> myAbNoList) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		 
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		return (ArrayList)sqlSession.selectList("anonymousBoardMapper.selectMyAnonymousBoardList", myAbNoList, rowBounds);
		
	}
	
}
