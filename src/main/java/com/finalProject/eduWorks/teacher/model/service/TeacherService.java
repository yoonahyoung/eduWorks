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
	
	int appEnrollFormInsert(Teacher t);

	Book bookDetailViewSelect(int bookNo);
	
	int bookEnrollFormInsert(Book b);
	
	int bookUpdate(Book b);
	
	int deleteBook(int bookNo);
	
	int searchBookListCount(String condition, String keyword);
	ArrayList<Book> bookSearchForm(PageInfo pi, String condition, String keyword);

	int searchAppListCount(String condition, String keyword);
	ArrayList<Teacher> appLectureSearchList(PageInfo pi, String condition, String keyword);
}

