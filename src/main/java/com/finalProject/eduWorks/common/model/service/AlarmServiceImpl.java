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

	// 알람 삭제
	@Override
	public int deleteAlarm(String alNo) {
		return aDao.deleteAlarm(sqlSession, alNo);
	}

	// 알람 읽음 처리
	@Override
	public int readAlarm(String alNo) {
		return aDao.readAlarm(sqlSession, alNo);
	}

	// 원댓글 단 유저 번호 알아내기
	@Override
	public int selectRWriter(String replyParentNo) {
		return aDao.selectRWriter(sqlSession, replyParentNo);
	}

}
