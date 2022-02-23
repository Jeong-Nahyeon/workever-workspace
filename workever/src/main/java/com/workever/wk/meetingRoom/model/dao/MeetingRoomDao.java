package com.workever.wk.meetingRoom.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.workever.wk.meetingRoom.model.vo.MeetingRoom;
import com.workever.wk.meetingRoom.model.vo.MeetingRoomReservation;
import com.workever.wk.user.model.vo.User;

@Repository
public class MeetingRoomDao {
	
	// 회의실 지난내역 사용완료로 업데이트
	public int reservationListUpdate(SqlSessionTemplate sqlSession, User loginUser) {
		return sqlSession.update("meetingRoomMapper.reservationListUpdate", loginUser);
	}
	
	// 회의실 리스트 조회
	public ArrayList<MeetingRoom> selectMrList(SqlSessionTemplate sqlSession, User loginUser) {
		return (ArrayList)sqlSession.selectList("meetingRoomMapper.selectMrList", loginUser);
	}
	
	// 로그인 유저 회의실 예약 내역 조회
	public ArrayList<MeetingRoomReservation> selectMrReservationList(SqlSessionTemplate sqlSession, User loginUser) {
		return (ArrayList)sqlSession.selectList("meetingRoomMapper.selectMrReservationList", loginUser);
	}
	
	// 회의실 예약 상세 내역 조회(ajax)
	public MeetingRoomReservation selectEvent(SqlSessionTemplate sqlSession, int reserveNo) {
		return sqlSession.selectOne("meetingRoomMapper.selectEvent", reserveNo);
	}
	
	// 예약 불가능한 시간 조회(ajax)
	public ArrayList<MeetingRoomReservation> selectTime(SqlSessionTemplate sqlSession, Map<String,Object> map){
		return (ArrayList)sqlSession.selectList("meetingRoomMapper.selectTime", map);
	}
	
	// 회의실 예약 insert
	public int insertMrReservation(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.insert("meetingRoomMapper.insertMrReservation", map);
	}
	
	// 회의실 예약 취소
	public int cancelMrReservation(SqlSessionTemplate sqlSession, int mrReservationNo) {
		return sqlSession.update("meetingRoomMapper.cancelMrReservation", mrReservationNo);
	}
}
