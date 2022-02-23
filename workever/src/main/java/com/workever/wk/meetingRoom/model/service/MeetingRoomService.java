package com.workever.wk.meetingRoom.model.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.workever.wk.meetingRoom.model.vo.MeetingRoom;
import com.workever.wk.meetingRoom.model.vo.MeetingRoomReservation;
import com.workever.wk.user.model.vo.User;


public interface MeetingRoomService {
	
	// 회의실 지난 내역 사용 완료로 업데이트
	int reservationListUpdate(User loginUser);
	
	// 회의실 리스트 조회
	ArrayList<MeetingRoom> selectMrList(User loginUser);
	
	// 로그인 유저 회의실 예약 내역 조회
	ArrayList<MeetingRoomReservation> selectMrReservationList(User loginUser);
	
	// 회의실 예약 상세 내역 조회(ajax)
	MeetingRoomReservation selectEvent(int reserveNo);
	
	// 예약 불가능한 시간 조회(ajax)
	ArrayList<MeetingRoomReservation> selectTime(Map<String,Object> map);
	
	// 회의실 예약 insert
	int insertMrReservation(Map<String,Object> map);
	
	// 회의실 예약 취소
	int cancelMrReservation(int mrReservationNo);
}
