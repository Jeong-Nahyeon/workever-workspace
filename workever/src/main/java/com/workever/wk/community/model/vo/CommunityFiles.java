package com.workever.wk.community.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommunityFiles {
	
	private int cfNo;				// 파일번호
	private String cfCategory;		// 게시판분류(N 공지 / D 부서 / A 익명)
	private int cfRefNo;			// 참조글번호
	private String cfOriginName;	// 원본파일명
	private String cfChangeName;	// 수정파일명
	private String cfPath;			// 저장경로
	
}
