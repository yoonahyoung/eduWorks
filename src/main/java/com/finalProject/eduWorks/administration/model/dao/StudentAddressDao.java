package com.finalProject.eduWorks.administration.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Repository
public class StudentAddressDao {

	// 학생 주소록 페이징 (전체)
	public int selectListStCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("administrationMapper.selectListStCount");
	}

	// 학생 주소록 리스트 조회 (전체)
	public ArrayList<Student> selectStAddressList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("administrationMapper.selectStAddressList", null, rowBounds);
	}
	
	// 학생 주소록 상세 조회 (전체)
	public Student selectStudent(SqlSessionTemplate sqlSession, int studentNo) {
		return sqlSession.selectOne("administrationMapper.selectStudent", studentNo);
	}

	// 학생 수강 강의 정보
	public ArrayList<RegClass> selectListRegClass(SqlSessionTemplate sqlSession, int studentNo) {
		return (ArrayList)sqlSession.selectList("administrationMapper.selectListRegClass", studentNo);
	}
	
	// 학생 정보 수정
	public int updateStudent(SqlSessionTemplate sqlSession, Student s) {
		return sqlSession.update("administrationMapper.updateStudent", s);
	}

	// 학생 주소록 페이징 처리 (강사)
	public int selectListTeCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("administrationMapper.selectListTeCount", memNo);
	}

	// 학생 주소록 리스트 조회 (강사)
	public ArrayList<Student> selectTeAddressList(SqlSessionTemplate sqlSession, PageInfo pi, int memNo, String range) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("memNo", String.valueOf(memNo));
		map.put("range", range);
		
		return (ArrayList)sqlSession.selectList("administrationMapper.selectTeAddressList", map, rowBounds);
	}
	
	
	
	
	
	
	
}
