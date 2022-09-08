package com.finalProject.eduWorks.personnel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.dao.PersonnelDao;

@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	@Autowired
	private PersonnelDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int teacherListCount() {
		return pDao.teacherListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> teacherList(PageInfo pi) {
		return pDao.teacherList(sqlSession,pi);
	}

	@Override
	public int searchTeacherListCount(HashMap m) {
		return pDao.teacherListCount(sqlSession,m);
	}

	@Override
	public ArrayList<Member> searchTeacherList(PageInfo pi, HashMap m) {
		return pDao.SearchTeacherList(sqlSession, pi, m);
	}

	@Override
	public int resignTeacher(ArrayList<String> list) {
		return pDao.resignTeacher(sqlSession, list);
	}
	
	@Override
	public int resignTeacher(String memNo) {
		return pDao.resignTeacher(sqlSession, memNo);
	}

	@Override
	public Member detailTeacherInfo(String memNo) {
		return pDao.detailTeacherInfo(sqlSession, memNo);
	}

	@Override
	public ArrayList<Department> selectDept() {
		return pDao.selectDept(sqlSession);
	}

	@Override
	public ArrayList<Job> selectJob() {
		return pDao.selectJob(sqlSession);
	}
	
}
