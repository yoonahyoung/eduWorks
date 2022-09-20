package com.finalProject.eduWorks.common.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.common.model.vo.Alarm;
import com.finalProject.eduWorks.common.model.vo.AlarmData;

public interface AlarmService {
	
	// 알람 insert
	int insertAlarm(AlarmData alarmData);

	// 알람 리스트 조회
	ArrayList<Alarm> slectAlarmList(int no);
	
}
