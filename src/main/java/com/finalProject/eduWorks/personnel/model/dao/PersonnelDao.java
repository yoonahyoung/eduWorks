package com.finalProject.eduWorks.personnel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.vo.Adjust;
import com.finalProject.eduWorks.personnel.model.vo.Attendance;
import com.finalProject.eduWorks.personnel.model.vo.Ojt;
import com.finalProject.eduWorks.personnel.model.vo.Restdate;
import com.finalProject.eduWorks.personnel.model.vo.SearchAt;

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
	
	public int updateMyInfo(SqlSessionTemplate sqlSession,Member m) {
		return sqlSession.update("personnelMapper.updateMyInfo", m);
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
	
	public int sendOjtMail(SqlSession sqlSession,HashMap m,ArrayList<MailStatus> list) {
		int result = sqlSession.insert("personnelMapper.sendOjtMail", m);
		if(result>0) {
			return addOjtMailStatus(sqlSession,list);
		}else {
			return result;
		}
	}
	
	public int addOjtMailStatus(SqlSession sqlSession,ArrayList<MailStatus> list) {
		return sqlSession.insert("personnelMapper.addOjtMailStatus", list);
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
	
	public ArrayList<Restdate> searchRestdate(SqlSessionTemplate sqlSession, SearchAt s){
		return (ArrayList)sqlSession.selectList("personnelMapper.searchRestdate", s);
	}
	
	public int atListCount(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.AtListCount", s);
	}
	
	public int atListCount2(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.AtListCount2", s);
	}
	
	public ArrayList<Attendance> searchAtList(SqlSessionTemplate sqlSession,PageInfo pi,SearchAt s) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.searchAtList", s, rowBounds);
	}
	
	public int insertAtDate(SqlSessionTemplate sqlSession,Attendance at) {
		return sqlSession.insert("personnelMapper.insertAtDate", at);
	}

	public int updateAtData(SqlSessionTemplate sqlSession,Attendance at) {
		return sqlSession.update("personnelMapper.updateAtData", at);
	}

	public int deleteAtData(SqlSessionTemplate sqlSession,Attendance at) {
		return sqlSession.delete("personnelMapper.deleteAtData", at);
	}
	
	public int objectionManageCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("personnelMapper.objectionManageCount");
	}

	public ArrayList<Adjust> objectionManageList(SqlSessionTemplate sqlSession,PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.objectionManageList",null,rowBounds);
	}
	
	public int approveAdj(SqlSessionTemplate sqlSession,Adjust ad) {
		return sqlSession.update("personnelMapper.approveAdj", ad);
	}

	public int refuseAdj(SqlSessionTemplate sqlSession,Adjust ad) {
		return sqlSession.update("personnelMapper.refuseAdj", ad);
	}
	
	public int searchAdjCount(SqlSessionTemplate sqlSession,SearchAt at) {
		return sqlSession.selectOne("personnelMapper.searchAdjCount");
	}

	public ArrayList<Adjust> searchAdjList(SqlSessionTemplate sqlSession,PageInfo pi, SearchAt at) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.searchAdjList",at,rowBounds);
	}
	
	public ArrayList<Ojt> selectAllMem(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("personnelMapper.selectAllMem");
	}
	
	public ArrayList<Ojt> searchSelectMem(SqlSessionTemplate sqlSession,SearchAt at) {
		return (ArrayList)sqlSession.selectList("personnelMapper.searchSelectMem",at);
	}
	
	public int addHoliday(SqlSessionTemplate sqlSession,HashMap m) {
		return sqlSession.insert("personnelMapper.addHoliday", m);
	}

	public int deleteHoliday(SqlSessionTemplate sqlSession,HashMap m) {
		return sqlSession.insert("personnelMapper.deleteHoliday", m);
	}
	
	public ArrayList<Attendance> searchMyAt(SqlSessionTemplate sqlSession,SearchAt at) {
		return (ArrayList)sqlSession.selectList("personnelMapper.searchMyAt", at);
	}
	
	public Attendance searchDetailAt(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.searchDetailAt", s);
	}
	
	public int adhFormInsert(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.insert("personnelMapper.adhFormInsert", s);
	}
	
	public Adjust checkedAdj(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.checkedAdj", s);
	}
	
	public Attendance checkedIn(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.checkedIn", s);
	}

	public int updateAttIn(SqlSessionTemplate sqlSession,Attendance at) {
		return sqlSession.update("personnelMapper.updateAttIn", at);
	}

	public int insertAttIn(SqlSessionTemplate sqlSession,Attendance at) {
		return sqlSession.insert("personnelMapper.insertAttIn", at);
	}
	
	public int checkedCountIn(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.checkedCountIn", s);
	}
	
	public int updateOut(SqlSessionTemplate sqlSession,Attendance at) {
		return sqlSession.update("personnelMapper.updateOut", at);
	}
	
	public int adjustMeCount(SqlSessionTemplate sqlSession,String memNo) {
		return sqlSession.selectOne("personnelMapper.adjustMeCount", memNo);
	}
	
	public ArrayList<Adjust> adjustMe(SqlSessionTemplate sqlSession,String memNo){
		return (ArrayList)sqlSession.selectList("personnelMapper.adjustMe", memNo);
	}
}
