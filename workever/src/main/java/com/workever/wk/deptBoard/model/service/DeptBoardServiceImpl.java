package com.workever.wk.deptBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
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
	public String selectDeptName(String deptNo) {
		
		return dDao.selectDeptName(sqlSession, deptNo);
		
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

	/**
	 * 부서별 게시글 조회수 증가
	 */
	@Override
	public int increaseCount(int dbNo) {
		
		return dDao.increaseCount(sqlSession, dbNo);
		
	}

	/**
	 * 부서별 게시글 상세 조회
	 */
	@Override
	public DeptBoard selectDeptBoard(int dbNo) {
		
		return dDao.selectDeptBoard(sqlSession, dbNo);
		
	}

	/**
	 * 참조글번호로 부서별 게시글 첨부파일 조회
	 */
	@Override
	public ArrayList<CommunityFiles> selectCommunityFileList(int dbNo) {
		
		return dDao.selectCommunityFileList(sqlSession, dbNo);
		
	}

	/**
	 * 부서별 게시글 등록 및 첨부파일 등록
	 */
	@Override
	public int insertDeptBoard(DeptBoard db, ArrayList<CommunityFiles> list) {

		int result1 = dDao.insertDeptBoard(sqlSession, db);
				
		int result2 = 1;
		
		if(!list.isEmpty()) { // 첨부파일 있을 경우에만 실행되도록 조건 검사
			
			result2 = dDao.insertCommunityFileList(sqlSession, list);
			
		}
		
		return result1 * result2;
		
	}

	/**
	 * 파일번호로 부서별 게시글 첨부파일 조회
	 */
	@Override
	public CommunityFiles selectCommunityFile(int cfNo) {
		
		return dDao.selectCommunityFile(sqlSession, cfNo);
		
	}

	/**
	 * 파일번호로 부서별 게시글 첨부파일 삭제
	 */
	@Override
	public int deleteCommunityFile(int cfNo) {
		
		return dDao.deleteCommunityFile(sqlSession, cfNo);
			
	}

	/**
	 * 부서별 게시글 수정 및 새로운 첨부파일 등록
	 */
	@Override
	public int updateDeptBoard(DeptBoard db, ArrayList<CommunityFiles> list) {
		
		int result1 = dDao.updateDeptBoard(sqlSession, db);
		
		int result2 = 1;
		
		if(!list.isEmpty()) { // 첨부파일 있을 경우에만 실행되도록 조건 검사
			
			result2 = dDao.updateCommunityFileList(sqlSession, list);
			
		}
		
		return result1 * result2;
		
	}

	/**
	 * 부서별 게시글 삭제
	 */
	@Override
	public int deleteDeptBoard(int dbNo) {
		
		return dDao.deleteDeptBoard(sqlSession, dbNo);
		
	}

	/**
	 * 부서별 게시글 첨부파일 삭제
	 */
	@Override
	public int deleteCommunityFileList(int dbNo) {
		
		return dDao.deleteCommunityFileList(sqlSession, dbNo);
		
	}

	/**
	 *  게시글 번호로 댓글 목록 조회
	 */
	@Override
	public ArrayList<CommunityReply> selectReplyList(int dbNo) {
		
		return dDao.selectReplyList(sqlSession, dbNo);
		
	}

	
	
	
	
}
