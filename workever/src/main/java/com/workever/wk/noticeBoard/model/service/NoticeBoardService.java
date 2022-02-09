package com.workever.wk.noticeBoard.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.noticeBoard.model.vo.NoticeBoard;

public interface NoticeBoardService {
	
	// 공지사항 게시판 목록 조회 서비스 (기본 최신순 페이징 처리)
	int selectListCount();
	ArrayList<NoticeBoard> selectNoticeBoardList(PageInfo pi); // 최신순
	ArrayList<NoticeBoard> selectAscList(PageInfo pi); // 오래된순
	
	
	// 공지사항 게시글 검색 서비스 
	
	// 공지사항 게시글 상세 조회 서비스
	
	// 공지사항 게시글 작성 서비스 
	
	// 공지사항 게시글 수정 서비스
	
	// 공지사항 게시글 삭제 서비스
	
}
