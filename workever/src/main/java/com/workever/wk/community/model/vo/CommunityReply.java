package com.workever.wk.community.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommunityReply {

	private String crNo;			// 댓글번호
	private String crUserNo;		// 암호화된사원번호(익명) / 평문인사원번호(부서별)
	private String crCategory;		// 댓글분류(D 부서 / A 익명)
	private String crContent;		// 댓글내용
	private String crRefNo;			// 참조글번호
	private String crDate;			// 작성일
	private String crStatus;		// 게시상태(Y 게시 / N 비게시 / B 블라인드)
	private String crReportCount;	// 익명댓글신고횟수

	private String userRank;		// 직급명
	private String userName;		// 사원명
	private String userFilePath;	// 프로필사진경로
	
	private int correct;			// 로그인한 사원과 작성사원 일치 여부(0 불일치 / 1 일치)
	
}
