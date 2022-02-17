package com.workever.wk.anonymousBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class AnonymousBoard {
	
	private String abNo;			// 익명글번호
	private String abTitle;			// 익명제목
	private String abContent;		// 익명내용
	private String abCount;			// 조회수
	private String abDate;			// 작성일
	private String abStatus;		// 게시상태(Y 게시 / N 비게시 / B 블라인드)
	private String abReportCount;	// 신고횟수
	private String abReplyCount;	// 댓글개수
	private String abUserNo;		// 암호화된사원번호
	
}
