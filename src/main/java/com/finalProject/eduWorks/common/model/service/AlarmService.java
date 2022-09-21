package com.finalProject.eduWorks.common.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.common.model.vo.Alarm;
import com.finalProject.eduWorks.common.model.vo.AlarmData;

public interface AlarmService {
	
	// 알람 insert
	int insertAlarm(AlarmData alarmData);

	// 알람 리스트 조회
	ArrayList<Alarm> slectAlarmList(int no);

	// 알람 delete
	int deleteAlarm(String alNo);

	// 알람 읽음 처리
	int readAlarm(String alNo);

	// 원댓글 단 유저 번호 알아내기
	int selectRWriter(String replyParentNo);
	
}
