package com.workever.wk.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.dao.UserDao;
import com.workever.wk.user.model.vo.Dept;
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

	// 이메일 중복체크 서비스
	@Override
	public int emailDoubleCheck(String checkEmail) {
		int count = uDao.emailDoubleCheck(sqlSession, checkEmail);
		return count;
	}

	// 회사코드 중복체크 서비스
	@Override
	public int companyCodeCheckAdmin(String companyCode) {
		int count = uDao.companyCodeCheckAdmin(sqlSession, companyCode);
		return count;
	}

	// 회원가입 서비스(관리자)
	@Override
	public int insertCompany(HashMap<String, Object> admin) {
		int result = uDao.insertCompany(sqlSession, admin);
		return result;
	}

	// 회원가입 서비스(사원)
	@Override
	public int insertUser(HashMap<String, Object> user) {
		int result = uDao.insertUser(sqlSession, user);
		return result;
	}

	// 임시비밀번호 발급용 이메일 확인
	@Override
	public int pwdEmailCheck(User u) {
		return uDao.pwdEmailCheck(sqlSession, u);
	}

	// 임시비밀번호 DB업데이트
	@Override
	public int updateTemPwd(User u) {
		return uDao.updateTemPwd(sqlSession, u);
	}

	// 현재비밀번호 확인(ajax)
	@Override
	public User checkBeforePwdCheck(User u) {
		return uDao.checkBeforePwdCheck(sqlSession, u);
	}

	// 비밀번호 변경 서비스
	@Override
	public int updatePwd(User u) {
		return uDao.updatePwd(sqlSession, u);
	}

	// 사원 프로필 변경 서비스
	@Override
	public int updateUserProfile(User u) {
		return uDao.updateUserProfile(sqlSession, u);
	}

	// 부서 목록 조회
	@Override
	public ArrayList<Dept> selectDept(String comNo) {
		return uDao.selectDept(sqlSession, comNo);
	}

	// 관리자 프로필 변경 서비스
	@Override
	public int updateAdminProfile(User u) {
		int result = 0;
		int updateUser = uDao.updateAdminProfileUser(sqlSession, u);
		int updateCompany = uDao.updateAdminProfileCompany(sqlSession, u);
		
		return result = updateUser * updateCompany;
	}

	// 사원승인 -> 미승인 사원 조회
	@Override
	public ArrayList<User> selectDisableUser(String cno) {
		return uDao.selectDisableUser(sqlSession, cno);
	}

	// 사원승인 서비스
	@Override
	public int userEnable(User u) {
		return uDao.userEnable(sqlSession, u);
	}

	// 리스트 수 조회
	@Override
	public int selectUserListCount(User adminUser) {
		return uDao.selectUserListCount(sqlSession, adminUser);
	}
	// 전체사원 조회
	@Override
	public ArrayList<User> selectAllUser(User adminUser, PageInfo pi) {
		return uDao.selectAllUser(sqlSession, adminUser, pi);
	}

	

	
	

	

	
}
