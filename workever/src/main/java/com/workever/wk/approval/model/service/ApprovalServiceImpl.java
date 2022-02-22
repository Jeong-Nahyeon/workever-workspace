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
import com.workever.wk.approval.model.vo.ApprovalForm;
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
	public int userWriteListCount(User loginUser) {
		return aDao.userWriteListCount(sqlSession, loginUser);
	}
	
	// 내가 작성한 결재 리스트 조회
	@Override
	public ArrayList<Approval> userWriteApprovalList(PageInfo pi, User loginUser) {
		return aDao.userWriteApprovalList(sqlSession, pi, loginUser);
	}
	
	// 내가 작성한 결재 카테고리 조회 카운트
	@Override
	public int writeChangeCategoryListCount(Map<String,Object> map) {
		return aDao.writeChangeCategoryListCount(sqlSession, map);
	}
	// 내가 작성한 결재 리스트 카테고리별 조회
	@Override
	public ArrayList<Approval> writeChangeCategoryList(PageInfo pi, Map<String,Object> map) {
		return aDao.writeChangeCategoryList(sqlSession, pi, map);
	}
	
	// 내가 수신한 결재 리스트 카운트
	@Override
	public int userReceiveListCount(User loginUser) {
		return aDao.userReceiveListCount(sqlSession, loginUser);
	}

	// 내가 수신한 결재 리스트 조회
	@Override
	public ArrayList<Approval> userReceiveApprovalList(PageInfo pi, User loginUser) {
		return aDao.userReceiveApprovalList(sqlSession, pi, loginUser);
	}
	
	// 내가 수신한 결재 결재선 조회
	@Override
	public ArrayList<ApprovalLine> approvalLineList(int apvlNo) {
		return aDao.approvalLineList(sqlSession, apvlNo);
	}
	
	// 내가 수신한 결재 카테고리 조회 카운트
	@Override
	public int receiveChangeCategoryListCount(Map<String,Object> map) {
		return aDao.receiveChangeCategoryListCount(sqlSession, map);
	}
	
	// 내가 수신한 결재 리스트 카테고리별 조회(ajax)
	@Override
	public ArrayList<Approval> receiveChangeCategoryList(PageInfo pi, Map<String,Object> map) {
		return aDao.receiveChangeCategoryList(sqlSession, pi, map);
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

	@Override
	public ArrayList<ApprovalForm> selectFormList(int comNo) {
		return aDao.selectFormList(sqlSession, comNo);
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

	// 전자결재 삭제
	@Override
	public int deleteApproval(int apvlNo) {
		return aDao.deleteApproval(sqlSession, apvlNo);
	}

	// 전자결재 반려처리
	@Override
	public int returnApproval(ApprovalLine returnApvl) {
		return aDao.returnApproval(sqlSession, returnApvl);
	}

	// 전자결재 승인처리
	@Override
	public int approveApproval(ApprovalLine approveApvl) {
		return aDao.approveApproval(sqlSession, approveApvl);
	}

	// 전자결재 승인처리(마지막순번)
	@Override
	public int lastApproveApproval(ApprovalLine approveApvl, String apvlFormNo) {
		return aDao.lastApproveApproval(sqlSession, approveApvl, apvlFormNo);
	}

	// 전자결재 수정
	@Override
	public int updateApproval(Map<String, Object> map) {
		return aDao.updateApproval(sqlSession, map);
	}

	// 작성한 전자결재 검색 리스트 카운트
	@Override
	public int searchWriteApvlListCount(Map<String, Object> map) {
		return aDao.searchWriteApvlListCount(sqlSession, map);
	}

	// 작성한 전자결재 검색 리스트 조회
	@Override
	public ArrayList<Approval> searchWriteApvlList(PageInfo pi, Map<String, Object> map) {
		return aDao.searchWriteApvlList(sqlSession, pi, map);
	}

	// 수신한 전자결재 검색 리스트 카운트
	@Override
	public int searchReceiveApvlListCount(Map<String, Object> map) {
		return aDao.searchReceiveApvlListCount(sqlSession, map);
	}

	// 수신한 전자결재 검색 리스트 조회
	@Override
	public ArrayList<Approval> searchReceiveApvlList(PageInfo pi, Map<String, Object> map) {
		return aDao.searchReceiveApvlList(sqlSession, pi, map);
	}
	
	// 전체 결재 양식 조회
	@Override
	public ArrayList<ApprovalForm> selectAllFormList(int comNo) {
		return aDao.selectAllFormList(sqlSession, comNo);
	}
	
	
	// 결재 양식 remove
	@Override
	public int ajaxRemoveForm(Map<String, Object> map) {
		return aDao.ajaxRemoveForm(sqlSession, map);
	}

	// 결재 양식 add
	@Override
	public int ajaxAddForm(Map<String, Object> map) {
		return aDao.ajaxAddForm(sqlSession, map);
	}
	
	// 변경된 양식 정보 조회
	@Override
	public ArrayList<ApprovalForm> changeStatusFormList(Map<String, Object> map) {
		return aDao.changeStatusFormList(sqlSession, map);
	}


	

	











}
