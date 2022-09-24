package com.finalProject.eduWorks.reservation.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.reservation.model.vo.Reservation;

@Repository
public class ReservationDao {
	// 시설예약 리스트 조회
	public ArrayList<Reservation> reservationView(SqlSessionTemplate sqlSession, String memNo) {
		return (ArrayList)sqlSession.selectList("reservationMapper.reservationView", memNo);
	}

	public int reservationInsert(SqlSessionTemplate sqlSession, Reservation res) {
		return sqlSession.insert("reservationMapper.reservationInsert", res);
	}
	
	// 시설예약 수정폼 
	public Reservation reservationUpdateForm(SqlSessionTemplate sqlSession, String resNo) {
		return sqlSession.selectOne("reservationMapper.reservationUpdateForm", resNo);
	}
	
	// 시설예약 수정
	public int reservationUpdate(SqlSessionTemplate sqlSession, Reservation res) {
		return sqlSession.update("reservationMapper.reservationUpdate", res);
	}

}


