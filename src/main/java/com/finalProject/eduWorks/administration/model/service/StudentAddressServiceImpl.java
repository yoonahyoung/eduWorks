package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.administration.model.dao.StudentAddressDao;
import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Service
public class StudentAddressServiceImpl implements StudentAddressService{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private StudentAddressDao sDao;
	
	
	// 학생 주소록 페이징 처리 (전체)
	@Override
	public int selectListStCount() {
		return sDao.selectListStCount(sqlSession);
	}

	// 학생 주소록 조회 (전체)
	@Override
	public ArrayList<Student> selectStAddressList(PageInfo pi) {
		return sDao.selectStAddressList(sqlSession, pi);
	}

	// 학생 주소록 상세 조회 (전체)
	@Override
	public Student selectStudent(int no) {
		return sDao.selectStudent(sqlSession, no);
	}
	
	// 학생 수강 강의 정보
	@Override
	public ArrayList<RegClass> selectListRegClass(int no) {
		return sDao.selectListRegClass(sqlSession, no);
	}
	
	// 학생 정보 수정
	@Override
	public int updateStudent(Student s) {
		return sDao.updateStudent(sqlSession, s);
	}
	
	// 학생 주소록 페이징 처리 (강사)
	@Override
	public int selectListTeCount(int memNo) {
		return sDao.selectListTeCount(sqlSession, memNo);
	}

	// 학생 주소록 조회 (강사)
	@Override
	public ArrayList<Student> selectTeAddressList(PageInfo pi, int memNo, String range) {
		return sDao.selectTeAddressList(sqlSession, pi, memNo, range);
	}

	// 상담 이력 조회
	@Override
	public ArrayList<Cnsln> selectCnsln(int no) {
		return sDao.selectCnsln(sqlSession, no);
	}

	

	

}
