package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

public interface RegClassService {
	
	// 1. 수강 신청 목록 조회 (페이징) pend
	int selectListCount(String regStatus); 
	ArrayList<RegClass> selectList(PageInfo pi, String regStatus);
	
	// 승인 처리
	int updateRegClass(int regNo);
	
	// 반려 처리
	int returnRegClass(RegClass r);
	
}
