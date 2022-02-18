package com.workever.wk.report.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Report {
	
	private String reportNo;		// 신고번호
	private String userNo;			// 신고작성사원번호
	private String reportCategory;	// 신고분류(B 게시글 / R 댓글)
	private String reportRefNo;		// 참조글번호
	private String reportGroup;		// 신고유형
	private String reportContent;	// 신고내용
	private String reportDate;		// 신고시간
	private String reportStatus;	// 게시상태(Y 노출 / N 비노출)
	
}
