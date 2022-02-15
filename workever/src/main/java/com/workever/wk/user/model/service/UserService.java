package com.workever.wk.user.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

public interface UserService {
	
	User loginUser(User u);
	
	int emailDoubleCheck(String checkEmail);
	
	// 회사코드 중복체크
	int companyCodeCheckAdmin(String companyCode);
	
	// 회사코드 확인(사원)
	//int companyCodeCheckUser(String companyCode);
	
	// 회원가입 (관리자)
	int insertCompany(HashMap<String, Object> admin);
	
	// 회원가입(사원)
	int insertUser(HashMap<String, Object> user);
	
	// 임시비밀번호 발급용 이메일확인
	int pwdEmailCheck(User u);
	
	// 임시비밀번호 DB업데이트
	int updateTemPwd(User u);

	// 현재비밀번호 확인(ajax)
	User checkBeforePwdCheck(User u);
	
	// 비밀번호 변경 서비스
	int updatePwd(User u);
	
	// 사원 회원정보 변경
	int updateUserProfile(User u);
	
	// 부서 목록 조회
	ArrayList<Dept> selectDept(String comNo);
	
	// 관리자 프로필 변경
	int updateAdminProfile(User u);
	
	// 사원승인 -> 미승인 사원 조회
	ArrayList<User> selectDisableUser(String cno);
	
	// 사원승인 서비스
	int userEnable(User u);
}
