package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalOverTimeForm { // 연장 근무 신청서 양식
	private String otDate;
	private String otWorkingHours;
	private String otTitle;
	private String otContent;
}
