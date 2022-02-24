package com.workever.wk.todo.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.todo.model.vo.Todo;
import com.workever.wk.user.model.vo.User;

@Repository
public class TodoDao {

	// todo 목록 조회
	public ArrayList<Todo> selectTodoList(SqlSessionTemplate sqlSession, User loginUser) {
		return (ArrayList) sqlSession.selectList("todoMapper.selectTodoList", loginUser);
	}

}
