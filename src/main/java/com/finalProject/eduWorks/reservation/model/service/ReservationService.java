package com.finalProject.eduWorks.reservation.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.reservation.model.vo.Reservation;

public interface ReservationService {
	
	// 시설예약 페이지 
	ArrayList<Reservation> reservationView(String memNo);
	
	// 예약 일정 등록
	int reservationInsert(Reservation res);
	
	
	// 예약수정페이지 이동
	Reservation reservationUpdateForm(String resNo);
	// 예약 일정 수정
	int reservationUpdate(Reservation res);
	
}
