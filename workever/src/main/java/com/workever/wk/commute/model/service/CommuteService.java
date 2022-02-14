package com.workever.wk.commute.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.vo.Commute;

public interface CommuteService {
	
	// 근태 조회용
	int cmSelectListCount(int userNo);
	ArrayList<Commute> cmSelectList(int userNo, PageInfo pi);
	
	// 출근 기록용
	int cmInertEnter(Commute cm);
	int cmInertTardiness(Commute cm);
	
	// 퇴근 기록용
	int cmUpdateLeave(Commute cm);

}
