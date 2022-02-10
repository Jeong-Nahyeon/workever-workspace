package com.workever.wk.approval.model.service;

import java.util.ArrayList;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.approval.model.vo.ApprovalBuisnessTripForm;
import com.workever.wk.approval.model.vo.ApprovalDayOffForm;
import com.workever.wk.approval.model.vo.ApprovalExpenseReportForm;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.approval.model.vo.ApprovalOverTimeForm;
import com.workever.wk.approval.model.vo.ApprovalWorkReportForm;
import com.workever.wk.common.model.vo.PageInfo;

public interface ApprovalService {
	
	
	// 1. 내가 작성한 결재 리스트 서비스 (페이징)
	int userWriteListCount(int loginUserNo);
	ArrayList<Approval> userWriteApprovalList(PageInfo pi, int loginUserNo);
	ArrayList<Approval> writeChangeCategoryList(String category, int loginUserNo); //ajax
	
	// 2. 내가 수신한 결재 리스트 서비스 (페이징)
	int userReceiveListCount(int loginUserNo);
	ArrayList<Approval> userReceiveApprovalList(PageInfo pi, int loginUserNo);
	ArrayList<ApprovalLine> approvalLineList(int apvlNo);
	
	// 3. 전자 결재 작성하기 서비스
	int insertApproval(Approval apvl, ApprovalDayOffForm apvlDayOff, ApprovalLine apvlLine); // 1.휴가신청서
	int insertApproval(Approval apvl, ApprovalOverTimeForm apvlOverTime, ApprovalLine apvlLine); // 2.연장근무신청서
	int insertApproval(Approval apvl, ApprovalWorkReportForm apvlWorkReport, ApprovalLine apvlLine); // 3.업무보고서
	int insertApproval(Approval apvl, ApprovalExpenseReportForm apvlExpenseReport, ApprovalLine apvlLine); // 4.지출품의서
	int insertApproval(Approval apvl, ApprovalBuisnessTripForm apvlBuisnessTrip, ApprovalLine apvlLine); // 5.출장신청서
	
	// 4. 
}
