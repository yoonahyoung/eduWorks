package com.finalProject.eduWorks.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.member.model.dao.MemberDao;
import com.finalProject.eduWorks.member.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}
}
