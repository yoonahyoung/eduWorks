
package com.finalProject.eduWorks.schedule.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.vo.Mycal;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

@Repository
public class ScheduleDao {
	
	// 일정 리스트 조회
	public ArrayList<Schedule> selectScheList(SqlSessionTemplate sqlSession, String memNo){
		return (ArrayList) sqlSession.selectList("scheduleMapper.selectScheList", memNo);
	}
	
	// 멤버 명단 조회
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, String keyword){
		return (ArrayList) sqlSession.selectList("scheduleMapper.selectMemberList", keyword);
	}
	
	//  내 캘린더 리스트 조회
	public ArrayList<Mycal> selectMycalList(SqlSessionTemplate sqlSession, String memNo){
		return (ArrayList) sqlSession.selectList("scheduleMapper.selectMycalList", memNo);
	}
	
	// 내 캘린더 추가
	public int insertMycal(SqlSessionTemplate sqlSession, Mycal m) {
		return sqlSession.insert("scheduleMapper.insertMycal", m);
	}
	
	// 내 캘린더 수정
	public int updateMycal(SqlSessionTemplate sqlSession, int mcNo, String mcName) {
		HashMap<Object, Object> map = new HashMap<>();
		map.put("mcNo", mcNo);
		map.put("mcName", mcName);
		
		return sqlSession.update("scheduleMapper.updateMycal", map);
	}
	
	// 내 캘린더 삭제
	public int deleteMycal(SqlSessionTemplate sqlSession, String checkCnt) {
		String[] cArr = checkCnt.split(",");
		return sqlSession.update("scheduleMapper.deleteMycal", cArr);
	}
	
	// 내 캘린더 색상 변경
	public int colorMycal(SqlSessionTemplate sqlSession, Mycal m) {
		return sqlSession.update("scheduleMapper.colorMycal", m);
	}
	
	// 선택한 멤버 조회
	public Member selectMember(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.selectOne("scheduleMapper.selectMember", memNo);
	}
	
	// 일정 등록
	public int insertSche(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.insert("scheduleMapper.insertSche", s);
	}
	
	// 일정 조회
	public Schedule selectSche(SqlSessionTemplate sqlSession, int scheNo) {
		return sqlSession.selectOne("scheduleMapper.selectSche", scheNo);
	}
	
	// 일정 수정
	public int updateSche(SqlSessionTemplate sqlSession, Schedule s) {
		return sqlSession.update("scheduleMapper.updateSche", s);
	}
	
	// 일정 삭제
	public int deleteSche(SqlSessionTemplate sqlSession, int scheNo) {
		return sqlSession.update("scheduleMapper.deleteSche", scheNo);
	}
	
	// 댓글 리스트 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int scheNo){
		return (ArrayList) sqlSession.selectList("scheduleMapper.selectReplyList", scheNo);
	}
	
	// 댓글 입력
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("scheduleMapper.insertReply", r);
	}
	
	// 댓글 수정
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("scheduleMapper.updateReply", r);
	}
	
	// 댓글 조회
	public Reply selectReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.selectOne("scheduleMapper.selectReply", replyNo);
	}
	
	// 댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("scheduleMapper.deleteReply", replyNo);
	}
	
}
