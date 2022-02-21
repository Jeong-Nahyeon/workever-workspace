package com.workever.wk.meetingRoom.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MeetingRoomReservation {
	private int mrReservationNo;
	private int userNo;
	private int mrCode;
	private String mrReservationDate;
	private String mrStartTime;
	private String mrEndTime;
	private String mrUse;
	private String mrReservationStatus;
}
