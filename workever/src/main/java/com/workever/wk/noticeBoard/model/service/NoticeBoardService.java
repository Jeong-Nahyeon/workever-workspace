package com.workever.wk.noticeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.noticeBoard.model.vo.NoticeBoard;

public interface NoticeBoardService {
	
	// 공지사항 게시판 목록 조회 서비스 (페이징 처리)
	int selectListCount(); // 게시글 총 개수
	ArrayList<NoticeBoard> selectNoticeBoardList(PageInfo pi); // 최신순 목록 조회
	ArrayList<NoticeBoard> selectAscList(PageInfo pi); // 오래된순 목록 조회
	
	
	// 공지사항 게시글 검색 서비스 (페이징 처리)
	int selectSearchCount(HashMap<String, String> map); // 검색한 게시글 총 개수
	ArrayList<NoticeBoard> selectSearchList(HashMap<String, String> map, PageInfo pi); // 최신순 검색 목록 조회
	ArrayList<NoticeBoard> selectSearchAscList(HashMap<String, String> map, PageInfo pi); // 오래된순 검색 목록 조회
	
	// 공지사항 게시글 상세 조회 서비스
	int increaseCount(int nbNo); // 조회수 증가
	NoticeBoard selectNoticeBoard(int nbNo); // 게시글 상세 조회
	ArrayList<CommunityFiles> selectCommunityFilesList(int nbNo); // 첨부파일 조회
	
	// 공지사항 게시글 작성 서비스 
	int insertNoticeBoard(NoticeBoard nb, ArrayList<CommunityFiles> list); // 게시글 등록
	
	// 공지사항 게시글 수정 서비스
	
	// 공지사항 게시글 삭제 서비스
	
}
