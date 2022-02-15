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

	private String crNo;		// 댓글번호
	private String userNo;		// 사원번호(부서별 게시판용)
	private String crCategory;	// 댓글분류(D 부서 / A 익명)
	private String crContent;	// 댓글내용
	private String crRefNo;		// 참조글번호
	private String crDate;		// 작성일
	private String crStatus;	// 게시상태(Y 게시 / N 비게시 / B 블라인드)

}
