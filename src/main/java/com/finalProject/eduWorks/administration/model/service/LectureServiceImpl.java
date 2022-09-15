package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.administration.model.dao.LectureDao;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Autowired
	private LectureDao lDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectAdminListCount() {
		return lDao.selectAdminListCount(sqlSession);
	}

	@Override
	public ArrayList<Teacher> adminLectureList(PageInfo pi) {
		return lDao.adminLectureList(sqlSession, pi);
	}

	@Override
	public int selectAppListCount() {
		return lDao.selectAppListCount(sqlSession);
	}

	@Override
	public ArrayList<Teacher> adminAppLectureList(PageInfo pi) {
		return lDao.adminAppLectureList(sqlSession, pi);
	}

	

}
