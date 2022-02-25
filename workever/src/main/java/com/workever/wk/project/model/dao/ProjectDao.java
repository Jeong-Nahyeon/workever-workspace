package com.workever.wk.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.project.model.vo.Project;
import com.workever.wk.user.model.vo.User;
import com.workever.wk.workBoard.model.vo.workBoard;

@Repository
public class ProjectDao {
	
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession, int userNo){
		 return (ArrayList)sqlSession.selectList("projectMapper.selectList", userNo);
	}
		
	
	// 프로젝트 내용 insert
	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("projectMapper.insertProject", p);
	}

	// 프로젝트 참여멤버  insert
	public int insertMember(SqlSessionTemplate sqlSession, Project p) {
		String[] deptUserNo = p.getDeptUserNo().split(",");
		int result = 0;
		for(String userNo : deptUserNo) {
			result += sqlSession.insert("projectMapper.insertMember", userNo); 
		};
		return result;
	}
	
	// 프로젝트 참여부서 insert
	public int insertDept(SqlSessionTemplate sqlSession, Project p) {
		String[] proDeptNo = p.getProDept().split(",");
		int result = 0;
		for(String deptNo : proDeptNo) {
			result += sqlSession.insert("projectMapper.insertDept", deptNo); 
		};
		return result;
	}
	
	// 프로젝트생성란에 있는 부서별 회원 목록 조회
	public ArrayList<Project> selectMem(SqlSessionTemplate sqlSession, int num) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectMem", num);
	}
	
	
	// 프로젝트 삭제 메소드
	public int deleteProject(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.update("projectMapper.deleteProject", proNo);
	}

	// 프로젝트 상세 조회
	public ArrayList<workBoard> selectProject(SqlSessionTemplate sqlSession, int proNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectProject", proNo);
	}

	// 참여하고있는 인원들하고 참여하고있는 인원수 구해오는 메소드
	public ArrayList<Project> selectOther(SqlSessionTemplate sqlSession, int proNo) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectOther", proNo);

	}



}
