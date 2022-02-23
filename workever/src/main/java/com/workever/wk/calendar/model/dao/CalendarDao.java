package com.workever.wk.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.calendar.model.vo.Calendar;
import com.workever.wk.user.model.vo.User;

@Repository
public class CalendarDao {

	// 전사일정조회(ajax)
	public ArrayList<Calendar> selectCompanyCalendar(SqlSessionTemplate sqlSession, User user){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectCompanyCalendar", user);
	}
	
	// 전사 일정 등록
	public int insertCalendarCompany(SqlSessionTemplate sqlSession, Calendar calendar) {
		return sqlSession.insert("calendarMapper.insertCalendarCompany", calendar);
	}
}
