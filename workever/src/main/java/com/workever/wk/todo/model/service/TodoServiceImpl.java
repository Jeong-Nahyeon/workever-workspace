package com.workever.wk.todo.model.service;

import java.util.ArrayList;

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
	public ArrayList<Todo> selectTodoList(User loginUser) {
		return tDao.selectTodoList(sqlSession, loginUser);
	}
}
