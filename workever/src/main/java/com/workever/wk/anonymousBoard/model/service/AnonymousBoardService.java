package com.workever.wk.anonymousBoard.model.service;

import java.util.ArrayList;

import com.workever.wk.anonymousBoard.model.vo.AnonymousBoard;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.community.model.vo.CommunityReply;
import com.workever.wk.deptBoard.model.vo.DeptBoard;

public interface AnonymousBoardService {
	
	// 익명 게시글 목록 조회 서비스(페이징 처리)
	int selectListCount(); // 게시글 총 개수
	ArrayList<AnonymousBoard> selectAnonymousBoardList(PageInfo pi); //	익명 게시글 목록 조회(페이징 처리)
	
	// 익명 게시글 상세 조회 서비스
	int increaseCount(String abNo); // 조회수 증가
	AnonymousBoard selectAnonymousBoard(String abNo); // 게시글 상세 조회
	ArrayList<CommunityFiles> selectCommunityFileList(String abNo); // 첨부파일 목록 조회
	
	// 익명 게시글 작성 서비스
	int insertAnonymousBoard(AnonymousBoard ab, ArrayList<CommunityFiles> list);
	
	// 익명 게시글 수정 서비스
	CommunityFiles selectCommunityFile(int cfNo); // 삭제할 첨부파일 조회
	int deleteCommunityFile(int cfNo); // 개별 첨부파일 삭제
	int updateAnonymousBoard(AnonymousBoard ab, ArrayList<CommunityFiles> list); // 게시글 수정 및 새로운 첨부파일 목록 등록
	
	// 익명 게시글 삭제 서비스
	int deleteAnonymousBoard(String abNo); // 게시글 삭제
	int deleteCommunityReplyList(String abNo); // 해당 게시글 댓글 목록 삭제
	int deleteCommunityFileList(String abNo); // 첨부파일 목록 삭제
	
	// 익명 게시글 댓글 목록 조회 서비스
	ArrayList<CommunityReply> selectReplyList(String abNo); // 댓글 목록 조회
	
	// 익명 게시글 댓글 작성 서비스
	int insertReply(CommunityReply cr); // 댓글 작성
	
	// 익명 게시글 댓글 수정 서비스
	int updateReply(CommunityReply cr); // 댓글 수정
	
	// 익명 게시글 댓글 삭제 서비스
	int deleteReply(CommunityReply cr); // 댓글 삭제
	
	// 나의 익명 게시글 목록 조회 서비스
	ArrayList<AnonymousBoard> selectTotalAnonymousBoardList(); // 전체 익명 게시글의 게시글 번호 및 사원번호 조회
	ArrayList<AnonymousBoard> selectMyAnonymousBoardList(PageInfo pi, ArrayList<String> myAbNoList); // 나의 익명 게시글 목록 조회
	
	// 익명 게시글 신고 서비스
	
	// 익명 게시글 댓글 신고 서비스
	
	
}
