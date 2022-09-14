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
import com.finalProject.eduWorks.personnel.model.vo.Ojt;

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
	
	public int returnTeacher(SqlSessionTemplate sqlSession,String memNo) {
		return sqlSession.update("personnelMapper.returnTeacher", memNo);
	}
	
	public int uploadProfileImg(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("personnelMapper.uploadProfileImg", m);
	}
	
	public int defaultProfile(SqlSessionTemplate sqlSession,String memNo) {
		return sqlSession.update("personnelMapper.defaultProfile", memNo);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("personnelMapper.updateMember", m);
	}
	
	public int addMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("personnelMapper.addMember", m);
	}
	
	public int employeeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("personnelMapper.employeeListCount");
	}
	
	public ArrayList<Member> employeeList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.employeeList",null,rowBounds);
	}
	
	public int employeeListCount(SqlSessionTemplate sqlSession,HashMap m) {
		return sqlSession.selectOne("personnelMapper.searchEmployeeListCount",m);
	}
	
	public ArrayList<Member> SearchEmployeeList(SqlSessionTemplate sqlSession,PageInfo pi,HashMap m){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.SearchEmployeeList",m,rowBounds);
	}
	
	public int ojtListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("personnelMapper.ojtListCount");
	}
	
	public ArrayList<Ojt> ojtList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.ojtList",null,rowBounds);
	}
	
	public int OjtListCount(SqlSessionTemplate sqlSession,HashMap m) {
		return sqlSession.selectOne("personnelMapper.searchOjtListCount",m);
	}
	
	public ArrayList<Ojt> OjtList(SqlSessionTemplate sqlSession,PageInfo pi,HashMap m){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.SearchOjtList",m,rowBounds);
	}
	
	public int updateOjtDate(SqlSessionTemplate sqlSession,String[] memNos, HashMap m) {
		int result = 1;
		for(String memNo : memNos) {
			m.put("memNo", memNo);
			int i = sqlSession.update("personnelMapper.updateOjtDate", m);
			m.remove(memNo);
			result = result*i;
		}
		return result;
	}
	
	public int completeOjt(SqlSessionTemplate sqlSession,ArrayList<String> list) {
		int result = 1;
		for(String memNo : list) {
			int i = sqlSession.update("personnelMapper.completeOjt", memNo);
			result = result*i;
		}
		return result;
	}
	
	public int cancelOjt(SqlSessionTemplate sqlSession,ArrayList<String> list) {
		int result = 1;
		for(String memNo : list) {
			int i = sqlSession.update("personnelMapper.cancelOjt", memNo);
			result = result*i;
		}
		return result;
	}
}
