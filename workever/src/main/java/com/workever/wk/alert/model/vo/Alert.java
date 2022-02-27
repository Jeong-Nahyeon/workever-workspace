package com.workever.wk.alert.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Alert {
	private int alertNo;
	private String alertType;
	private int alertBoardNo;
	private String alertContent;
	private int alertReceiveUser;
	private String alertDate;
	private String alertCheck;
	
	private String sendUser;
	private String alertUrl;
}
