package com.workever.wk.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.project.model.dao.ProjectDao;
import com.workever.wk.project.model.vo.Project;
import com.workever.wk.user.model.vo.User;



@Service
public class ProjectServiceImpl implements ProjectService{

	
	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	
	@Override
	public ArrayList<Project> selectList() {
		return pDao.selectList(sqlSession);
	}
	
	@Override
	public ArrayList<Project> selectMem(int num) {
		return pDao.selectMem(sqlSession, num);
	}
	
	
	
	@Override
	public int insertProject(Project p) {
		return pDao.insertProject(sqlSession, p);
	}
	
	@Override
	public Project detailProject(int projectNo) {
		return null;
	}

	@Override
	public int deleteProject(Project p) {
		return 0;
	}

	@Override
	public int updatetProject(Project p) {
		return 0;
	}


}
