package com.workever.wk.deptBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class DeptBoard {
	
	private int dbNo;			// 부서별글번호
	private int deptNo;			// 부서번호
	private int userNo;			// 사원번호
	private String dbTitle;		// 부서별제목
	private String dbContent;	// 부서별내용
	private String dbCategory;	// 게시글분류(N공지 / NULL 일반)
	private int dbPin;			// 공지상단고정(0 고정 X / 1 고정 O)
	private int dbCount;		// 조회수
	private String dbDate;		// 작성일
	private String dbStatus;	// 게시상태(Y 게시 / N 비게시)
	private int dbReplyCount;	// 댓글개수
	
	private String deptName;	// 부서명
	private String userName;	// 사원명
	private String userRank;	// 직급명
	
}
