package com.finalProject.eduWorks.teacher.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.teacher.model.dao.TeacherDao;
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

}
