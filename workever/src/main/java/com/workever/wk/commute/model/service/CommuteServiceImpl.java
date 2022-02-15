package com.workever.wk.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	
	// 관리자
	@Override
	public ArrayList<User> adSelectAbsenceUserList() {
		return cDao.adSelectAbsenceUserList(sqlSession);
	}

	@Override
	public int adInsertAbsence(ArrayList<User> absenceUserList) {
		return cDao.adInsertAbsence(sqlSession, absenceUserList);
	}





}
