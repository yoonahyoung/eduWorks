package com.finalProject.eduWorks.personnel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
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
	
	public int teacherListCount(SqlSessionTemplate sqlSession,HashMap m) {
		return sqlSession.selectOne("personnelMapper.searchTeacherListCount",m);
	}
	
	public ArrayList<Member> SearchTeacherList(SqlSessionTemplate sqlSession,PageInfo pi,HashMap m){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.SearchTeacherList",m,rowBounds);
	}
	
	public int resignTeacher(SqlSessionTemplate sqlSession,ArrayList<String> list) {
		int result = 1;
		for(String memNo : list) {
			int i = sqlSession.update("personnelMapper.resignTeacher", memNo);
			result = result*i;
		}
		return result;
	}
	
	public int resignTeacher(SqlSessionTemplate sqlSession,String memNo) {
		return sqlSession.update("personnelMapper.resignTeacher", memNo);
	}
	
	public Member detailTeacherInfo(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.selectOne("personnelMapper.detailTeacherInfo", memNo);
	}
	
	public ArrayList<Department> selectDept(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("personnelMapper.selectDept");
	}
	
	public ArrayList<Job> selectJob(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("personnelMapper.selectJob");
	}
}
