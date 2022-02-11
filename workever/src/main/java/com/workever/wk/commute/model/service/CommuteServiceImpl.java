package com.workever.wk.commute.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.commute.model.dao.CommuteDao;
import com.workever.wk.commute.model.vo.Commute;

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


	
//	@Override
//	public int insertEnter(int uno) {
//		return cDao.insertEnter(sqlSession, uno);
//	}

}
