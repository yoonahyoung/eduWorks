package com.finalProject.eduWorks.cnsln.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface CnslnService {
	
	// 상담 일정 조회
	ArrayList<Cnsln> selectCnslnList(String memNo);
	
	// 상담 일정 등록
	ArrayList<Member> selectMemberList(String keyword);
	int insertCnsln(Cnsln c);
	Member selectMember(String memNo);
	
	// 상담 일정 조회
	int increaseCount(int cNo);
	Cnsln selectCnsln(int cNo);

}
