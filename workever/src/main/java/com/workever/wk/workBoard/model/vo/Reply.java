package com.workever.wk.workBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Reply {
	 private int replyNo;
	 private int refWorkBoard;
	 private int userNo;
	 private String replyWriter;
	 private String replyContent;
	 private String replyCreateDate;
	 private String replyUpdateDate;
	 private String replyStatus;
}
