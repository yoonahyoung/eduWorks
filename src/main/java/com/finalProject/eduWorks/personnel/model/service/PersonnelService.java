package com.finalProject.eduWorks.personnel.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface PersonnelService {
	
	int teacherListCount();
	
	ArrayList<Member> teacherList(PageInfo pi);

}
