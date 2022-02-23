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

	// 전사 일정 등록
	@Override
	public int insertCalendarCompany(Calendar calendar) {
		return cDao.insertCalendarCompany(sqlSession, calendar);
	}
}
