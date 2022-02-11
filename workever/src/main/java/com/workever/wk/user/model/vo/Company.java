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
public class Company {
	
	private String comNo;
	private String comName;
	private String comPhone;
	private String comClass;
	private String comEncode;
	private String comOriginName;
	private String comChangeName;
	private String comLogoPath;
}
