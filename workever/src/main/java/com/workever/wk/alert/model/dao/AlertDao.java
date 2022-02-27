package com.workever.wk.alert.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.alert.model.vo.Alert;

@Repository
public class AlertDao {

	public int insertAlert(SqlSessionTemplate sqlSession, Alert alert) {
		return sqlSession.insert("alertMapper.insertAlert", alert);
	}
	
	public int alertCount(SqlSessionTemplate sqlSession, int loginUserNo) {
		return sqlSession.selectOne("alertMapper.alertCount", loginUserNo);
	}
	
	public ArrayList<Alert> alertSelect(SqlSessionTemplate sqlSession, int loginUserNo){
		return (ArrayList)sqlSession.selectList("alertMapper.alertSelect", loginUserNo);
	}
	
	public int alertCheck(SqlSessionTemplate sqlSession, int alertNo) {
		return sqlSession.update("alertMapper.alertCheck", alertNo);
	}
}
