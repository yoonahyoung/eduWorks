package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

public interface LectureService {
	
	int selectAdminListCount();
	ArrayList<Teacher> adminLectureList(PageInfo pi);
	
	int selectAppListCount();
	ArrayList<Teacher> adminAppLectureList(PageInfo pi);

}
