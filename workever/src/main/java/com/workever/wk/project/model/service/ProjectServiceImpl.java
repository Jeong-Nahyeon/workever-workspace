package com.workever.wk.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.common.model.vo.PageInfo;
import com.workever.wk.project.model.dao.ProjectDao;
import com.workever.wk.project.model.vo.Project;
import com.workever.wk.user.model.vo.User;
import com.workever.wk.workBoard.model.vo.workBoard;



@Service
public class ProjectServiceImpl implements ProjectService{

	
	@Autowired
	private ProjectDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Project> selectList(int userNo) {
		return pDao.selectList(sqlSession, userNo);
	}
	

	@Override
	public int selectListCount(int proNo) {
		return pDao.selectListCount(sqlSession, proNo);
	}
	
	
	@Override
	public ArrayList<workBoard> selectWorkList(int proNo, PageInfo pi) {
		return pDao.selectWorkList(sqlSession, proNo ,pi);
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
	public int insertMember(Project p) {
		return pDao.insertMember(sqlSession, p);
	}
	
	@Override
	public int insertDept(Project p) {
		return pDao.insertDept(sqlSession, p);
	}
	
	
	@Override
	public int deleteProject(int proNo) {
		return pDao.deleteProject(sqlSession, proNo);
	}
	
	@Override
	public ArrayList<workBoard> selectProject(int proNo) {
		return pDao.selectProject(sqlSession, proNo);
	}

	@Override
	public int updatetProject(Project p) {
		return 0;
	}

	//참여하고있는 인원들하고 참여하고있는 인원수 구해오는 메소드
	@Override
	public ArrayList<Project> selectOther(int proNo) {
		return pDao.selectOther(sqlSession, proNo);
	}













}
