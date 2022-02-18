package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalLine { // 결재선 vo
	private int apvlLineNo;
	private int apvlNo;
	private int userNo;
	private int apvlLineTurn;
	private String apvlLineStatus;
	private String apvlReturnComment;
	private String apvlDate;
	private String userName;
	private String userRank;
	
	private String apvlLineFilePath;
	private String apvlLineDeptName;
}
