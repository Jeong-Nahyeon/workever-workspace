package com.workever.wk.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MailFiles {

	private String mfNo;			// 파일번호
	private String mfMsNo;			// 발신메일번호
	private String mfOriginName;	// 원본파일명
	private String mfChangeName;	// 수정파일명
	private String mfPath;			// 저장경로
	
}
