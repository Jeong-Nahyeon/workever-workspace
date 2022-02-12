package com.workever.wk.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.project.model.vo.Project;
import com.workever.wk.user.model.vo.User;

@Repository
public class ProjectDao {
	
	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession){
		 return (ArrayList)sqlSession.selectList("projectMapper.selectList");
	}

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return 0;
	}
	
	
	//프로젝트생성란에 있는 부서별 회원 목록 조회
	public ArrayList<Project> selectMem(SqlSessionTemplate sqlSession, int num) {
		return (ArrayList)sqlSession.selectList("projectMapper.selectList", num);
	}

}
