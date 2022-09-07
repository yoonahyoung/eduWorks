package com.finalProject.eduWorks.personnel.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

@Repository
public class PersonnelDao {
	
	public int teacherListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("personnelMapper.teacherListCount");
	}
	
	public ArrayList<Member> teacherList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.teacherList",null,rowBounds);
	}
}
