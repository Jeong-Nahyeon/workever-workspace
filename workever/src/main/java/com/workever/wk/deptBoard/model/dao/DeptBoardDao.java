package com.workever.wk.deptBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

@Repository
public class DeptBoardDao {
	
	/** 로그인한 사원의 부서명 조회
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public String selectDeptName(SqlSessionTemplate sqlSession, String deptNo) {
		
		return sqlSession.selectOne("deptBoardMapper.selectDeptName", deptNo);
		
	}
	
	/** 부서별 게시글 목록 페이징 처리용 총 게시글 수 조회
	 * @param sqlSession
	 * @param deptNo 
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession, String deptNo) {
		
		return sqlSession.selectOne("deptBoardMapper.selectListCount", deptNo);
		
	}

	/** 부서별 게시글 목록 조회(최신순/페이징 처리)
	 * @param sqlSession
	 * @param pi
	 * @param deptNo
	 * @return
	 */
	public ArrayList<DeptBoard> selectDeptBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String deptNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("deptBoardMapper.selectDeptBoardList", deptNo, rowBounds);
		
	}

	/** 부서별 게시글 목록 조회(오래된순/페이징 처리)
	 * @param sqlSession
	 * @param pi
	 * @param deptNo
	 * @return
	 */
	public ArrayList<DeptBoard> selectAscList(SqlSessionTemplate sqlSession, PageInfo pi, String deptNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("deptBoardMapper.selectAscList", deptNo, rowBounds);
		
	}
	
	/** 부서별 게시글 조회수 증가
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, int dbNo) {
		
		return sqlSession.update("deptBoardMapper.increaseCount", dbNo);
		
	}
	
	/** 부서별 게시글 상세 조회
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public DeptBoard selectDeptBoard(SqlSessionTemplate sqlSession, int dbNo) {
		
		return sqlSession.selectOne("deptBoardMapper.selectDeptBoard", dbNo);
		
	}
	
	/** 참조글번호로 부서별 게시글 첨부파일 조회
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public ArrayList<CommunityFiles> selectCommunityFileList(SqlSessionTemplate sqlSession, int dbNo) {
		
		return (ArrayList)sqlSession.selectList("deptBoardMapper.selectCommunityFileList", dbNo);
		
	}
	
	/**  부서별 게시글 등록
	 * @param sqlSession
	 * @param db
	 * @return
	 */
	public int insertDeptBoard(SqlSessionTemplate sqlSession, DeptBoard db) {
		
		return sqlSession.insert("deptBoardMapper.insertDeptBoard", db);
		
	}
	
	/** 부서별 게시글 첨부파일 등록
	 * @param sqlSession
	 * @param list
	 * @return
	 */
	public int insertCommunityFileList(SqlSessionTemplate sqlSession, ArrayList<CommunityFiles> list) {
		
		int result = 0;
		
		for(CommunityFiles file : list) {
			
			result = sqlSession.insert("deptBoardMapper.insertCommunityFileList", file);
			
		}
		
		return result;
		
	}
	
	/** 파일번호로 부서별 게시글 첨부파일 조회
	 * @param sqlSession
	 * @param cfNo
	 * @return
	 */
	public CommunityFiles selectCommunityFile(SqlSessionTemplate sqlSession, int cfNo) {
		
		return sqlSession.selectOne("deptBoardMapper.selectCommunityFile", cfNo);
		
	}
	
	/** 파일번호로 부서별 게시글 첨부파일 삭제
	 * @param sqlSession
	 * @param cfNo
	 * @return
	 */
	public int deleteCommunityFile(SqlSessionTemplate sqlSession, int cfNo) {
		
		return sqlSession.delete("deptBoardMapper.deleteCommunityFile", cfNo);
		
	}
	
	/** 부서별 게시글 수정
	 * @param sqlSession
	 * @param nb
	 * @return
	 */
	public int updateDeptBoard(SqlSessionTemplate sqlSession, DeptBoard db) {
		
		return sqlSession.update("deptBoardMapper.updateDeptBoard", db);
		
	}
	
	/** 부서별 게시글 수정 시 새로운 첨부파일 등록
	 * @param sqlSession
	 * @param list
	 * @return
	 */
	public int updateCommunityFileList(SqlSessionTemplate sqlSession, ArrayList<CommunityFiles> list) {
		
		int result = 0;
		
		for(CommunityFiles file : list) {
			
			result = sqlSession.insert("deptBoardMapper.updateCommunityFileList", file);
			
		}
		
		return result;
		
	}
	
	/** 부서별 게시글 삭제
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public int deleteDeptBoard(SqlSessionTemplate sqlSession, int dbNo) {	
		
		return sqlSession.update("deptBoardMapper.deleteDeptBoard", dbNo);
		
	}
	
	/** 부서별 게시글 삭제 시 해당 게시글의 댓글 목록 삭제
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public int deleteCommunityReplyList(SqlSessionTemplate sqlSession, int dbNo) {
		
		return sqlSession.update("deptBoardMapper.deleteCommunityReplyList", dbNo);
		
	}
	
	/** 부서별 게시글 첨부파일 삭제
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public int deleteCommunityFileList(SqlSessionTemplate sqlSession, int dbNo) {
		
		return sqlSession.delete("deptBoardMapper.deleteCommunityFileList", dbNo);
		
	}
	
	/** 게시글 번호로 댓글 목록 조회
	 * @param sqlSession
	 * @param dbNo
	 * @return
	 */
	public ArrayList<CommunityReply> selectReplyList(SqlSessionTemplate sqlSession, int dbNo) {
		
		return (ArrayList)sqlSession.selectList("deptBoardMapper.selectReplyList", dbNo);
		
	}
	
	/** 댓글 등록
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int insertReply(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.insert("deptBoardMapper.insertReply", cr);
		
	}
	
	/** 댓글 등록 시 해당 게시글 댓글 개수 증가
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int increaseReplyCount(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("deptBoardMapper.increaseReplyCount", cr);
		
	}
	
	/** 댓글 수정
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int updateReply(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("deptBoardMapper.updateReply", cr);
		
	}
	
	/** 댓글 삭제
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int deleteReply(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("deptBoardMapper.deleteReply", cr);
		
	}
	
	/** 댓글 삭제 시 해당 게시글 댓글 총 개수 감소
	 * @param sqlSession
	 * @param cr
	 * @return
	 */
	public int decreaseReplyCount(SqlSessionTemplate sqlSession, CommunityReply cr) {
		
		return sqlSession.update("deptBoardMapper.decreaseReplyCount", cr);
		
	}
	
	/** 나의 부서 게시글 총 개수
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public int selectMyDeptBoardListCount(SqlSessionTemplate sqlSession, String userNo) {
		
		return sqlSession.selectOne("deptBoardMapper.selectMyDeptBoardListCount", userNo);
		
	}

	/** 나의 부서 게시글 목록 조회
	 * @param sqlSession
	 * @param pi
	 * @param userNo
	 * @return
	 */
	public ArrayList<DeptBoard> selectMyDeptBoardList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
				
		return (ArrayList)sqlSession.selectList("deptBoardMapper.selectMyDeptBoardList", userNo, rowBounds);
		
	}
	
}
