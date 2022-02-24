package com.workever.wk.todo.model.service;

import java.util.ArrayList;

import com.workever.wk.todo.model.vo.Todo;
import com.workever.wk.user.model.vo.User;

public interface TodoService {
	
	// todo 목록 조회
	ArrayList<Todo> selectTodoList(User loginUser);

}
