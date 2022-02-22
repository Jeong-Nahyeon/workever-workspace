package com.workever.wk.commute.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.User;

public interface CommuteService {
	
	/*
	 * 출퇴근 관리
	 */
	
	// 근태 조회용
	int cmSelectListCount(int userNo);
	ArrayList<Commute> cmSelectList(int userNo, PageInfo pi);
	
	// 출근 기록용
	int cmInertEnter(Commute cm);
	int cmInertTardiness(Commute cm);
	
	// 퇴근 기록용
	int cmUpdateLeave(Commute cm);
	
	// 근태 검색용
	int cmSelectSearchCount(Map<String, Object> map);
	ArrayList<Commute> cmSelectSearchList(Map<String, Object> map, PageInfo pi);
	
	// Admin 근태 조회용
	int adCmSelectListCount();
	ArrayList<Commute> adCmSelectList(PageInfo pi);
	
	// Admin 결근자 조회/처리용
	ArrayList<User> adSelectAbsenceUserList();
	int adInsertAbsence(ArrayList<User> absenceUserList);
	
	// Admin 근태 검색용
	int adCmSelectSearchCount(Map<String, Object> map);
	ArrayList<Commute> adCmSelectSearchList(Map<String, Object> map, PageInfo pi);
	
	
	/*
	 * 근무 내역
	 */
	
	// 근무내역 조회용
	int whSelectListCount(int userNo);
	ArrayList<Commute> whSelectList(int userNo, PageInfo pi);
	
	// 근무내역 검색용
	int whSelectSearchCount(Map<String, Object> map);
	ArrayList<Commute> whSelectSearchList(Map<String, Object> map, PageInfo pi);
		
	
	/*
	 * 휴가 관리
	 */
	
	// 휴가 조회용
	int doSelectListCount(int userNo);
	ArrayList<Approval> doSelectList(int userNo, PageInfo pi);
	
	// 휴가 내용, 반려 사유 모달용
	Approval doSelectReason(int apvlNo);
	Approval doSelectReturn(int apvlNo);
	
	// 휴가 검색용
	int doSelectSearchCount(Map<String, Object> map);
	ArrayList<Approval> doSelectSearchList(Map<String, Object> map, PageInfo pi);
	
	// Admin 휴가 조회용
	int adDoSelectListCount();
	ArrayList<Approval> adDoSelectList(PageInfo pi);
	
	
	/*
	 * 연장근무 관리
	 */
	
	// 연장근무 조회용
	int otSelectListCount(int userNo);
	ArrayList<Approval> otSelectList(int userNo, PageInfo pi);
	
	// Admin 연장근무 조회용
	int adOtSelectListCount();
	ArrayList<Approval> adOtSelectList(PageInfo pi);
	
	
	
	

}
