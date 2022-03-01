package com.workever.wk.chatting.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.vo.User;

public interface ChattingService {
	
	// 주소록
	int abSelectListCount();
	ArrayList<User> abSelectList(PageInfo pi);

	// 주소록 검색
	ArrayList<User> abSelectSearchList(String keyword);
	
	
	// 채팅 초대 리스트
	ArrayList<User> ivSelectList();
}
