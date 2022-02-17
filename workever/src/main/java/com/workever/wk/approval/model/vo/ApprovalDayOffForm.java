package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalDayOffForm { // 휴가 신청서 양식
	private int apvlNo;
	private String offStartDate;
	private String offEndDate;
	private int offTotalDate;
	private String offKind;
	private String offReason;
}
