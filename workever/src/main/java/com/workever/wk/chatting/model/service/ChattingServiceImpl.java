package com.workever.wk.chatting.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.chatting.model.dao.ChattingDao;
import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.vo.User;

@Service
public class ChattingServiceImpl implements ChattingService {
	
	@Autowired
	private ChattingDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	

	@Override
	public int abSelectListCount() {
		return cDao.abSelectListCount(sqlSession);
	}

	@Override
	public ArrayList<User> abSelectList(PageInfo pi) {
		return cDao.abSelectList(sqlSession, pi);
	}

}
