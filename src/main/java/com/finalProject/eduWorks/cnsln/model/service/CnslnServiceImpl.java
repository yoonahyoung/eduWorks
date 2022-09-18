package com.finalProject.eduWorks.cnsln.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.cnsln.model.dao.CnslnDao;
import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.member.model.vo.Member;

@Service
public class CnslnServiceImpl implements CnslnService{
	
	@Autowired
	private CnslnDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<Cnsln> selectCnslnList(String memNo) {
		return cDao.selectCnslnList(sqlSession, memNo);
	}

	@Override
	public int insertCnsln(Cnsln c) {
		return cDao.insertCnsln(sqlSession, c);
	}

	@Override
	public ArrayList<Member> selectMemberList(String keyword) {
		return cDao.selectMemberList(sqlSession, keyword);
	}

	@Override
	public Member selectMember(String memNo) {
		return cDao.selectMember(sqlSession, memNo);
	}

	@Override
	public Cnsln selectCnsln(int cNo) {
		return cDao.selectCnsln(sqlSession, cNo);
	}

	@Override
	public int increaseCount(int cNo) {
		return cDao.increaseCount(sqlSession, cNo);
	}
	
	

}
