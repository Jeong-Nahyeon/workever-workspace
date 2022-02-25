package com.workever.wk.organogram.model.service;

import java.util.ArrayList;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.user.model.vo.Dept;
import com.workever.wk.user.model.vo.User;

public interface OrganogramService {

	// 부서 목록 조회
	ArrayList<Dept> selectDept(String comNo);
	
	// 리스트 수 조회
	int selectUserListCount(User loginUser);
	
	// 전체 사원 조회
	ArrayList<User> selectAllUser(User loginUser, PageInfo pi);
	
	// 부서별 사원 수 조회
	int selectUserDeptListCount(User loginUser);
	
	// 부서별 사원 조회
	ArrayList<User> selectUser(User loginUser, PageInfo pi);
	
	// 부서 추가
	int insertDept(Dept dept);
	
	// 부서 수정
	int updateDept(Dept dept);
	
	// 부서 삭제
	int deleteDept(Dept dept);
}
