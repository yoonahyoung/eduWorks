
package com.finalProject.eduWorks.schedule.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.vo.Mycal;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	public ArrayList<Schedule> selectScheList(SqlSessionTemplate sqlSession, String memNo){
		
		//String[] cArr = checkCnt.split(",");
		//HashMap map = new HashMap();
		//map.put("memNo", memNo);
		//map.put("cArr", cArr);
		return (ArrayList) sqlSession.selectList("scheduleMapper.selectScheList", memNo);
	}
	
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession){
		return (ArrayList) sqlSession.selectList("scheduleMapper.selectMemberList");
	}
	
	public ArrayList<Mycal> selectMycalList(SqlSessionTemplate sqlSession, String memNo){
		return (ArrayList) sqlSession.selectList("scheduleMapper.selectMycalList", memNo);
	}
	
	public int insertMycal(SqlSessionTemplate sqlSession, Mycal m) {
		return sqlSession.insert("scheduleMapper.insertMycal", m);
	}
	
	public int deleteMycal(SqlSessionTemplate sqlSession, String checkCnt) {
		String[] cArr = checkCnt.split(",");
		return sqlSession.update("scheduleMapper.deleteMycal", cArr);
	}
	
	public int colorMycal(SqlSessionTemplate sqlSession, Mycal m) {
		return sqlSession.update("scheduleMapper.colorMycal", m);
	}
	
	public Member selectMember(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.selectOne("scheduleMapper.selectMember", memNo);
	}
	
	public int insertSche(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.insert("scheduleMapper.insertSche", s);
	}
	
	public Schedule selectSche(SqlSessionTemplate sqlSession, int scheNo) {
		return sqlSession.selectOne("scheduleMapper.selectSche", scheNo);
	}
	
	public int updateSche(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.update("scheduleMapper.updateSche", s);
	}
	
	public int deleteSche(SqlSessionTemplate sqlSession, int scheNo) {
		return sqlSession.update("scheduleMapper.deleteSche", scheNo);
	}

}
