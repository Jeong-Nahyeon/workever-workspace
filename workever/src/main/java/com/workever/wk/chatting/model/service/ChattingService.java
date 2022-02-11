package com.workever.wk.chatting.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.vo.User;

public interface ChattingService {
	
	int abSelectListCount();
	ArrayList<User> abSelectList(PageInfo pi);
}
