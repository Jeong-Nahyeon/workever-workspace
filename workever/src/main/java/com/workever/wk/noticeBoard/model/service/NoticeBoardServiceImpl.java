package com.workever.wk.noticeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
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

}
