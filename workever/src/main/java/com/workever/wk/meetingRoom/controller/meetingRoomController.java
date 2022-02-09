package com.workever.wk.meetingRoom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class meetingRoomController {
	
	@RequestMapping("reservation.mr")
	public String meetingRoomReservation() {
		
		return "meetingRoom/meetingRoomReservation";
	}
}
