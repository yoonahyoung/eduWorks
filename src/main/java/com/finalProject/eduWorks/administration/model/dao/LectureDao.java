package com.finalProject.eduWorks.administration.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
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
}
