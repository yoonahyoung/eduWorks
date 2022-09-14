package com.finalProject.eduWorks.teacher.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.teacher.model.vo.Book;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

public interface TeacherService {
	
	int selectListCount();
	ArrayList<Teacher> appAllListSelect(PageInfo pi);
	
	int selectBookListCount();
	ArrayList<Book> bookListSelect(PageInfo pi);
	

}
