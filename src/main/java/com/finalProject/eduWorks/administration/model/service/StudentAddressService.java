package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

public interface StudentAddressService {
	// 1. 운영팀 학생 주소록 조회 (페이징)
	int selectListStCount(); 
	ArrayList<Student> selectStAddressList(PageInfo pi);
	
	// 1-1) 운영팀 학생 주소록 상세 조회
	Student selectStudent(int no); // 학생 기본 정보
	ArrayList<RegClass> selectListRegClass(int no); // 수강 강의 정보

	// 1-2) 운영팀 학생 정보 수정
	int updateStudent(Student s);
	
	// 2. 강사 학생 주소록 조회 (페이징)
	int selectListTeCount(int memNo); 
	ArrayList<Student> selectTeAddressList(PageInfo pi, int memNo, String range);
	
	// 3. 상담 이력 조회
	ArrayList<Cnsln> selectCnsln(int no);
}
