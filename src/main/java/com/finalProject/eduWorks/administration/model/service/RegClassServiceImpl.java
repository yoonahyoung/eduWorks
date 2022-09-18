package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.administration.model.dao.RegClassDao;
import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Service
public class RegClassServiceImpl implements RegClassService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private RegClassDao rDao;

	// 수강 신청 목록 페이징 처리
	@Override
	public int selectListCount(String regStatus) {
		return rDao.selectListCount(sqlSession, regStatus);
	}

	// 수강 신청 목록 리스트 조회
	@Override
	public ArrayList<RegClass> selectList(PageInfo pi, String regStatus) {
		return rDao.selectListCount(sqlSession, pi, regStatus);
	}

	// 승인처리
	@Override
	public int updateRegClass(int regNo) {
		return rDao.updateRegClass(sqlSession, regNo);
	}

	// 반려 처리
	@Override
	public int returnRegClass(RegClass r) {
		return rDao.returnRegClass(sqlSession, r);
	}

}
