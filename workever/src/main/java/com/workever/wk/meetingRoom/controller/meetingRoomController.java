package com.workever.wk.meetingRoom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.workever.wk.meetingRoom.model.service.MeetingRoomService;
import com.workever.wk.meetingRoom.model.vo.MeetingRoom;
import com.workever.wk.meetingRoom.model.vo.MeetingRoomReservation;
import com.workever.wk.user.model.vo.User;

@Controller
public class meetingRoomController {
	
	@Autowired
	private MeetingRoomService mService;
	
	// 회의실 예약 페이지
	@RequestMapping("reservation.mr")
	public String meetingRoomReservation(Model model, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		mService.reservationListUpdate(loginUser);
		ArrayList<MeetingRoom> mrList = mService.selectMrList(loginUser);
		model.addAttribute("mrList", mrList);
		return "meetingRoom/meetingRoomReservation";
	}
	
	// 회의실 예약 데이터 조회(ajax)
	@ResponseBody
	@RequestMapping(value="reservationList.mr", produces="application/json; charset=utf-8")
	public String ajaxReservationList(HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		ArrayList<MeetingRoomReservation> reserveList = mService.selectMrReservationList(loginUser);
		return new Gson().toJson(reserveList);
	}
	
	// 회의실 예약 상세 내역 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectEvent.mr", produces="application/json; charset=utf-8")
	public String ajaxSelectEvent(int reserveNo) {
		
		MeetingRoomReservation result = mService.selectEvent(reserveNo);
		return new Gson().toJson(result);
	}
	
	// 예약 불가능한 시간 조회(ajax)
	@ResponseBody
	@RequestMapping(value="selectTime.mr", produces="application/json; charset=utf-8")
	public String ajaxSelectTime(String reserveDate, int mrCode, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("reserveDate", reserveDate);
		map.put("mrCode", mrCode);
		map.put("loginUser", loginUser);
		
		ArrayList<MeetingRoomReservation> result = mService.selectTime(map);
		return new Gson().toJson(result);
	}
	
	@RequestMapping("insert.mr")
	public String insertMrReservation(Model model, MeetingRoomReservation mr, HttpSession session) {
		User loginUser = (User)session.getAttribute("loginUser");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("loginUser", loginUser);
		map.put("mr", mr);
		
		int result = mService.insertMrReservation(map);
		if(result > 0) {
			session.setAttribute("alertMsg", "예약이 완료되었습니다.");
			return "redirect:reservation.mr";
		}else {
			model.addAttribute("errorMsg", "예약 실패");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("cancel.mr")
	public String cancelMrReservation(Model model, HttpSession session, int mrReservationNo) {
		
		int result = mService.cancelMrReservation(mrReservationNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "예약이 취소되었습니다.");
			return "redirect:reservation.mr";
		}else {
			model.addAttribute("errorMsg", "예약 취소 실패");
			return "common/errorPage";
		}
	}
}
