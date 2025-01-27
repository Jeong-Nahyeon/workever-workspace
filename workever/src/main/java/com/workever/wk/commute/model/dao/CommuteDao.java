package com.workever.wk.commute.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.User;

@Repository
public class CommuteDao {
	
	/*
	 * 출퇴근 관리 (User)
	 */

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
	
	public int cmSelectSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("commuteMapper.cmSelectSearchCount", map);
	}
	
	public ArrayList<Commute> cmSelectSearchList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.cmSelectSearchList", map, rowBounds);
	}
	
	
	
	/*
	 * 출퇴근 관리 (Admin)
	 */
	
	public int adCmSelectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commuteMapper.adCmSelectCount");
	}
	
	public ArrayList<Commute> adCmSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.adCmSelectList", null, rowBounds);
	}
	
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

	public int adCmSelectSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("commuteMapper.adCmSelectSearchCount", map);
	}

	public ArrayList<Commute> adCmSelectSearchList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.adCmSelectSearchList", map, rowBounds);
	}
	
	
	/*
	 * 근무 내역 (User)
	 */
	
	public int whSelectListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("commuteMapper.whSelectListCount", userNo);
	}

	public ArrayList<Commute> whSelectList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.whSelectList", userNo, rowBounds);
	}
	
	public int whSelectSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("commuteMapper.whSelectSearchCount", map);
	}

	public ArrayList<Commute> whSelectSearchList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.whSelectSearchList", map, rowBounds);
	}

	
	
	/*
	 * 휴가 관리 (User)
	 */
	
	public int doSelectListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("commuteMapper.doSelectListCount", userNo);
	}

	public ArrayList<Approval> doSelectList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.doSelectList", userNo, rowBounds);
	}

	public Approval doSelectReason(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("commuteMapper.doSelectReason", apvlNo);
	}

	public Approval doSelectReturn(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("commuteMapper.doSelectReturn", apvlNo);
	}

	public int doSelectSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("commuteMapper.doSelectSearchCount", map);
	}

	public ArrayList<Approval> doSelectSearchList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.doSelectSearchList", map, rowBounds);
	}
	
	
	/*
	 * 휴가 관리 (Admin)
	 */
	
	public int adDoSelectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commuteMapper.adDoSelectListCount");
	}

	public ArrayList<Approval> adDoSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.adDoSelectList", null, rowBounds);
	}
	
	public int adDoSelectSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("commuteMapper.adDoSelectSearchCount", map);
	}

	public ArrayList<Approval> adDoSelectSearchList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.adDoSelectSearchList", map, rowBounds);
	}
	
	
	/*
	 * 연장근무 관리 (User)
	 */
	
	public int otSelectListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("commuteMapper.otSelectListCount", userNo);
	}

	public ArrayList<Approval> otSelectList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.otSelectList", userNo, rowBounds);
	}
	
	public Approval otSelectReason(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("commuteMapper.otSelectReason", apvlNo);
	}
	
	public Approval otSelectReturn(SqlSessionTemplate sqlSession, int apvlNo) {
		return sqlSession.selectOne("commuteMapper.otSelectReturn", apvlNo);
	}
	
	public int otSelectSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("commuteMapper.otSelectSearchCount", map);
	}

	public ArrayList<Approval> otSelectSearchList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.otSelectSearchList", map, rowBounds);
	}
	
	
	/*
	 * 연장근무 관리 (Admin)
	 */

	public int adOtSelectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("commuteMapper.adOtSelectListCount");
	}

	public ArrayList<Approval> adOtSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.adOtSelectList", null, rowBounds);
	}

	public int adOtSelectSearchCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.selectOne("commuteMapper.adOtSelectSearchCount", map);
	}

	public ArrayList<Approval> adOtSelectSearchList(SqlSessionTemplate sqlSession, Map<String, Object> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("commuteMapper.adOtSelectSearchList", map, rowBounds);
	}

	

	


	

	

}
