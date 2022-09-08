package com.finalProject.eduWorks.personnel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface PersonnelService {
	
	int teacherListCount();
	ArrayList<Member> teacherList(PageInfo pi);
	
	int searchTeacherListCount(HashMap m);
	ArrayList<Member> searchTeacherList(PageInfo pi, HashMap m);
	
	int resignTeacher(ArrayList<String> list);
	int resignTeacher(String memNo);
	
	Member detailTeacherInfo(String memNo);
	ArrayList<Department> selectDept();
	ArrayList<Job> selectJob();

}
