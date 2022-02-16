package com.workever.wk.project.model.service;

import java.util.ArrayList;

import com.workever.wk.project.model.vo.Project;
import com.workever.wk.user.model.vo.User;

public interface ProjectService{
	
	// 프로젝트 리스트 조회 서비스
	ArrayList<Project> selectList();
	
	
	// 프로젝트 작성하기 서비스
	int insertProject(Project p);
	
	// 프로젝트 참여멤버  insert
	int insertMember(Project p);
	
	// 프로젝트 참여부서 insert
	int insertDept(Project p);
	
	
	// 프로젝트 상세조회 서비스
	Project detailProject(int projectNo);
	
	
	// 프로젝트 삭제용 서비스
	int deleteProject(int proNo);
	
	
	// 프로젝트 수정용 서비스
	int updatetProject(Project p);

	// 프로젝트생성란에 있는 부서별 회원 목록 조회
	ArrayList<Project> selectMem(int num);
	

}
