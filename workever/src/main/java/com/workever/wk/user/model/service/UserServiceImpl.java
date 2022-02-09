package com.workever.wk.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.user.model.dao.UserDao;
import com.workever.wk.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao uDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public User loginUser(User u) {
		
		User loginUser = uDao.loginUser(sqlSession, u);
		return loginUser;
	}

	
}
