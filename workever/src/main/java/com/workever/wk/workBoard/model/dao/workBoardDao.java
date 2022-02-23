package com.workever.wk.workBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

}
