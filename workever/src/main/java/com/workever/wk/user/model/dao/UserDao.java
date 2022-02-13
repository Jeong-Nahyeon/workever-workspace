package com.workever.wk.user.model.dao;

import java.util.HashMap;

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

	// 회원가입 서비스(관리자)
	public int insertCompany(SqlSessionTemplate sqlSession, HashMap<String, Object> admin) {
		return sqlSession.insert("userMapper.insertCompany", admin);
	}
	
	// 회원가입 서비스(사원)
	public int insertUser(SqlSessionTemplate sqlSession, HashMap<String, Object> user) {
		return sqlSession.insert("userMapper.insertUser", user);
	}
	
	// 임시비밀번호 발급용 이메일 확인
	public int pwdEmailCheck(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.selectOne("userMapper.pwdEmailCheck", u);
	}
	
	// 임시비밀번호 DB 업데이트
	public int updateTemPwd(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.update("userMapper.updateTemPwd", u);
	}
}
