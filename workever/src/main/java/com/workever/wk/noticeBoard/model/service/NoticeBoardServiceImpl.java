package com.workever.wk.noticeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.community.model.vo.CommunityFiles;
import com.workever.wk.noticeBoard.model.dao.NoticeBoardDao;
import com.workever.wk.noticeBoard.model.vo.NoticeBoard;

@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private NoticeBoardDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 공지사항 게시글 목록 페이징 처리용 총 게시글 수 조회
	 */
	@Override
	public int selectListCount() {
		
		return nDao.selectListCount(sqlSession);
		
	}

	/**
	 * 공지사항 게시글 목록 조회(최신순/페이징 처리)
	 */
	@Override
	public ArrayList<NoticeBoard> selectNoticeBoardList(PageInfo pi) {
		
		return nDao.selectNoticeBoardList(sqlSession, pi);
		
	}

	/**
	 * 공지사항 게시글 목록 조회(오래된순/페이징 처리)
	 */
	@Override
	public ArrayList<NoticeBoard> selectAscList(PageInfo pi) {
		
		return nDao.selectAscList(sqlSession, pi);
		
	}

	/**
	 * 공지사항 게시글 검색 목록 페이징 처리용 총 게시글 수 조회
	 */
	@Override
	public int selectSearchCount(HashMap<String, String> map) {
		
		return nDao.selectSearchCount(sqlSession, map);
		
	}

	/**
	 * 공지사항 게시글 검색 목록 조회(최신순/페이징 처리)
	 */
	@Override
	public ArrayList<NoticeBoard> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		
		return nDao.selectSearchList(sqlSession, map, pi);
		
	}

	/**
	 * 공지사항 게시글 검색 목록 조회(오래된순/페이징 처리)
	 */
	@Override
	public ArrayList<NoticeBoard> selectSearchAscList(HashMap<String, String> map, PageInfo pi) {
		
		return nDao.selectSearchAscList(sqlSession, map, pi);
		
	}

	/**
	 * 공지사항 게시글 조회수 증가
	 */
	@Override
	public int increaseCount(int nbNo) {

		return nDao.increaseCount(sqlSession, nbNo);
		
	}

	/**
	 * 공지사항 게시글 상세 조회
	 */
	@Override
	public NoticeBoard selectNoticeBoard(int nbNo) {

		return nDao.selectNoticeBoard(sqlSession, nbNo);
		
	}

	/**
	 * 공지사항 게시글 첨부파일 조회
	 */
	@Override
	public ArrayList<CommunityFiles> selectCommunityFileList(int nbNo) {

		return nDao.selectCommunityFileList(sqlSession, nbNo);
		
	}

	/** 공지사항 게시글 등록 및 첨부파일 등록
	 *
	 */
	@Override
	public int insertNoticeBoard(NoticeBoard nb, ArrayList<CommunityFiles> list) {

		int result1 = nDao.insertNoticeBoard(sqlSession, nb);
				
		int result2 = 1;
		
		if(!list.isEmpty()) { // 첨부파일 있을 경우에만 실행되도록 조건 검사
			
			result2 = nDao.insertCommunityFileList(sqlSession, list);
			
		}
		
		return result1 * result2;
		
	}
	
	@Override
	public CommunityFiles selectCommunityFile(int cfNo) {
		
		return nDao.selectCommunityFile(sqlSession, cfNo);
		
	}
	
	@Override
	public int deleteCommunityFileList(int cfNo) {
		
		return nDao.deleteCommunityFileList(sqlSession, cfNo);
		
	}

	@Override
	public int updateNoticeBoard(NoticeBoard nb, ArrayList<CommunityFiles> list) {
		
		int result1 = nDao.updateNoticeBoard(sqlSession, nb);
		
		int result2 = 1;
		
		if(!list.isEmpty()) { // 첨부파일 있을 경우에만 실행되도록 조건 검사
			
			result2 = nDao.updateCommunityFileList(sqlSession, list);
			
		}
		
		return result1 * result2;
		
	}
	
	


	
	
	

}
