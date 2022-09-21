package com.finalProject.eduWorks.reservation.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.reservation.model.dao.ReservationDao;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
