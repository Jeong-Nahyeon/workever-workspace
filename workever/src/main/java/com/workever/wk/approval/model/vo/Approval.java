package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Approval {	 // 전자결재 통합 vo
	private int apvlNo;
	private int apvlWriter;
	private String apvlFormNo;
	private String apvlTitle;
	private String apvlCreateDate;
	private String apvlStatus;
}
