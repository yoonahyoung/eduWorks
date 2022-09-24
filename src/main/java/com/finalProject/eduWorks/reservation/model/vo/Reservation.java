package com.finalProject.eduWorks.reservation.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Reservation {
	
	private int resNo; // 예약번호
	private String memNo; // 사원번호
	private String resDate; // 예약날짜
	private String resStartTime; // 시작시간
	private String resEndTime; // 종료시간
	private String resTitle; // 예약제목
	private String resContent; // 예약 내용
	private String resFacilities; // 예약 시설
	private Date resInsertDate; // 예약을 신청할 날짜
	private String resColor;  // 예약시 색 지정

}
