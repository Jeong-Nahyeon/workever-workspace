package com.workever.wk.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MailSend {
	
	private String msNo;			// 발신메일번호
	private String userNo;			// 발신자사원번호
	private String msSender;		// 보낸사람이메일주소
	private String msTitle;			// 메일제목
	private String msContent;		// 메일내용
	private String msDate;			// 발신일시
	private String msFolder;		// 보관폴더(S 보낸메일함 / D 삭제메일함)
	private String msStatus;		// 영구삭제여부(Y 보관 / N 삭제)
	
}
