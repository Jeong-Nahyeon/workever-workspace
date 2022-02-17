package com.workever.wk.approval.model.service;

import java.util.ArrayList;
import java.util.Map;

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
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

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
	
	// 내가 작성한 결재 카테고리 조회 카운트
	@Override
	public int writeChangeCategoryListCount(String category, int loginUserNo) {
		return aDao.writeChangeCategoryListCount(sqlSession, category, loginUserNo);
	}
	// 내가 작성한 결재 리스트 카테고리별 조회(ajax)
	@Override
	public ArrayList<Approval> writeChangeCategoryList(PageInfo pi, String category, int loginUserNo) {
		return aDao.writeChangeCategoryList(sqlSession, pi, category, loginUserNo);
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
	
	// 내가 수신한 결재 카테고리 조회 카운트
	@Override
	public int receiveChangeCategoryListCount(String category, int loginUserNo) {
		return aDao.receiveChangeCategoryListCount(sqlSession, category, loginUserNo);
	}
	
	// 내가 수신한 결재 리스트 카테고리별 조회(ajax)
	@Override
	public ArrayList<Approval> receiveChangeCategoryList(String category, PageInfo pi, int loginUserNo) {
		return aDao.receiveChangeCategoryList(sqlSession, category, pi, loginUserNo);
	}
	
	// 작성자 부서명 조회
	@Override
	public String loginUSerDeptName(int loginUserNo) {		
		return aDao.loginUserDeptName(sqlSession, loginUserNo);
	}
	
	// 전체 부서 조회
	@Override
	public ArrayList<Dept> selectDeptList(int comNo) {
		return aDao.selectDeptList(sqlSession, comNo);
	}
	
	// 부서별 사원 조회
	public ArrayList<User> selectDeptUserList(Map<String,Object> map){
		return aDao.selectDeptUserList(sqlSession, map);
	}
	
	// 사원 검색(ajax)
	@Override
	public ArrayList<User> userSearchList(Map<String, Object> map) {
		return aDao.userSearchList(sqlSession, map);
	}
	
	// 선택 사원 (ajax)
	@Override
	public User selectUser(int selectUserNo) {
		return aDao.selectUser(sqlSession, selectUserNo);
	}

	// 전자 결재 작성
	@Override
	public int insertApproval(Map<String, Object> map) {
		return aDao.insertApproval(sqlSession, map);
	}

	// 전자 결재 상세 조회
	@Override
	public Approval selectApproval(int apvlNo) {
		return aDao.selectApproval(sqlSession,  apvlNo);
	}
	
	// 휴가신청서 조회
	@Override
	public ApprovalDayOffForm selectDayOffForm(int apvlNo) {
		return aDao.selectDayOffForm(sqlSession, apvlNo);
	}
	
	// 연장근무 신청서 조회
	@Override
	public ApprovalOverTimeForm selectOverTimeForm(int apvlNo) {
		return aDao.selectOverTimeForm(sqlSession, apvlNo);
	}

	// 업무 보고서 조회
	@Override
	public ApprovalWorkReportForm selectWorkReportForm(int apvlNo) {
		return aDao.selectWorkReportForm(sqlSession, apvlNo);
	}

	// 지출 품의서 조회
	@Override
	public ApprovalExpenseReportForm selectExpenseReportForm(int apvlNo) {
		return aDao.selectExpenseReportForm(sqlSession, apvlNo);
	}

	// 출장 신청서 조회
	@Override
	public ApprovalBuisnessTripForm selectBuisnessTripForm(int apvlNo) {
		return aDao.selectBuisnessTripForm(sqlSession, apvlNo);
	}
	











}
