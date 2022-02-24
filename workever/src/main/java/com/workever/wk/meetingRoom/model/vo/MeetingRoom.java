package com.workever.wk.meetingRoom.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MeetingRoom {
	private int mrCode;
	private String mrName;
	private String mrPlace;
	private String mrStatus;
	
	private int comNo;
}
