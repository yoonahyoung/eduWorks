package com.finalProject.eduWorks.personnel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.dao.PersonnelDao;
import com.finalProject.eduWorks.personnel.model.vo.Attendance;
import com.finalProject.eduWorks.personnel.model.vo.Ojt;
import com.finalProject.eduWorks.personnel.model.vo.SearchAt;

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

	@Override
	public int returnTeacher(String memNo) {
		return pDao.returnTeacher(sqlSession, memNo);
	}

	@Override
	public int uploadProfileImg(Member m) {
		return pDao.uploadProfileImg(sqlSession, m);
	}

	@Override
	public int defaultProfile(String memNo) {
		return pDao.defaultProfile(sqlSession, memNo);
	}

	@Override
	public int updateMember(Member m) {
		return pDao.updateMember(sqlSession, m);
	}

	@Override
	public int addMember(Member m) {
		return pDao.addMember(sqlSession, m);
	}
	
	@Override
	public int employeeListCount() {
		return pDao.employeeListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> employeeList(PageInfo pi) {
		return pDao.employeeList(sqlSession, pi);
	}

	@Override
	public int searchEmployeeListCount(HashMap m) {
		return pDao.employeeListCount(sqlSession, m);
	}

	@Override
	public ArrayList<Member> searchEmployeeList(PageInfo pi, HashMap m) {
		return pDao.SearchEmployeeList(sqlSession, pi, m);
	}

	@Override
	public int ojtListCount() {
		return pDao.ojtListCount(sqlSession);
	}

	@Override
	public ArrayList<Ojt> ojtList(PageInfo pi) {
		return pDao.ojtList(sqlSession, pi);
	}
	
	@Override
	public int searchOjtListCount(HashMap m) {
		return pDao.OjtListCount(sqlSession, m);
	}
	
	@Override
	public ArrayList<Ojt> searchOjtList(PageInfo pi, HashMap m) {
		 return pDao.OjtList(sqlSession, pi, m);
	}

	@Override
	public int updateOjtDate(String[] memNos, HashMap m) {
		return pDao.updateOjtDate(sqlSession, memNos, m);
	}

	@Override
	public int sendOjtMail(HashMap m,ArrayList<MailStatus> list) {
		return pDao.sendOjtMail(sqlSession, m,list);
	}

	@Override
	public int completeOjt(ArrayList<String> list) {
		return pDao.completeOjt(sqlSession, list);
	}

	@Override
	public int cancelOjt(ArrayList<String> list) {
		return pDao.cancelOjt(sqlSession, list);
	}

	@Override
	public int sendCancelOjtMail(ArrayList<String> list, HashMap m) {
		return 0;
	}

	@Override
	public int AtListCount(SearchAt s) {
		return 0;
	}

	@Override
	public ArrayList<Attendance> searchAtList(PageInfo pi,SearchAt s) {
		return null;
	}
}
