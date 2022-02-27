package com.workever.wk.workBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.workBoard.model.vo.Reply;
import com.workever.wk.workBoard.model.vo.workBoard;

@Repository
public class workBoardDao {

	// 게시글안에 내용 담는 메소드
	public int insertBoard(SqlSessionTemplate sqlSession, workBoard wb) {
		return sqlSession.insert("projectMapper.insertWorkBoard", wb);
	}

	// 게시글안에 첨부파일 담는 메소드
	public int insertAttachment(SqlSessionTemplate sqlSession, workBoard wb) {
		return sqlSession.insert("projectMapper.insertAttachment", wb);
	}
	
	// 내업무 가져올 메소드
	public ArrayList<workBoard> myWork(SqlSessionTemplate sqlSession, int proNo, String workManager) {
		System.out.println(proNo);
		System.out.println(workManager);
		HashMap<String, Object> map = new HashMap<>();
		map.put("proNo", proNo);
		map.put("workManager", workManager); 
		return (ArrayList)sqlSession.selectList("projectMapper.selectMyWork", map);
	}

	// 댓글 입력 메소드
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("projectMapper.insertReply", r);
	}

	// 댓글 조회 메소드
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int refWorkBoard) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectReplyList", refWorkBoard);
	}
	
	
	
	
	
	
	
	
	
	
}
