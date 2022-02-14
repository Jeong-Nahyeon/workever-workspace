package com.workever.wk.deptBoard.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

public interface DeptBoardService {

	// 부서별 게시판 목록 조회 서비스 (페이징 처리)
	String selectDeptName(String userNo); // 로그인한 사원의 부서명
	int selectListCount(String deptNo); // 게시글 총 개수
	ArrayList<DeptBoard> selectDeptBoardList(PageInfo pi, String deptNo); // 최신순 목록 조회
	ArrayList<DeptBoard> selectAscList(PageInfo pi, String deptNo); // 오래된순 목록 조회
	
	// 부서별 게시판 상세 조회 서비스
	
	// 부서별 게시판 작성 서비스
	
	// 부서별 게시글 수정 서비스
	
	// 부서별 게시글 삭제 서비스
	
	// 부서별 게시판 댓글 목록 서비스
	
	// 부서별 게시판 댓글 작성 서비스
	
	// 부서별 게시판 댓글 수정 서비스
	
	// 부서별 게시판 댓글 삭제 서비스
	
}
