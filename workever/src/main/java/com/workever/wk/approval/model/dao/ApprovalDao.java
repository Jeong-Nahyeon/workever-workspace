package com.workever.wk.approval.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

@Repository
public class ApprovalDao {
	
	// 내가 작성한 결재 리스트 카운트
	public int userWriteListCount(SqlSessionTemplate sqlSession, int loginUserNo) {
		return sqlSession.selectOne("approvalMapper.userWriteListCount", loginUserNo);
	}
	
	// 내가 작성한 결재 리스트 조회
	public ArrayList<Approval> userWriteApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, int loginUserNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.userWriteApprovalList", loginUserNo, rowBounds);
	}
	
	// 내가 작성한 결재 카테고리 리스트 카운트
	public int writeChangeCategoryListCount(SqlSessionTemplate sqlSession, String category, int loginUserNo) {
		if(category.equals("SI")) {
			return sqlSession.selectOne("approvalMapper.writeIngCategoryListCount", loginUserNo);			
		}else {
			return sqlSession.selectOne("approvalMapper.writeCompleteCategoryListCount", loginUserNo);			
		}
	}
	// 내가 작성한 결재 리스트 카테고리별 조회(ajax)
	public ArrayList<Approval> writeChangeCategoryList(SqlSessionTemplate sqlSession, PageInfo pi, String category, int loginUserNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(category.equals("SI")) {
			return (ArrayList)sqlSession.selectList("approvalMapper.writeIngCategoryList", loginUserNo, rowBounds);			
		}else {
			return (ArrayList)sqlSession.selectList("approvalMapper.writeCompleteCategoryList", loginUserNo, rowBounds);			
		}
	}
	
	// 결재 결재선 조회
	public ArrayList<ApprovalLine> approvalLineList(SqlSessionTemplate sqlSession, int apvlNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.approvalLineList", apvlNo);
	}
	
	// 내가 수신한 결재 리스트 카운트
	public int userReceiveListCount(SqlSessionTemplate sqlSession, int loginUserNo) {
		return sqlSession.selectOne("approvalMapper.userReceiveListCount", loginUserNo);
	}
	
	// 내가 수신한 결재 리스트 조회
	public ArrayList<Approval> userReceiveApprovalList(SqlSessionTemplate sqlSession, PageInfo pi, int loginUserNo)	{
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("approvalMapper.userReceiveApprovalList", loginUserNo, rowBounds);
	}
	
	// 내가 작성한 결재 카테고리 리스트 카운트
	public int receiveChangeCategoryListCount(SqlSessionTemplate sqlSession, String category, int loginUserNo) {
		if(category.equals("S")) {
			return sqlSession.selectOne("approvalMapper.receiveIngCategoryListCount", loginUserNo);			
		}else {
			return sqlSession.selectOne("approvalMapper.receiveCompleteCategoryListCount", loginUserNo);			
		}
	}
		
	// 내가 수신한 결재 리스트 카테고리별 조회(ajax)
	public ArrayList<Approval> receiveChangeCategoryList(SqlSessionTemplate sqlSession, String category, PageInfo pi, int loginUserNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		if(category.equals("S")) {
			return (ArrayList)sqlSession.selectList("approvalMapper.receiveIngCategoryList", loginUserNo, rowBounds);			
		}else {
			return (ArrayList)sqlSession.selectList("approvalMapper.receiveCompleteCategoryList", loginUserNo, rowBounds);			
		}
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
		int formNo = Integer.parseInt(((Approval)map.get("apvl")).getApvlFormNo());
		
		if(formNo == 1) {
			return sqlSession.insert("approvalMapper.apvlDayOffForm",map);
		}else if(formNo == 2) {
			return sqlSession.insert("approvalMapper.apvlOverTimeForm",map);
		}else if(formNo == 3) {
			return sqlSession.insert("approvalMapper.apvlWorkReportForm",map);
		}else if(formNo == 4) {
			return sqlSession.insert("approvalMapper.apvlExpenseReportForm",map);
		}else {
			return sqlSession.insert("approvalMapper.apvlBuisnessTripForm",map);
		}
	}
	
}
