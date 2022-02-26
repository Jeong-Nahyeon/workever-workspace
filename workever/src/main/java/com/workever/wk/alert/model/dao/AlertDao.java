package com.workever.wk.alert.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.alert.model.vo.Alert;

@Repository
public class AlertDao {

	public int insertAlert(SqlSessionTemplate sqlSession, Alert alert) {
		return sqlSession.insert("alertMapper.insertAlert", alert);
	}
}
