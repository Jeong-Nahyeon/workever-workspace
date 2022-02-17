package com.workever.wk.approval.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.approval.model.vo.ApprovalBuisnessTripForm;
import com.workever.wk.approval.model.vo.ApprovalDayOffForm;
import com.workever.wk.approval.model.vo.ApprovalExpenseReportForm;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.approval.model.vo.ApprovalOverTimeForm;
import com.workever.wk.approval.model.vo.ApprovalWorkReportForm;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

public interface ApprovalService {
	
	
	// 1. 내가 작성한 결재 리스트 서비스 (페이징)
	int userWriteListCount(int loginUserNo);
	ArrayList<Approval> userWriteApprovalList(PageInfo pi, int loginUserNo);
	
	int writeChangeCategoryListCount(String category, int loginUserNo);
	ArrayList<Approval> writeChangeCategoryList(PageInfo pi, String category, int loginUserNo);
	
	// 결재선 정보 가져오기
	ArrayList<ApprovalLine> approvalLineList(int apvlNo);

	// 2. 내가 수신한 결재 리스트 서비스 (페이징)
	int userReceiveListCount(int loginUserNo);
	ArrayList<Approval> userReceiveApprovalList(PageInfo pi, int loginUserNo);
	
	
	int receiveChangeCategoryListCount(String category, int loginUserNo);
	ArrayList<Approval> receiveChangeCategoryList(String category, PageInfo pi, int loginUserNo);
	
	
	// 3. 전자 결재 작성하기 서비스
	
	String loginUSerDeptName(int loginUserNo); // 작성자 부서명 조회
	ArrayList<Dept> selectDeptList(int comNo); // 전체 부서 조회
	ArrayList<User> selectDeptUserList(Map<String,Object> map); // 전체 사원 조회
	ArrayList<User> userSearchList(Map<String,Object> map); // 사원 검색(ajax)
	User selectUser(int selectUserNo); // 사원 선택(ajax)
	int insertApproval(Map<String,Object> map); // 전자결재 작성
	
	
	// 4. 전자결재 상세 조회 서비스
	Approval selectApproval(int apvlNo); // 전자결재 상세 조회
	ApprovalDayOffForm selectDayOffForm(int apvlNo); // 휴가신청서
	ApprovalOverTimeForm selectOverTimeForm(int apvlNo); // 연장근무신청서
	ApprovalWorkReportForm selectWorkReportForm(int apvlNo); // 업무 보고서
	ApprovalExpenseReportForm selectExpenseReportForm(int apvlNo); // 지출 품의서
	ApprovalBuisnessTripForm selectBuisnessTripForm(int apvlNo); // 출장 신청서
}
