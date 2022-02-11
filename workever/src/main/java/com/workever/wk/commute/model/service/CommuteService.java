package com.workever.wk.commute.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.vo.Commute;

public interface CommuteService {

	int cmSelectListCount(int userNo);
	ArrayList<Commute> cmSelectList(int userNo, PageInfo pi);
	
	// int insertEnter(int uno);

}
