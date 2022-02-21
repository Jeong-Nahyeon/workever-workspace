package com.workever.wk.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MailReceive {

	private String mrNo;			// 수신메일번호
	private String msNo;			// 발신메일번호
	private String userNo;			// 수신자사원번호
	private String mrReceiver;		// 수신자이메일
	private String mrCC;			// 참조여부(Y 참조자 O / N 참조자 X)
	private String mrRead;			// 읽음상태(Y 읽음 / N 안읽음)
	private String mrFolder;		// 보관폴더(R 받은메일함 / D 삭제메일함)
	private String mrStatus;		// 영구삭제여부(Y 보관 / N 삭제)	
	
}
