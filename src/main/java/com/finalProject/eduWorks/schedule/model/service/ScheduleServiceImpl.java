package com.finalProject.eduWorks.schedule.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.dao.ScheduleDao;
import com.finalProject.eduWorks.schedule.model.vo.Mycal;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private ScheduleDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Schedule> selectScheList(String memNo) {
		return sDao.selectScheList(sqlSession, memNo);
	}

	@Override
	public ArrayList<Member> selectMemberList() {
		return sDao.selectMemberList(sqlSession);
	}

	@Override
	public ArrayList<Mycal> selectMycalList(String memNo) {
		return sDao.selectMycalList(sqlSession, memNo);
	}

	@Override
	public int insertMycal(Mycal m) {
		return sDao.insertMycal(sqlSession, m);
	}
	
	@Override
	public int deleteMycal(String checkCnt) {
		return sDao.deleteMycal(sqlSession, checkCnt);
	}

	@Override
	public int colorMycal(Mycal m) {
		return sDao.colorMycal(sqlSession, m);
	}
	
	@Override
	public Member selectMember(String memNo) {
		return sDao.selectMember(sqlSession, memNo);
	}


	@Override
	public int insertSche(Schedule s) {
		return sDao.insertSche(sqlSession, s);
	}
	


}
