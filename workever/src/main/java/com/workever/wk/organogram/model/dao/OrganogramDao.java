package com.workever.wk.organogram.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

@Repository
public class OrganogramDao {
	
	// 부서 목록 조회
	public ArrayList<Dept> selectDept(SqlSessionTemplate sqlSession, String comNo){
		return (ArrayList)sqlSession.selectList("organogramMapper.selectDept", comNo);
	}
	
	// 리스트 수 조회
	public int selectUserListCount(SqlSessionTemplate sqlSession, User loginUser) {
		return sqlSession.selectOne("organogramMapper.selectUserListCount", loginUser);
	}
	
	// 전체 사원 조회
	public ArrayList<User> selectAllUser(SqlSessionTemplate sqlSession, User loginUser, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("organogramMapper.selectAllUser", loginUser, rowBounds);
	}

}
