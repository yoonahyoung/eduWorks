package com.finalProject.eduWorks.teacher.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.teacher.model.vo.Book;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

@Repository
public class TeacherDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectListCount");
	}
	
	public ArrayList<Teacher> appAllListSelect(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds  = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("teacherMapper.appAllListSelect", null, rowBounds);
	}
	
	public int selectBookListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("bookMapper.selectBookListCount");
	}
	
	public ArrayList<Book> bookListSelect(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("bookMapper.bookListSelect", null, rowBounds);
	}
	
	public int bookEnrollFormInsert(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.insert("teacherMapper.bookEnrollFormInsert", t);
	}
	
	public Book bookDetailViewSelect(SqlSessionTemplate sqlSession, int bookNo) {
		return sqlSession.selectOne("bookMapper.bookDetailViewSelect", bookNo);
	}
	
	public int bookEnrollFormInsert(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.insert("bookMapper.bookEnrollFormInsert", b);
	}
	
	public int bookUpdate(SqlSessionTemplate sqlSession, Book b) {
		return sqlSession.update("bookMapper.bookUpdate", b);
	}
	
	public int deleteBook(SqlSessionTemplate sqlSession, int bookNo) {
		return sqlSession.delete("bookMapper.deleteBook", bookNo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
