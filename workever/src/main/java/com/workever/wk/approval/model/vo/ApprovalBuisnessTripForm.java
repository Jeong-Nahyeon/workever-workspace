package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalBuisnessTripForm { //출장 신청서 양식
	private String btPlace;
	private String btStartDate;
	private String btEndDate;
	private int btExpense;
	private String btPurpose;
}
