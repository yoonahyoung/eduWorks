package com.finalProject.eduWorks.personnel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.vo.Attendance;
import com.finalProject.eduWorks.personnel.model.vo.Ojt;
import com.finalProject.eduWorks.personnel.model.vo.SearchAt;

public interface PersonnelService {
	
	//강사목록조회
	int teacherListCount();
	ArrayList<Member> teacherList(PageInfo pi);
	
	//검색용 강사목록조회
	int searchTeacherListCount(HashMap m);
	ArrayList<Member> searchTeacherList(PageInfo pi, HashMap m);
	
	//강사퇴사처리(일괄)
	int resignTeacher(ArrayList<String> list);
	//강사퇴사처리
	int resignTeacher(String memNo);
	
	//강사상세정보조회
	Member detailTeacherInfo(String memNo);
	ArrayList<Department> selectDept();
	ArrayList<Job> selectJob();
	
	//강사복직처리
	int returnTeacher(String memNo);
	
	//이미지수정
	int uploadProfileImg(Member m);
	int defaultProfile(String memNo);
	
	//멤버정보 업데이트
	int updateMember(Member m);
	
	//멤버추가하기
	int addMember(Member m);
	
	//직원목록조회
	int employeeListCount();
	ArrayList<Member> employeeList(PageInfo pi);
	
	//검색용 직원목록조회
	int searchEmployeeListCount(HashMap m);
	ArrayList<Member> searchEmployeeList(PageInfo pi, HashMap m);
	
	//ojt 리스트조회
	int ojtListCount();
	ArrayList<Ojt> ojtList(PageInfo pi);
	
	//ojt 검색조회
	int searchOjtListCount(HashMap m);
	ArrayList<Ojt> searchOjtList(PageInfo pi, HashMap m);
	
	//ojt 일정등록및 메일보내기
	int updateOjtDate(String[] memNos,HashMap m);
	int sendOjtMail(String[] memNos,HashMap m);
	
	//ojt 수료완료처리
	int completeOjt(ArrayList<String> list);
	
	//ojt 취소및취소메일보내기
	int cancelOjt(ArrayList<String> list);
	int sendCancelOjtMail(ArrayList<String> list,HashMap m);
	
	//근태조회 상세검색
	int AtListCount(SearchAt s);
	ArrayList<Attendance> searchAtList(PageInfo pi,SearchAt s);
}
