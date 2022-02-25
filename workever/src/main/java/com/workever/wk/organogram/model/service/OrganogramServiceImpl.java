package com.workever.wk.organogram.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.organogram.model.dao.OrganogramDao;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

@Service
public class OrganogramServiceImpl implements OrganogramService {
	
	@Autowired
	private OrganogramDao oDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 부서 목록 조회
	@Override
	public ArrayList<Dept> selectDept(String comNo) {
		return oDao.selectDept(sqlSession, comNo);
	}
	
	// 리스트 수 조회
	@Override
	public int selectUserListCount(User loginUser) {
		return oDao.selectUserListCount(sqlSession, loginUser);
	}

	// 전체사원조회
	@Override
	public ArrayList<User> selectAllUser(User loginUser, PageInfo pi) {
		return oDao.selectAllUser(sqlSession, loginUser, pi);
	}

}
