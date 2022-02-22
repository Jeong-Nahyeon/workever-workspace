package com.workever.wk.workBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.workBoard.model.vo.workBoard;

@Repository
public class workBoardDao {

	public int insertBoard(SqlSessionTemplate sqlSession, workBoard wb) {
		return sqlSession.insert("projectMapper.insertWorkBoard", wb);
	}

}
