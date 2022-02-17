package com.workever.wk.workBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString

public class workBoard {
	 private int workBoardNo;
	 private int proNo;
	 private int userNo;
	 private String workManager;
	 private String workStartDate;
	 private String workEndDate;
	 private String workStatus;
	 private String workPriority;
	 private String workProgress;
	 private String workContent;
	 private String workCreateDate;
	 private String boardStatus;
	 private String workwriter;

}
