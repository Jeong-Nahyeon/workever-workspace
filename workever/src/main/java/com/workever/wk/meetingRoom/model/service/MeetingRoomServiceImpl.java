package com.workever.wk.meetingRoom.model.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.workever.wk.meetingRoom.model.dao.MeetingRoomDao;
import com.workever.wk.meetingRoom.model.vo.MeetingRoom;
import com.workever.wk.meetingRoom.model.vo.MeetingRoomReservation;
import com.workever.wk.user.model.vo.User;

@Service
public class MeetingRoomServiceImpl implements MeetingRoomService{

	@Autowired
	private MeetingRoomDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 회의실 지난 내역 사용완료로 업데이트
	@Override
	public int reservationListUpdate(User loginUser) {
		return mDao.reservationListUpdate(sqlSession, loginUser);
	}
	
	// 회의실 리스트 조회
	@Override
	public ArrayList<MeetingRoom> selectMrList(User loginUser) {
		return mDao.selectMrList(sqlSession, loginUser);
	}

	// 로그인 유저 회의실 예약 내역 조회
	@Override
	public ArrayList<MeetingRoomReservation> selectMrReservationList(User loginUser) {
		return mDao.selectMrReservationList(sqlSession, loginUser);
	}

	// 회의실 예약 상세 내역 조회(ajax)
	@Override
	public MeetingRoomReservation selectEvent(int reserveNo) {
		return mDao.selectEvent(sqlSession, reserveNo);
	}

	// 예약 불가능한 시간 조회(ajax)
	@Override
	public ArrayList<MeetingRoomReservation> selectTime(Map<String, Object> map) {
		return mDao.selectTime(sqlSession, map);
	}

	// 회의실 예약 insert
	@Override
	public int insertMrReservation(Map<String, Object> map) {
		return mDao.insertMrReservation(sqlSession, map);
	}

	// 회의실 예약 취소
	@Override
	public int cancelMrReservation(int mrReservationNo) {
		return mDao.cancelMrReservation(sqlSession, mrReservationNo);
	}

}
