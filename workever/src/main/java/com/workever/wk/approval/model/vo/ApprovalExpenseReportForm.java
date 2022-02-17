package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalExpenseReportForm { //지출 품의서 양식
	private int apvlNo;
	private String erDate;
	private String erAmount;
	private String erPurpose;
}
