package com.workever.wk.todo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.workever.wk.todo.model.service.TodoService;
import com.workever.wk.todo.model.vo.Todo;
import com.workever.wk.user.model.vo.User;

@Controller
public class TodoController {

	@Autowired
	private TodoService tService;
	
	// todo 페이지 연결
	@RequestMapping("todo.do")
	public String todoPage(HttpSession session) {
		
		User loginUser = (User) session.getAttribute("loginUser");
		ArrayList<Todo> todoList = tService.selectTodoList(loginUser);
		
		session.setAttribute("todoList", todoList);
		
		return "schedule/todo";
	}
}
