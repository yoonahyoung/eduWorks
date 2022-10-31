package com.finalProject.eduWorks.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.Alarm;
import com.finalProject.eduWorks.common.model.vo.AlarmData;

@Repository
public class AlarmDao {

	// 알람 insert
	public int insertAlarm(SqlSessionTemplate sqlSession, AlarmData alarmData) {

		return sqlSession.insert("alarmMapper.insertAlarm", alarmData);
	}

	// 알람 리스트 조회
	public ArrayList<Alarm> selectAlarmList(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("alarmMapper.selectAlarm", mno);
	}

	// 알람 삭제
	public int deleteAlarm(SqlSessionTemplate sqlSession, String alNo) {
		return sqlSession.delete("alarmMapper.deleteAlarm", alNo);
	}

	// 알람 읽음 처리
	public int readAlarm(SqlSessionTemplate sqlSession, String alNo) {
		return sqlSession.update("alarmMapper.readAlarm", alNo);
	}

	// 원댓글 단 유저 번호 알아내기
	public String selectRWriter(SqlSessionTemplate sqlSession, String replyParentNo) {
		return sqlSession.selectOne("alarmMapper.selectRWriter", replyParentNo);
	}

}
