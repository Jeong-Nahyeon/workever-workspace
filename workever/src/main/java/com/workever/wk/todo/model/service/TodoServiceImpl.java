package com.workever.wk.todo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.todo.model.dao.TodoDao;
import com.workever.wk.todo.model.vo.Todo;
import com.workever.wk.user.model.vo.User;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired
	private TodoDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// todo 목록 조회
	@Override
	public ArrayList<Todo> selectTodoList(HashMap<String, String> user) {
		return tDao.selectTodoList(sqlSession, user);
	}

	// todo 등록
	@Override
	public int insertTodo(Todo todo) {
		return tDao.insertTodo(sqlSession, todo);
	}

	// todo 상태 변경
	@Override
	public int updateTodoCheck(Todo todo) {
		return tDao.updateTodoCheck(sqlSession, todo);
	}

	// todo 수정
	@Override
	public int updateTodo(Todo todo) {
		return tDao.updateTodo(sqlSession, todo);
	}

	// todo 삭제
	@Override
	public int deleteTodo(String todoNo) {
		return tDao.deleteTodo(sqlSession, todoNo);
	}

	// main todo 조회
	@Override
	public ArrayList<Todo> mainTodoList(HashMap<String, String> user) {
		return tDao.mainTodoList(sqlSession, user);
	}
}
