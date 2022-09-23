package com.finalProject.eduWorks.teacher.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

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
	
	public int appEnrollFormInsert(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.insert("teacherMapper.appEnrollFormInsert", t);
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
	
	public int searchBookListCount(SqlSessionTemplate sqlSession, String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		// selectOne은 변수를 한개밖에 못전하기 때문에 어딘가에 변수들을 담아서 한꺼번에 넘겨야함 , HashMap
		return sqlSession.selectOne("bookMapper.searchBookListCount", map);
	}
	
	public ArrayList<Book> bookSearchForm(SqlSessionTemplate sqlSession, PageInfo pi, String condition, String keyword){
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds  = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("bookMapper.bookSearchForm", map, rowBounds);
	
	}
	
	public int searchAppListCount(SqlSessionTemplate sqlSession, String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		// selectOne은 변수를 한개밖에 못전하기 때문에 어딘가에 변수들을 담아서 한꺼번에 넘겨야함 , HashMap
		return sqlSession.selectOne("teacherMapper.searchAppListCount", map);
	}
	
	public ArrayList<Teacher> appLectureSearchList(SqlSessionTemplate sqlSession, PageInfo pi, String condition, String keyword){
		System.out.println(keyword);
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds  = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("teacherMapper.appLectureSearchList", map, rowBounds);
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
