package com.workever.wk.todo.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.todo.model.service.TodoService;
import com.workever.wk.todo.model.vo.Todo;
import com.workever.wk.user.model.vo.User;

@Controller
public class TodoController {

	@Autowired
	private TodoService tService;
	
	// todo 페이지 연결
	@RequestMapping("todo.do")
	public String todoPage(HttpSession session, Model model) {
		
		// 날짜 구하기
		LocalDate now = LocalDate.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yy/MM/dd");
		String today = now.format(format);
		
		User loginUser = (User) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		HashMap<String, String> user = new HashMap<String, String>();
		user.put("userNo", userNo);
		user.put("today", today);
			
		ArrayList<Todo> todoList = tService.selectTodoList(user);
		//System.out.println(todoList);
		
		model.addAttribute("todoList", todoList);
		model.addAttribute("today", today);
		return "schedule/todo";
	}
	
	// todo 등록
	@RequestMapping("insertTodo.do")
	public String insertTodo(Todo todo, HttpSession session, Model model) {
		//System.out.println(todo);
		
		int result = tService.insertTodo(todo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "Todo를 등록했습니다.");
			return "redirect:/todo.do";
		}else {
			model.addAttribute("errorMsg", "Todo 등록 실패");
			return "common/errorPage";
		}
	}
	
	// todo check 클릭 시 status 변경
	@ResponseBody
	@RequestMapping("todoCheck.do")
	public String updateTodoCheck(String todoNo, String todoStatus) {
		System.out.println(todoStatus);
		
		Todo todo = new Todo();
		todo.setTodoNo(todoNo);
		todo.setTodoStatus(todoStatus);
		System.out.println(todo);
		if(todo.getTodoStatus().equals("S")) {
			todo.setTodoStatus("D");
		}else {
			todo.setTodoStatus("E");
		}
		
		int result = tService.updateTodoCheck(todo);
		
		return result > 0 ? "NNNNY" : "NNNNN";
	}
	
	// todo 수정
	@RequestMapping("updateTodo.do")
	public String updateTodo(Todo todo, HttpSession session, Model model) {
		int result = tService.updateTodo(todo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "Todo를 수정했습니다.");
			return "redirect:/todo.do";
		}else {
			model.addAttribute("errorMsg", "Todo 수정 실패");
			return "common/errorPage";
		}
	}
	
	// todo 삭제
	@ResponseBody
	@RequestMapping("deleteTodo.do")
	public String deleteTodo(String todoNo) {
		int result = tService.deleteTodo(todoNo);
		
		return result > 0 ? "NNNNY" : "NNNNN";
	}
	
	// 메인페이지 todolist 조회
	@ResponseBody
	@RequestMapping("mainTodoList.do")
	public String mainTodoList(HttpSession session) {
		LocalDate now = LocalDate.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yy/MM/dd");
		String today = now.format(format);
		
		User loginUser = (User) session.getAttribute("loginUser");
		String userNo = loginUser.getUserNo();
		
		HashMap<String, String> user = new HashMap<String, String>();
		user.put("userNo", userNo);
		user.put("today", today);
		
		ArrayList<Todo> todoList = tService.mainTodoList(user);
		Gson gson = new Gson();
		return gson.toJson(todoList);
		
	}
}
