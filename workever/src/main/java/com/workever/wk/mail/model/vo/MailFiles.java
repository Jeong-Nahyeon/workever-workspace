package com.workever.wk.mail.model.vo;

import java.util.ArrayList;

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
	
	private ArrayList<MailFiles> efList; // 받은메일 전달 시 기존의 첨부파일 정보 받을 용도
	
}
