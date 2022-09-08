package com.finalProject.eduWorks.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.schedule.model.dao.ScheduleDao;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Schedule> selectScheList() {
		return null;
	}

	@Override
	public Schedule selectSche() {
		return null;
	}

}
