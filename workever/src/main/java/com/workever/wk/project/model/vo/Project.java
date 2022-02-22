package com.workever.wk.project.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class Project {
	 private int proNo;
	 private String proTitle;
	 private String proGrantWhether;
	 private String proCreateDate;
	 private String proStatus;
	 private String proManager;
	 private int proNumberPeople;
	 private String proDept;
	 private String deptUserName;
	 private String deptUserNo;
	 private String proUserName;
}
