package com.workever.wk.approval.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository
public class ApprovalDao {
	
	// 내가 작성한 결재 리스트 카운트
	public int userWriteListCount(SqlSessionTemplate sqlSession, User loginUser) {
		return sqlSession.selectOne("approvalMapper.userWriteListCount", loginUser);
	}
	
	// 내가 작성한 결재 리스트 조회
	public ArrayList<Approval> userWriteApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, User loginUser) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.userWriteApprovalList", loginUser, rowBounds);
	}
	
	// 내가 작성한 결재 카테고리 리스트 카운트
	public int writeChangeCategoryListCount(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return sqlSession.selectOne("approvalMapper.writeCategoryListCount", map);			
	}
	
	// 내가 작성한 결재 리스트 카테고리별 조회
	public ArrayList<Approval> writeChangeCategoryList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String,Object> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.writeCategoryList", map, rowBounds);			
	}
	
	// 결재 결재선 조회
	public ArrayList<ApprovalLine> approvalLineList(SqlSessionTemplate sqlSession, int apvlNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.approvalLineList", apvlNo);
	}
	
	// 내가 수신한 결재 리스트 카운트
	public int userReceiveListCount(SqlSessionTemplate sqlSession, User loginUser) {
		return sqlSession.selectOne("approvalMapper.userReceiveListCount", loginUser);
	}
	
	// 내가 수신한 결재 리스트 조회s
	public ArrayList<Approval> userReceiveApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, User loginUser)	{
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.userReceiveApprovalList", loginUser, rowBounds);
	}
	
	// 내가 작성한 결재 카테고리 리스트 카운트
	public int receiveChangeCategoryListCount(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return sqlSession.selectOne("approvalMapper.receiveCategoryListCount", map);			
	}
		
	// 내가 수신한 결재 리스트 카테고리별 조회
	public ArrayList<Approval> receiveChangeCategoryList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String,Object> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		System.out.println(map);
		return (ArrayList)sqlSession.selectList("approvalMapper.receiveCategoryList", map, rowBounds);			
	}
	
	// 결재 작성자 부서명 조회
	public String loginUserDeptName(SqlSessionTemplate sqlSession, int loginUserNo) {
		return sqlSession.selectOne("approvalMapper.insertUserDeptName", loginUserNo);
	}
	
	// 전체 부서 조회
	public ArrayList<Dept> selectDeptList(SqlSessionTemplate sqlSession, int comNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeptList", comNo);
	}
	
	// 부서별 사원 조회(ajax)
	public ArrayList<User> selectDeptUserList(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectDeptUserList", map);
	}
	
	// 사원 검색(ajax)
	public ArrayList<User> userSearchList(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return (ArrayList)sqlSession.selectList("approvalMapper.userSearchList", map);
	}
	
	// 선택 사원(ajax)
	public User selectUser(SqlSessionTemplate sqlSession, int selectUserNo) {
		return sqlSession.selectOne("approvalMapper.selectUser",selectUserNo);
	}
	
	// 전자결재 작성
	public int insertApproval(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		int apvl = sqlSession.insert("approvalMapper.insertApproval", map);
		int apvlLine = sqlSession.insert("approvalMapper.insertApvlLine", map);
		
		return apvl * apvlLine;
	}
	
	// 전자결재 양식 리스트 조회
	public ArrayList<ApprovalForm> selectFormList(SqlSessionTemplate sqlSession, int comNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.selectFormList", comNo);
	}
	
	// 전자결재 조회
	public Approval selectApproval(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("approvalMapper.selectApproval", apvlNo);
	}
	
	// 휴가신청서 조회
	public ApprovalDayOffForm selectDayOffForm(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("approvalMapper.selectDayOffForm", apvlNo);
	}
	
	// 연장 근무 신청서 조회
	public ApprovalOverTimeForm selectOverTimeForm(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("approvalMapper.selectOverTimeForm", apvlNo);
	}
	
	// 업무 보고서 조회
	public ApprovalWorkReportForm selectWorkReportForm(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("approvalMapper.selectWorkReportForm", apvlNo);
	}
	
	// 지출 품의서 조회
	public ApprovalExpenseReportForm selectExpenseReportForm(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("approvalMapper.selectExpenseReportForm", apvlNo);
	}
	
	// 출장 신청서 조회
	public ApprovalBuisnessTripForm selectBuisnessTripForm(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("approvalMapper.selectBuisnessTripForm", apvlNo);
	}
	
	// 작성한 전자결재 삭제
	public int deleteApproval(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.update("approvalMapper.deleteApproval", apvlNo);
	}
	
	// 수신한 전자결재 반려
	public int returnApproval(SqlSessionTemplate sqlSession, ApprovalLine returnApvl) {
		int result1 = sqlSession.update("approvalMapper.returnApproval", returnApvl);
		int result2 = sqlSession.update("approvalMapper.returnLine", returnApvl);
		return result1 * result2;
	}
	
	// 수신한 전자결재 승인
	public int approveApproval(SqlSessionTemplate sqlSession, ApprovalLine approveApvl) {
		int result1 = sqlSession.update("approvalMapper.approveApproval", approveApvl);
		int result2 = sqlSession.update("approvalMapper.approveLine", approveApvl);
		return result1 * result2;
	}
	
	// 수신한 전자결재 승인(마지막 순번)
	public int lastApproveApproval(SqlSessionTemplate sqlSession, ApprovalLine approveApvl, String apvlFormNo) {
		int result1 = sqlSession.update("approvalMapper.lastApproveApproval", approveApvl);
		int result2 = sqlSession.update("approvalMapper.lastApproveLine", approveApvl);
		if(apvlFormNo.equals("1")) {
			int result3 = sqlSession.update("approvalMapper.userUseDateUpdate", approveApvl);
			return result1 * result2 * result3;
		}else {
			return result1 * result2;
		}
	}
	
	public int dayOffCommuteInsert(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		System.out.println(map);
		return sqlSession.insert("approvalMapper.dayOffCommuteInsert", map);
	}
	
	// 전자결재 수정
	public int updateApproval(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		int apvl = sqlSession.update("approvalMapper.approvalUpdate", map);
		int apvlForm = sqlSession.update("approvalMapper.approvalFormUpdate", map);
		int apvlLineDelete = sqlSession.delete("approvalMapper.deleteApvlLine", map);
		int apvlLine = sqlSession.insert("approvalMapper.updateApvlLine", map);
		
		return apvl * apvlForm * apvlLineDelete * apvlLine;
	}
	
	// 작성한 전자결재 검색 리스트 카운트
	public int searchWriteApvlListCount(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return sqlSession.selectOne("approvalMapper.searchWriteApvlListCount", map);
	}
	
	// 작성한 전자결재 검색 리스트 조회
	public ArrayList<Approval> searchWriteApvlList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String,Object> map){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.searchWriteApvlList", map, rowBounds);
	}
	
	// 수신한 전자결재 검색 리스트 카운트
	public int searchReceiveApvlListCount(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return sqlSession.selectOne("approvalMapper.searchReceiveApvlListCount", map);
	}
	
	// 수신한 전자결재 검색 리스트 조회
	public ArrayList<Approval> searchReceiveApvlList(SqlSessionTemplate sqlSession, PageInfo pi, Map<String,Object> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("approvalMapper.searchReceiveApvlList", map, rowBounds);
	}
	
	// 전채 양식 조회
	public ArrayList<ApprovalForm> selectAllFormList(SqlSessionTemplate sqlSession, int comNo){
		return (ArrayList)sqlSession.selectList("approvalMapper.selectAllFormList", comNo);
	}

	// 결재 양식 remove
	public int ajaxRemoveForm(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return sqlSession.update("approvalMapper.removeForm", map);
	}
	
	// 결재 양식 add
	public int ajaxAddForm(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return sqlSession.update("approvalMapper.addForm", map);
	}
	
	// 변경된 양식 정보 조회
	public ArrayList<ApprovalForm> changeStatusFormList(SqlSessionTemplate sqlSession, Map<String,Object> map) {
		return (ArrayList)sqlSession.selectList("approvalMapper.changeStatusFormList", map);
	}
	
	public ArrayList<Approval> mainWriteApvl(SqlSessionTemplate sqlSession, User loginUser){
		return (ArrayList)sqlSession.selectList("approvalMapper.mainWriteApvl", loginUser);
	}
	
	public ArrayList<Approval> mainReceiveApvl(SqlSessionTemplate sqlSession, User loginUser){
		return (ArrayList)sqlSession.selectList("approvalMapper.mainReceiveApvl", loginUser);
	}
	
	
	
}
