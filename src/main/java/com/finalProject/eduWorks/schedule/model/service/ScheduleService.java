package com.finalProject.eduWorks.schedule.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 캘린더 조회(메인)
	ArrayList<Schedule> selectScheList();
	
	// 개인 일정 조회
	Schedule selectSche();
	
	// 일정 추가
	
	// 일정 수정
	
	// 일정 삭제
	
	// 마이 캘린더 추가

}
