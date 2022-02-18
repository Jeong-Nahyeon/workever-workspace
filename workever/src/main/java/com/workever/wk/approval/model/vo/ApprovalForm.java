package com.workever.wk.approval.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class ApprovalForm { // 결재 양식 vo
	private int apvlFormNo;
	private String apvlFormName;
	private String apvlFormStatus;
}
