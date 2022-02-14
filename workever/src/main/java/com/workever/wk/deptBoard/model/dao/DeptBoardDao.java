package com.workever.wk.deptBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

@Repository
public class DeptBoardDao {
	
	/** 로그인한 사원의 부서명 조회
	 * @param sqlSession
	 * @param userNo
	 * @return
	 */
	public String selectDeptName(SqlSessionTemplate sqlSession, String userNo) {
		
		return sqlSession.selectOne("deptBoardMapper.selectDeptName", userNo);
		
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
}
