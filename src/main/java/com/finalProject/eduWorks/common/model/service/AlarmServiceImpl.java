package com.finalProject.eduWorks.common.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.dao.AlarmDao;
import com.finalProject.eduWorks.common.model.vo.Alarm;
import com.finalProject.eduWorks.common.model.vo.AlarmData;

@Service
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AlarmDao aDao;
	
	// 알람 insert
	@Override
	public int insertAlarm(AlarmData alarmData) {
		return aDao.insertAlarm(sqlSession, alarmData);
	}

	// 알람 리스트 조회
	@Override
	public ArrayList<Alarm> slectAlarmList(int no) {
		return aDao.selectAlarmList(sqlSession, no);
	}

}
