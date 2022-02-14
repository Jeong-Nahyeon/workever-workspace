package com.workever.wk.deptBoard.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

public interface DeptBoardService {
	
	// 로그인한 사원의 부서명 조회 서비스
	String selectDeptName(String userNo);
	
	// 부서별 게시판 목록 조회 서비스 (페이징 처리)
	int selectListCount(String deptNo); // 게시글 총 개수
	ArrayList<DeptBoard> selectDeptBoardList(PageInfo pi, String deptNo); // 최신순 목록 조회
	ArrayList<DeptBoard> selectAscList(PageInfo pi, String deptNo); // 오래된순 목록 조회
	
	// 부서별 게시판 상세 조회 서비스
	int increaseCount(int dbNo); // 조회수 증가
	DeptBoard selectDeptBoard(int dbNo); // 게시글 상세 조회
	ArrayList<CommunityFiles> selectCommunityFileList(int dbNo); // 첨부파일 조회
	
	// 부서별 게시판 작성 서비스
	
	// 부서별 게시글 수정 서비스
	
	// 부서별 게시글 삭제 서비스
	
	// 부서별 게시판 댓글 목록 서비스
	
	// 부서별 게시판 댓글 작성 서비스
	
	// 부서별 게시판 댓글 수정 서비스
	
	// 부서별 게시판 댓글 삭제 서비스
	
}
