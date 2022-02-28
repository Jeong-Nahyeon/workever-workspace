package com.workever.wk.todo.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.todo.model.vo.Todo;
import com.workever.wk.user.model.vo.User;

@Repository
public class TodoDao { 

	// todo 목록 조회
	public ArrayList<Todo> selectTodoList(SqlSessionTemplate sqlSession, HashMap<String, String> user) {
		return (ArrayList) sqlSession.selectList("todoMapper.selectTodoList", user);
	}

	// todo 등록
	public int insertTodo(SqlSessionTemplate sqlSession, Todo todo) {
		return sqlSession.insert("todoMapper.insertTodo", todo);
	}
	
	// todo 상태 변경
	public int updateTodoCheck(SqlSessionTemplate sqlSession, Todo todo) {
		return sqlSession.update("todoMapper.updateTodoCheck", todo);
	}
	
	// todo 수정
	public int updateTodo(SqlSessionTemplate sqlSession, Todo todo) {
		return sqlSession.update("todoMapper.updateTodo", todo);
	}
	
	// todo 삭제
	public int deleteTodo(SqlSessionTemplate sqlSession, String todoNo) {
		return sqlSession.delete("todoMapper.deleteTodo", todoNo);
	}

	// main todo
	public ArrayList<Todo> mainTodoList(SqlSessionTemplate sqlSession, HashMap<String, String> user) {
		return (ArrayList)sqlSession.selectList("todoMapper.mainTodoList", user);
	}
}
