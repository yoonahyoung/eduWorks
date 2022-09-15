package com.finalProject.eduWorks.teacher.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.teacher.model.dao.TeacherDao;
import com.finalProject.eduWorks.teacher.model.vo.Book;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

@Service
public class TeacherServiceImpl implements TeacherService{
	
	@Autowired
	private TeacherDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int selectListCount() {
		return tDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Teacher> appAllListSelect(PageInfo pi) {
		return tDao.appAllListSelect(sqlSession, pi);
	}

	@Override
	public int selectBookListCount() {
		return tDao.selectBookListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Book> bookListSelect(PageInfo pi) {
		return tDao.bookListSelect(sqlSession, pi);
	}

	@Override
	public int bookEnrollFormInsert(Teacher t) {
		return tDao.bookEnrollFormInsert(sqlSession, t);
	}

	@Override
	public Book bookDetailViewSelect(int bookNo) {
		return tDao.bookDetailViewSelect(sqlSession, bookNo);
	}

	@Override
	public int bookEnrollFormInsert(Book b) {
		return tDao.bookEnrollFormInsert(sqlSession, b);
	}

	@Override
	public int bookUpdate(Book b) {
		return tDao.bookUpdate(sqlSession, b);
	}

	@Override
	public int deleteBook(int bookNo) {
		return tDao.deleteBook(sqlSession, bookNo);
	}


}
