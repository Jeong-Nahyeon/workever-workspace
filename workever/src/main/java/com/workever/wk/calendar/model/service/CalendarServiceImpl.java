package com.workever.wk.calendar.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.calendar.model.dao.CalendarDao;
import com.workever.wk.calendar.model.vo.Calendar;
import com.workever.wk.user.model.vo.User;

@Service
public class CalendarServiceImpl implements CalendarService{
	
	@Autowired
	private CalendarDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 전사일정조회 (ajax)
	@Override
	public ArrayList<Calendar> selectCompanyCalendar(User user) {
		return cDao.selectCompanyCalendar(sqlSession, user);
	}

	// 일정 등록
	@Override
	public int insertCalendar(Calendar calendar) {
		return cDao.insertCalendar(sqlSession, calendar);
	}

	// 일정 수정
	@Override
	public int updateCalendar(Calendar calendar) {
		return cDao.updateCalendar(sqlSession, calendar);
	}

	// 일정 삭제
	@Override
	public int deleteCalendar(String calNo) {
		return cDao.deleteCalendar(sqlSession, calNo);
	}

	// 부서별 일정 조회(ajax)
	@Override
	public ArrayList<Calendar> selectDeptCalendar(User user) {
		return cDao.selectDeptCalendar(sqlSession, user);
	}

	// 개인 일정 조회(ajax)
	@Override
	public ArrayList<Calendar> selectUserCalendar(User user) {
		return cDao.selectUserCalendar(sqlSession, user);
	}

	// 부서 휴가 조회
	@Override
	public ArrayList<Calendar> selectDeptDayoff(User user) {
		return cDao.selectDeptDayoff(sqlSession, user);
	}

}
