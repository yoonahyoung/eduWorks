package com.finalProject.eduWorks.administration.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Repository
public class RegClassDao {

	// 수강 신청 목록 페이징 처리
	public int selectListCount(SqlSessionTemplate sqlSession, String regStatus) {
		return sqlSession.selectOne("administrationMapper.selectListCount", regStatus);
	}

	// 수강 신청 목록 조회
	public ArrayList<RegClass> selectListCount(SqlSessionTemplate sqlSession, PageInfo pi, String regStatus) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("administrationMapper.selectRegClassList", regStatus, rowBounds);
	}

	// 승인 처리
	public int updateRegClass(SqlSessionTemplate sqlSession, int regNo) {
		return sqlSession.update("administrationMapper.updateRegClass", regNo);
	}

	// 반려 처리
	public int returnRegClass(SqlSessionTemplate sqlSession, RegClass r) {
		return sqlSession.update("administrationMapper.returnRegClass", r);
	}

}
