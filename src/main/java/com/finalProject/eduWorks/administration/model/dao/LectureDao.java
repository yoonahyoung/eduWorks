package com.finalProject.eduWorks.administration.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

@Repository
public class LectureDao {

	public int selectAdminListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectAdminListCount");
	}
	
	public ArrayList<Teacher> adminLectureList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds  = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("teacherMapper.adminLectureList", null, rowBounds);
	}
	
	public int selectAppListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("teacherMapper.selectAppListCount");
	}
	
	public ArrayList<Teacher> adminAppLectureList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds  = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("teacherMapper.adminAppLectureList", null, rowBounds);
	}
	
	public Teacher adminLectureDetailSelect(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("teacherMapper.adminLectureDetailSelect", classNo);
	}
	
	public ArrayList<Member> teacherList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.teacherList");
	}
	
	public int adminLectureUpdate(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.update("teacherMapper.adminLectureUpdate", t);
	}
	
	public int adminLectureDelete(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.delete("teacherMapper.adminLectureDelete", classNo);
	}
	
	public Teacher adminAppLectureDetailSelect(SqlSessionTemplate sqlSession, int classNo) {
		return sqlSession.selectOne("teacherMapper.adminAppLectureDetailSelect", classNo);
	}
	
	public int appLectureStatus(SqlSessionTemplate sqlSession, Teacher t) {
		return sqlSession.update("teacherMapper.appLectureStatus", t);
	}
	
	
	public int searchAdminListCount(SqlSessionTemplate sqlSession, String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		// selectOne은 변수를 한개밖에 못전하기 때문에 어딘가에 변수들을 담아서 한꺼번에 넘겨야함 , HashMap
		return sqlSession.selectOne("teacherMapper.searchAdminListCount", map);
	}
	
	public ArrayList<Teacher> adminSearchForm(SqlSessionTemplate sqlSession, PageInfo pi, String condition, String keyword){
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds  = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("teacherMapper.adminSearchForm", map, rowBounds);
	}
	
	public int searchAdminAppListCount(SqlSessionTemplate sqlSession, String condition, String keyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		// selectOne은 변수를 한개밖에 못전하기 때문에 어딘가에 변수들을 담아서 한꺼번에 넘겨야함 , HashMap
		return sqlSession.selectOne("teacherMapper.searchAdminAppListCount", map);
	}
	
	public ArrayList<Teacher> adminAppSearchForm(SqlSessionTemplate sqlSession, PageInfo pi, String condition, String keyword){
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds  = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("teacherMapper.adminAppSearchForm", map, rowBounds);
	
	}
		
		
		
		
		
	public ArrayList<Teacher> ajaxAdminList(SqlSessionTemplate sqlSession, String select){
		return (ArrayList)sqlSession.selectList("teacherMapper.ajaxAdminList", select);
	}
	
	
	
	
}
