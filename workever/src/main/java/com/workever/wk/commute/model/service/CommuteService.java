package com.workever.wk.commute.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.User;

public interface CommuteService {
	
	// 근태 조회용
	int cmSelectListCount(int userNo);
	ArrayList<Commute> cmSelectList(int userNo, PageInfo pi);
	
	// 출근 기록용
	int cmInertEnter(Commute cm);
	int cmInertTardiness(Commute cm);
	
	// 퇴근 기록용
	int cmUpdateLeave(Commute cm);
	
	// 검색용
	int cmSelectSearchCount(Map<String, Object> map);
	ArrayList<Commute> cmSelectSearchList(Map<String, Object> map, PageInfo pi);
	
	// Admin 근태 조회용
	int adCmSelectListCount();
	ArrayList<Commute> adCmSelectList(PageInfo pi);
	
	// Admin 결근자 조회/처리용
	ArrayList<User> adSelectAbsenceUserList();
	int adInsertAbsence(ArrayList<User> absenceUserList);
	
	

}
