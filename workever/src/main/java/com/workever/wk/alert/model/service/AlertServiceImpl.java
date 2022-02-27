package com.workever.wk.alert.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.alert.model.dao.AlertDao;
import com.workever.wk.alert.model.vo.Alert;

@Service
public class AlertServiceImpl implements AlertService{

	@Autowired
	private AlertDao alDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertAlert(Alert alert) {
		return alDao.insertAlert(sqlSession, alert);
	}

	@Override
	public int alertCount(int loginUserNo) {
		return alDao.alertCount(sqlSession, loginUserNo);
	}

	@Override
	public ArrayList<Alert> alertSelect(int loginUserNo) {
		return alDao.alertSelect(sqlSession, loginUserNo);
	}

	@Override
	public int alertCheck(int alertNo) {
		return alDao.alertCheck(sqlSession, alertNo);
	}
}
