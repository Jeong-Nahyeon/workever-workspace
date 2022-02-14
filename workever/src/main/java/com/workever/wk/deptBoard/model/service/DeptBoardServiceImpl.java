package com.workever.wk.deptBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.deptBoard.model.dao.DeptBoardDao;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

@Service
public class DeptBoardServiceImpl implements DeptBoardService {
	
	@Autowired
	private DeptBoardDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 로그인한 사원의 부서명 조회
	 */
	@Override
	public String selectDeptName(String userNo) {
		
		return dDao.selectDeptName(sqlSession, userNo);
		
	}
	
	/**
	 * 부서별 게시글 목록 페이징 처리용 총 게시글 수 조회
	 */
	@Override
	public int selectListCount(String deptNo) {
		
		return dDao.selectListCount(sqlSession, deptNo);
		
	}

	/**
	 * 부서별 게시글 목록 조회(최신순/페이징 처리)
	 */	
	@Override
	public ArrayList<DeptBoard> selectDeptBoardList(PageInfo pi, String deptNo) {
		
		return dDao.selectDeptBoardList(sqlSession, pi, deptNo);
	
	}

	/**
	 * 부서별 게시글 목록 조회(오래된순/페이징 처리)
	 */	
	@Override
	public ArrayList<DeptBoard> selectAscList(PageInfo pi, String deptNo) {
		
		return dDao.selectAscList(sqlSession, pi, deptNo);
		
	}


	
	
	
}
