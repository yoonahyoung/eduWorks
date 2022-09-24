package com.finalProject.eduWorks.reservation.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.reservation.model.dao.ReservationDao;
import com.finalProject.eduWorks.reservation.model.vo.Reservation;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 시설예약 조회
	@Override
	public ArrayList<Reservation> reservationView(String memNo) {
		return rDao.reservationView(sqlSession, memNo);
	}

	@Override
	public int reservationInsert(Reservation res) {
		return rDao.reservationInsert(sqlSession, res);
	}

	@Override
	public Reservation reservationUpdateForm(String resNo) {
		return rDao.reservationUpdateForm(sqlSession, resNo);
	}
	
	@Override
	public int reservationUpdate(Reservation res) {
		return rDao.reservationUpdate(sqlSession, res);
	}


	
}
