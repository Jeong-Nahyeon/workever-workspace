package com.workever.wk.calendar.model.service;

import java.util.ArrayList;

import com.workever.wk.calendar.model.vo.Calendar;
import com.workever.wk.user.model.vo.User;

public interface CalendarService {

	// 전사일정조회 (ajax)
	ArrayList<Calendar> selectCompanyCalendar(User user);
	
	// 전사 일정 등록
	int insertCalendarCompany(Calendar calendar);
}
