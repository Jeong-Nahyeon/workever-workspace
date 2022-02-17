package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalWorkReportForm { // 업무 보고서 양식
	private int apvlNo;
	private String workName;
	private String workDate;
	private String workPlan;
}
