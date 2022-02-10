package com.workever.wk.approval.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.approval.model.vo.ApprovalLine;
import com.workever.wk.common.model.vo.PageInfo;

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
	
	// 내가 작성한 결재 리스트 카테고리별 조회(ajax)
	public ArrayList<Approval> writeChangeCategoryList(SqlSessionTemplate sqlSession, String category, int loginUserNo) {

		if(category.equals("SI")) {
			return (ArrayList)sqlSession.selectList("approvalMapper.writeIngCategoryList", loginUserNo);			
		}else {
			return (ArrayList)sqlSession.selectList("approvalMapper.writeCompleteCategoryList", loginUserNo);			
		}
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
	
	// 내가 수신한 결재 결재선 조회
	public ArrayList<ApprovalLine> approvalLineList(SqlSessionTemplate sqlSession, int apvlNo) {
		return (ArrayList)sqlSession.selectList("approvalMapper.approvalLineList", apvlNo);
	}
}
