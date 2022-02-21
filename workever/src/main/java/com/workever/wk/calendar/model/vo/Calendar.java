package com.workever.wk.calendar.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter @Getter
@ToString
public class Calendar {

	private String calNo;
	private String userNo;
	private String calTitle;
	private String calMemo;
	private String calStartDate;
	private String calEndDate;
	private String calColor;
	private String calCategory;

}
