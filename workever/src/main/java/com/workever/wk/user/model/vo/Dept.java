package com.workever.wk.user.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Dept {
	
	private String deptNo;
	private String comNo;
	private String deptName;
	
	private String userCount;
}
