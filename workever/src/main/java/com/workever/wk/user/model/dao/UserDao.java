package com.workever.wk.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.user.model.vo.User;

@Repository
public class UserDao {
	
	// 로그인 서비스 
	public User loginUser(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.loginUser", u);
	}
	
	// 이메일 중복확인 서비스
	public int emailDoubleCheck(SqlSessionTemplate sqlSession, String checkEmail) {
		return sqlSession.selectOne("userMapper.emailDoubleCheck", checkEmail);
	}

	// 회사코드 중복확인 서비스
	public int companyCodeCheckAdmin(SqlSessionTemplate sqlSession, String companyCode) {
		return sqlSession.selectOne("userMapper.companyCodeCheckAdmin", companyCode);
	}
}
