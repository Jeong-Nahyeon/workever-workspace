package com.workever.wk.todo.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Todo {
	
	private String todoNo;
	private String userNo;
	private String todoTitle;
	private String todoMemo;
	private String todoImp;
	private String todoDate;
	private String todoStatus;
	
	// 오늘날짜
	private String today;

}
