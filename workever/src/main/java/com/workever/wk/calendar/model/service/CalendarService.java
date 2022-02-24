package com.workever.wk.calendar.model.service;

import java.util.ArrayList;

import com.workever.wk.calendar.model.vo.Calendar;
import com.workever.wk.user.model.vo.User;

public interface CalendarService {

	// 전사일정조회 (ajax)
	ArrayList<Calendar> selectCompanyCalendar(User user);
	
	// 일정 등록
	int insertCalendar(Calendar calendar);
	
	// 전사 일정 수정
	int updateCalendar(Calendar calendar);
	
	// 전사 일정 삭제
	int deleteCalendar(String calNo);
	
	// 부서별 일정 조회(ajax)
	ArrayList<Calendar> selectDeptCalendar(User user);
	
	// 개인 일정 조회(ajax)
	ArrayList<Calendar> selectUserCalendar(User user);
	
	// 부서 휴가 조회
	ArrayList<Calendar> selectDeptDayoff(User user);
}
