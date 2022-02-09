package com.workever.wk.noticeBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class NoticeBoard {

	private int nbNo;			// 공지글번호
	private int userNo;			// 사원번호
	private String nbTitle;		// 공지제목
	private String nbContent;	// 공지내용
	private int nbCount;		// 조회수
	private String nbDate;		// 작성일
	private String nbStatus;	// 게시상태(Y 게시 / N 비게시)
	
}
