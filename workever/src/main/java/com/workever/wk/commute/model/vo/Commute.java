package com.workever.wk.commute.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Commute {
	
	private String cmNo;
	private String userNo;
	private String cmDate;
	private String cmState;
	private String cmStartTime;
	private String cmEndTime;
	private String cmWorkingHours;
	
	private String userName;
	
	private String otWorkingHours;
	private String totalWorkingHours;
}
