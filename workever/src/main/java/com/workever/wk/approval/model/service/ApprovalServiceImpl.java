package com.workever.wk.approval.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.approval.model.dao.ApprovalDao;
import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.approval.model.vo.ApprovalBuisnessTripForm;
import com.workever.wk.approval.model.vo.ApprovalDayOffForm;
import com.workever.wk.approval.model.vo.ApprovalExpenseReportForm;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.approval.model.vo.ApprovalOverTimeForm;
import com.workever.wk.approval.model.vo.ApprovalWorkReportForm;
import com.workever.wk.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Autowired
	private ApprovalDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 내가 작성한 결재 리스트 카운트
	@Override
	public int userWriteListCount(int loginUserNo) {
		return aDao.userWriteListCount(sqlSession, loginUserNo);
	}
	
	// 내가 작성한 결재 리스트 조회
	@Override
	public ArrayList<Approval> userWriteApprovalList(PageInfo pi, int loginUserNo) {
		return aDao.userWriteApprovalList(sqlSession, pi, loginUserNo);
	}
	
	// 내가 작성한 결재 리스트 카테고리별 조회(ajax)
	@Override
	public ArrayList<Approval> writeChangeCategoryList(String category, int loginUserNo) {
		return aDao.writeChangeCategoryList(sqlSession, category, loginUserNo);
	}
	
	// 내가 수신한 결재 리스트 카운트
	@Override
	public int userReceiveListCount(int loginUserNo) {
		return aDao.userReceiveListCount(sqlSession, loginUserNo);
	}

	// 내가 수신한 결재 리스트 조회
	@Override
	public ArrayList<Approval> userReceiveApprovalList(PageInfo pi, int loginUserNo) {
		return aDao.userReceiveApprovalList(sqlSession, pi, loginUserNo);
	}
	
	// 내가 수신한 결재 결재선 조회
	@Override
	public ArrayList<ApprovalLine> approvalLineList(int apvlNo) {
		return aDao.approvalLineList(sqlSession, apvlNo);
	}

	@Override
	public int insertApproval(Approval apvl, ApprovalDayOffForm apvlDayOff, ApprovalLine apvlLine) {
		return 0;
	}

	@Override
	public int insertApproval(Approval apvl, ApprovalOverTimeForm apvlOverTime, ApprovalLine apvlLine) {
		return 0;
	}

	@Override
	public int insertApproval(Approval apvl, ApprovalWorkReportForm apvlWorkReport, ApprovalLine apvlLine) {
		return 0;
	}

	@Override
	public int insertApproval(Approval apvl, ApprovalExpenseReportForm apvlExpenseReport, ApprovalLine apvlLine) {
		return 0;
	}

	@Override
	public int insertApproval(Approval apvl, ApprovalBuisnessTripForm apvlBuisnessTrip, ApprovalLine apvlLine) {
		return 0;
	}




}
