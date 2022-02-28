package com.workever.wk.todo.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.workever.wk.todo.model.vo.Todo;

public interface TodoService { 
	
	// todo 목록 조회
	ArrayList<Todo> selectTodoList(HashMap<String, String> user);
	
	// todo 등록
	int insertTodo(Todo todo);
	
	// todo 상태 변경
	int updateTodoCheck(Todo todo);
	
	// todo 수정
	int updateTodo(Todo todo);
	
	// todo 삭제
	int deleteTodo(String todoNo);

	// mainTodoList 조회
	ArrayList<Todo> mainTodoList(HashMap<String, String> user);
}
