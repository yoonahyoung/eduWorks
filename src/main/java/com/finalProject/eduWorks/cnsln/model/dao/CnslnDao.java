package com.finalProject.eduWorks.cnsln.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.member.model.vo.Member;

@Repository
public class CnslnDao {
	
	// 상담 일정 리스트 조회
	public ArrayList<Cnsln> selectCnslnList(SqlSessionTemplate sqlSession, String memNo){
		return (ArrayList)sqlSession.selectList("cnslnMapper.selectCnslnList", memNo);
	}
	
	// 상담 일정 등록
	public int insertCnsln(SqlSessionTemplate sqlSession, Cnsln c) {
		return sqlSession.insert("cnslnMapper.insertCnsln", c);
	}
	
	// 담당자 명단 조회
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, String keyword){
		return(ArrayList) sqlSession.selectList("cnslnMapper.selectMemberList", keyword);
	}
	
	// 상담 일정 조회
	public Cnsln selectCnsln(SqlSessionTemplate sqlSession, int cNo) {
		return sqlSession.selectOne("cnslnMapper.selectCnsln", cNo);
	}
	
	// 담당자 조회
	public Member selectMember(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.selectOne("cnslnMapper.selectMember", memNo);
	}
	
	// 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int cNo) {
		return sqlSession.update("cnslnMapper.increaseCount", cNo);
	}

}
