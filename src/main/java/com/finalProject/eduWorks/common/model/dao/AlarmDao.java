package com.finalProject.eduWorks.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.Alarm;
import com.finalProject.eduWorks.common.model.vo.AlarmData;

@Repository
public class AlarmDao {

	// 알람 insert
	public int insertAlarm(SqlSessionTemplate sqlSession, AlarmData alarmData) {

		switch(alarmData.getCmd()){
		case "reply" : alarmData.setCmd("1"); break;
		}
		return sqlSession.insert("alarmMapper.insertAlarm", alarmData);
	}

	// 알람 리스트 조회
	public ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlSession, int no) {
		return (ArrayList)sqlSession.selectList("alarmMapper.selectAlarm", no);
	}

}
