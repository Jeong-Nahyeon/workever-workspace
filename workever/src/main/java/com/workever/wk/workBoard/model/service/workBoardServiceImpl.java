package com.workever.wk.workBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.workBoard.model.dao.workBoardDao;
import com.workever.wk.workBoard.model.vo.Reply;
import com.workever.wk.workBoard.model.vo.workBoard;

@Service
public class workBoardServiceImpl implements workBoardService{

	@Autowired
	private workBoardDao wbDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override//게시판 입력
	public int insertBoard(workBoard wb) {
		return wbDao.insertBoard(sqlSession, wb);
	}
	
	@Override // 첨부파일 입력
	public int insertAttachment(workBoard wb) {
		return wbDao.insertAttachment(sqlSession, wb);
	}
	
	
	@Override
	public ArrayList<workBoard> myWork(int proNo, String workManager) {
		return wbDao.myWork(sqlSession, proNo, workManager);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////////

	
	@Override
	public int increaseCount(int boardNo) {
		return 0;
	}

	@Override
	public workBoard selectBoard(int boardNo) {
		return null;
	}

	@Override
	public int deleteBoard(int boardNo) {
		return 0;
	}

	@Override
	public int updateBoard(workBoard b) {
		return 0;
	}

	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return null;
	}

	@Override
	public int insertReply(Reply r) {
		return 0;
	}



}
