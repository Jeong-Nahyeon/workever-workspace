package com.workever.wk.approval.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.approval.model.vo.ApprovalBuisnessTripForm;
import com.workever.wk.approval.model.vo.ApprovalDayOffForm;
import com.workever.wk.approval.model.vo.ApprovalExpenseReportForm;
import com.workever.wk.approval.model.vo.ApprovalForm;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.approval.model.vo.ApprovalOverTimeForm;
import com.workever.wk.approval.model.vo.ApprovalWorkReportForm;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

public interface ApprovalService {
	
	
	// 1. 내가 작성한 결재 리스트 서비스 (페이징)
	int userWriteListCount(User loginUser);
	ArrayList<Approval> userWriteApprovalList(PageInfo pi, User loginUser);
	
	int writeChangeCategoryListCount(Map<String,Object> map);
	ArrayList<Approval> writeChangeCategoryList(PageInfo pi, Map<String,Object> map);
	
	// 결재선 정보 가져오기
	ArrayList<ApprovalLine> approvalLineList(int apvlNo);

	// 2. 내가 수신한 결재 리스트 서비스 (페이징)
	int userReceiveListCount(User loginUser);
	ArrayList<Approval> userReceiveApprovalList(PageInfo pi, User loginUser);
	
	
	int receiveChangeCategoryListCount(Map<String,Object> map);
	ArrayList<Approval> receiveChangeCategoryList(PageInfo pi, Map<String,Object> map);
	
	
	// 3. 전자 결재 작성하기 서비스
	
	String loginUSerDeptName(int loginUserNo); // 작성자 부서명 조회
	ArrayList<Dept> selectDeptList(int comNo); // 전체 부서 조회
	ArrayList<User> selectDeptUserList(Map<String,Object> map); // 전체 사원 조회
	ArrayList<User> userSearchList(Map<String,Object> map); // 사원 검색(ajax)
	User selectUser(int selectUserNo); // 사원 선택(ajax)
	int insertApproval(Map<String,Object> map); // 전자결재 작성
	ArrayList<ApprovalForm> selectFormList(int comNo);
	
	
	// 4. 전자결재 상세 조회 서비스
	Approval selectApproval(int apvlNo); // 전자결재 상세 조회
	ApprovalDayOffForm selectDayOffForm(int apvlNo); // 휴가신청서
	ApprovalOverTimeForm selectOverTimeForm(int apvlNo); // 연장근무신청서
	ApprovalWorkReportForm selectWorkReportForm(int apvlNo); // 업무 보고서
	ApprovalExpenseReportForm selectExpenseReportForm(int apvlNo); // 지출 품의서
	ApprovalBuisnessTripForm selectBuisnessTripForm(int apvlNo); // 출장 신청서
	
	// 5. 전자결제 삭제 서비스
	int deleteApproval(int apvlNo);
	
	// 6. 전자결재 반려 서비스
	int returnApproval(ApprovalLine returnApvl);
	
	// 7. 전자결재 승인 서비스(진행중 결재)
	int approveApproval(ApprovalLine approveApvl);
	
	// 8. 전자결재 승인 서비스(완료 결재)
	int lastApproveApproval(ApprovalLine approveApvl, String apvlFormNo);
	int dayOffCommuteInsert(Map<String,Object> map);
	
	// 9. 전자결재 수정 서비스
	int updateApproval(Map<String,Object> map);
	
	// 10. 작성한 전자결재 검색 서비스
	int searchWriteApvlListCount(Map<String,Object> map);
	ArrayList<Approval> searchWriteApvlList(PageInfo pi, Map<String,Object> map);
	
	// 11. 수신한 전자결재 검색 서비스
	int searchReceiveApvlListCount(Map<String,Object> map);
	ArrayList<Approval> searchReceiveApvlList(PageInfo pi, Map<String,Object> map);

	// 12. 관리자 양식관리 서비스
	ArrayList<ApprovalForm> selectAllFormList(int comNo); // 전체 결재 양식 조회
	int ajaxRemoveForm(Map<String,Object> map); // 전자결재 양식 remove
	int ajaxAddForm(Map<String,Object> map);
	ArrayList<ApprovalForm> changeStatusFormList(Map<String,Object> map); // 변경된 양식 정보 조회
	
	// 13. 메인페이지 결재 조회 서비스
	ArrayList<Approval> mainWriteApvl(User loginUser);
	ArrayList<Approval> mainReceiveApvl(User loginUser);
}
