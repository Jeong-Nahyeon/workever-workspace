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
	public int insertCalendar(SqlSessionTemplate sqlSession, Calendar calendar) {
		return sqlSession.insert("calendarMapper.insertCalendarCompany", calendar);
	}
	
	// 전사 일정 수정
	public int updateCalendar(SqlSessionTemplate sqlSession, Calendar calendar) {
		return sqlSession.update("calendarMapper.updateCalendarCompany", calendar);
	}
	
	// 전사 일정 삭제
	public int deleteCalendar(SqlSessionTemplate sqlSession, String calNo) {
		return sqlSession.delete("calendarMapper.deleteCalendarCompany", calNo);
	}
	
	// 	부서별 일정 조회(ajax)
	public ArrayList<Calendar> selectDeptCalendar(SqlSessionTemplate sqlSession, User user){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectDeptCalendar", user);
	}
	
	// 부서 휴가 조회
	public ArrayList<Calendar> selectDeptDayoff(SqlSessionTemplate sqlSession, User user){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectDeptDayoff", user);
	}
	
	// 개인 일정 조회(ajax)
	public ArrayList<Calendar> selectUserCalendar(SqlSessionTemplate sqlSession, User user){
		return (ArrayList)sqlSession.selectList("calendarMapper.selectUserCalendar", user);
	}
}
