package com.workever.wk.organogram.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Organogram {

	private String deptNo;
	private String deptName;
	
	private String userNo;
	private String userRank;
	private String userName;
	private String userEmail;
	
	private String comNo;
	private String comName;
	
}
