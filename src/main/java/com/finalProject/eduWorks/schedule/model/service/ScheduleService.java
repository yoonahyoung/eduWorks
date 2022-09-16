package com.finalProject.eduWorks.schedule.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.vo.Mycal;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	// 캘린더 조회(메인)
	ArrayList<Schedule> selectScheList(String memNo);	// 일정 (멤버 넘버 넣기)
	int insertMycal(Mycal m);	// 내 캘린더 추가
	int deleteMycal(String checkCnt);	// 내 캘린더 삭제
	int colorMycal(Mycal m);	// 캘린더 색상 변경
	ArrayList<Member> selectMemberList();	// 주소록
	
	// 일정 조회
	Schedule selectSche(int scheNo);
	
	// 일정 등록
	ArrayList<Mycal> selectMycalList(String memNo);	// 내 캘린더 리스트 조회
	Member selectMember(String memNo);	// 참석자 조회
	int insertSche(Schedule s);	// 일정 등록
	
	// 일정 수정
	int updateSche(Schedule s);
	
	// 일정 삭제
	int deleteSche(int scheNo);
	

}
