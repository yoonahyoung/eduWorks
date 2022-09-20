package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.administration.model.dao.LectureDao;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;
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

	@Override
	public Teacher adminLectureDetailSelect(int classNo) {
		return lDao.adminLectureDetailSelect(sqlSession, classNo);
	}

	@Override
	public ArrayList<Member> teacherList() {
		return lDao.teacherList(sqlSession);
	}
	
	@Override
	public int adminLectureUpdate(Teacher t) {
		return lDao.adminLectureUpdate(sqlSession, t);
	}

	@Override
	public int adminLectureDelete(int classNo) {
		return lDao.adminLectureDelete(sqlSession, classNo);
	}

	@Override
	public Teacher adminAppLectureDetailSelect(int classNo) {
		return lDao.adminAppLectureDetailSelect(sqlSession, classNo);
	}

	@Override
	public int appLectureStatus(Teacher t) {
		return lDao.appLectureStatus(sqlSession, t);
	}

	@Override
	public int searchAdminListCount(String condition, String keyword) {
		return lDao.searchAdminListCount(sqlSession, condition, keyword);
	}

	@Override
	public ArrayList<Teacher> adminSearchForm(PageInfo pi, String condition, String keyword) {
		return lDao.adminSearchForm(sqlSession, pi, condition, keyword);
	}


	@Override
	public int searchAdminAppListCount(String condition, String keyword) {
		return lDao.searchAdminAppListCount(sqlSession, condition, keyword);
	}

	@Override
	public ArrayList<Teacher> adminAppSearchForm(PageInfo pi, String condition, String keyword) {
		return lDao.adminAppSearchForm(sqlSession, pi, condition, keyword);
	}

	@Override
	public ArrayList<Teacher> ajaxAdminList(String select) {
		return lDao.ajaxAdminList(sqlSession, select);
	}

	

}
