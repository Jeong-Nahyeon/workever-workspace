package com.workever.wk.commute.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.User;

@Repository
public class CommuteDao {

	public int cmSelectListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("commuteMapper.cmSelectListCount", userNo);
	}

	public ArrayList<Commute> cmSelectList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.cmSelectList", userNo, rowBounds);
	}

	public int cmInsertEnter(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.insert("commuteMapper.cmInsertEnter", userNo);
	}

	public int cmInertEnter(SqlSessionTemplate sqlSession, Commute cm) {
		return sqlSession.insert("commuteMapper.cmInsertEnter", cm);
	}

	public int cmInertTardiness(SqlSessionTemplate sqlSession, Commute cm) {
		return sqlSession.insert("commuteMapper.cmInertTardiness", cm);
	}
	
	public int cmUpdateLeave(SqlSessionTemplate sqlSession, Commute cm) {
		return sqlSession.update("commuteMapper.cmUpdateLeave", cm);
	}
	
	
	
	// 관리자
	public ArrayList<User> adSelectAbsenceUserList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("userMapper.adSelectAbsenceUserList");
	}

	public int adInsertAbsence(SqlSessionTemplate sqlSession, ArrayList<User> absenceUserList) {
		
		int result = 0;
		for(User user : absenceUserList) {
			result = sqlSession.insert("commuteMapper.adInsertAbsence", user);
		}
		return result;
	}

	




	

}