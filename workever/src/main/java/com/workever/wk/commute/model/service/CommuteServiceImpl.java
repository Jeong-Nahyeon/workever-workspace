package com.workever.wk.commute.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.approval.model.vo.Approval;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.dao.CommuteDao;
import com.workever.wk.commute.model.vo.Commute;
import com.workever.wk.user.model.vo.User;

@Service
public class CommuteServiceImpl implements CommuteService{
	
	@Autowired
	private CommuteDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/*
	 * 출퇴근 관리 (User)
	 */
	
	@Override
	public int cmSelectListCount(int userNo) {
		return cDao.cmSelectListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Commute> cmSelectList(int userNo, PageInfo pi) {
		return cDao.cmSelectList(sqlSession, userNo, pi);
	}

	@Override
	public int cmInertEnter(Commute cm) {
		return cDao.cmInertEnter(sqlSession, cm);
	}

	@Override
	public int cmInertTardiness(Commute cm) {
		return cDao.cmInertTardiness(sqlSession, cm);
	}
	
	@Override
	public int cmUpdateLeave(Commute cm) {
		return cDao.cmUpdateLeave(sqlSession, cm);
	}
	
	@Override
	public int cmSelectSearchCount(Map<String, Object> map) {
		return cDao.cmSelectSearchCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<Commute> cmSelectSearchList(Map<String, Object> map, PageInfo pi) {
		return cDao.cmSelectSearchList(sqlSession, map, pi);
	}


	/*
	 * 출퇴근 관리 (Admin)
	 */

	@Override
	public int adCmSelectListCount() {
		return cDao.adCmSelectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Commute> adCmSelectList(PageInfo pi) {
		return cDao.adCmSelectList(sqlSession, pi);
	}
	
	@Override
	public ArrayList<User> adSelectAbsenceUserList() {
		return cDao.adSelectAbsenceUserList(sqlSession);
	}

	@Override
	public int adInsertAbsence(ArrayList<User> absenceUserList) {
		return cDao.adInsertAbsence(sqlSession, absenceUserList);
	}

	@Override
	public int adCmSelectSearchCount(Map<String, Object> map) {
		return cDao.adCmSelectSearchCount(sqlSession, map);
	}

	@Override
	public ArrayList<Commute> adCmSelectSearchList(Map<String, Object> map, PageInfo pi) {
		return cDao.adCmSelectSearchList(sqlSession, map, pi);
	}


	
	/*
	 * 휴가 관리 (User)
	 */
	
	@Override
	public int doSelectListCount(int userNo) {
		return cDao.doSelectListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Approval> doSelectList(int userNo, PageInfo pi) {
		return cDao.doSelectList(sqlSession, userNo, pi);
	}

	@Override
	public Approval doSelectReason(int apvlNo) {
		return cDao.doSelectReason(sqlSession, apvlNo);
	}

	@Override
	public Approval doSelectReturn(int apvlNo) {
		return cDao.doSelectReturn(sqlSession, apvlNo);
	}






}
