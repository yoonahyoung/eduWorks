package com.finalProject.eduWorks.personnel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.dao.PersonnelDao;
import com.finalProject.eduWorks.personnel.model.vo.Adjust;
import com.finalProject.eduWorks.personnel.model.vo.Attendance;
import com.finalProject.eduWorks.personnel.model.vo.Ojt;
import com.finalProject.eduWorks.personnel.model.vo.Restdate;
import com.finalProject.eduWorks.personnel.model.vo.SearchAt;

@Service
public class PersonnelServiceImpl implements PersonnelService {
	
	@Autowired
	private PersonnelDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int teacherListCount() {
		return pDao.teacherListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> teacherList(PageInfo pi) {
		return pDao.teacherList(sqlSession,pi);
	}

	@Override
	public int searchTeacherListCount(HashMap m) {
		return pDao.teacherListCount(sqlSession,m);
	}

	@Override
	public ArrayList<Member> searchTeacherList(PageInfo pi, HashMap m) {
		return pDao.SearchTeacherList(sqlSession, pi, m);
	}

	@Override
	public int resignTeacher(ArrayList<String> list) {
		return pDao.resignTeacher(sqlSession, list);
	}
	
	@Override
	public int resignTeacher(String memNo) {
		return pDao.resignTeacher(sqlSession, memNo);
	}

	@Override
	public Member detailTeacherInfo(String memNo) {
		return pDao.detailTeacherInfo(sqlSession, memNo);
	}

	@Override
	public ArrayList<Department> selectDept() {
		return pDao.selectDept(sqlSession);
	}

	@Override
	public ArrayList<Job> selectJob() {
		return pDao.selectJob(sqlSession);
	}

	@Override
	public int returnTeacher(String memNo) {
		return pDao.returnTeacher(sqlSession, memNo);
	}

	@Override
	public int uploadProfileImg(Member m) {
		return pDao.uploadProfileImg(sqlSession, m);
	}

	@Override
	public int defaultProfile(String memNo) {
		return pDao.defaultProfile(sqlSession, memNo);
	}

	@Override
	public int updateMember(Member m) {
		return pDao.updateMember(sqlSession, m);
	}
	
	@Override
	public int updateMyInfo(Member m) {
		return pDao.updateMyInfo(sqlSession, m);
	}

	@Override
	public int addMember(Member m) {
		return pDao.addMember(sqlSession, m);
	}
	
	@Override
	public int employeeListCount() {
		return pDao.employeeListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> employeeList(PageInfo pi) {
		return pDao.employeeList(sqlSession, pi);
	}

	@Override
	public int searchEmployeeListCount(HashMap m) {
		return pDao.employeeListCount(sqlSession, m);
	}

	@Override
	public ArrayList<Member> searchEmployeeList(PageInfo pi, HashMap m) {
		return pDao.SearchEmployeeList(sqlSession, pi, m);
	}

	@Override
	public int ojtListCount() {
		return pDao.ojtListCount(sqlSession);
	}

	@Override
	public ArrayList<Ojt> ojtList(PageInfo pi) {
		return pDao.ojtList(sqlSession, pi);
	}
	
	@Override
	public int searchOjtListCount(HashMap m) {
		return pDao.OjtListCount(sqlSession, m);
	}
	
	@Override
	public ArrayList<Ojt> searchOjtList(PageInfo pi, HashMap m) {
		 return pDao.OjtList(sqlSession, pi, m);
	}

	@Override
	public int updateOjtDate(String[] memNos, HashMap m) {
		return pDao.updateOjtDate(sqlSession, memNos, m);
	}

	@Override
	public int sendOjtMail(HashMap m,ArrayList<MailStatus> list) {
		return pDao.sendOjtMail(sqlSession, m,list);
	}

	@Override
	public int completeOjt(ArrayList<String> list) {
		return pDao.completeOjt(sqlSession, list);
	}

	@Override
	public int cancelOjt(ArrayList<String> list) {
		return pDao.cancelOjt(sqlSession, list);
	}

	@Override
	public int sendCancelOjtMail(ArrayList<String> list, HashMap m) {
		return 0;
	}
	
	@Override
	public ArrayList<Restdate> searchRestdate(SearchAt s) {
		return pDao.searchRestdate(sqlSession, s);
	}

	@Override
	public int atListCount(SearchAt s) {
		return pDao.atListCount(sqlSession, s);
	}
	
	@Override
	public int atListCount2(SearchAt s) {
		return pDao.atListCount2(sqlSession, s);
	}

	@Override
	public ArrayList<Attendance> searchAtList(PageInfo pi,SearchAt s) {
		return pDao.searchAtList(sqlSession, pi, s);
	}

	@Override
	public int insertAtDate(Attendance at) {
		return pDao.insertAtDate(sqlSession, at);
	}

	@Override
	public int updateAtData(Attendance at) {
		return pDao.updateAtData(sqlSession, at);
	}

	@Override
	public int deleteAtData(Attendance at) {
		return pDao.deleteAtData(sqlSession, at);
	}

	@Override
	public int objectionManageCount() {
		return pDao.objectionManageCount(sqlSession);
	}

	@Override
	public ArrayList<Adjust> objectionManageList(PageInfo pi) {
		return pDao.objectionManageList(sqlSession, pi);
	}

	@Override
	public int approveAdj(Adjust ad) {
		return pDao.approveAdj(sqlSession, ad);
	}

	@Override
	public int refuseAdj(Adjust ad) {
		return pDao.refuseAdj(sqlSession, ad);
	}

	@Override
	public int searchAdjCount(SearchAt at) {
		return pDao.searchAdjCount(sqlSession, at);
	}

	@Override
	public ArrayList<Adjust> searchAdjList(PageInfo pi, SearchAt at) {
		return pDao.searchAdjList(sqlSession, pi, at);
	}

	@Override
	public ArrayList<Ojt> selectAllMem() {
		return pDao.selectAllMem(sqlSession);
	}

	@Override
	public ArrayList<Ojt> searchSelectMem(SearchAt at) {
		return pDao.searchSelectMem(sqlSession, at);
	}

	@Override
	public int addHoliday(HashMap m) {
		return pDao.addHoliday(sqlSession, m);
	}

	@Override
	public int deleteHoliday(HashMap m) {
		return pDao.deleteHoliday(sqlSession, m);
	}

	@Override
	public ArrayList<Attendance> searchMyAt(SearchAt at) {
		return pDao.searchMyAt(sqlSession, at);
	}

	@Override
	public Attendance searchDetailAt(SearchAt s) {
		return pDao.searchDetailAt(sqlSession, s);
	}

	@Override
	public int adhFormInsert(SearchAt s) {
		return pDao.adhFormInsert(sqlSession, s);
	}

	@Override
	public Adjust checkedAdj(SearchAt s) {
		return pDao.checkedAdj(sqlSession, s);
	}

	@Override
	public Attendance checkedIn(SearchAt at) {
		return pDao.checkedIn(sqlSession, at);
	}

	@Override
	public int updateAttIn(Attendance at) {
		return pDao.updateAttIn(sqlSession, at);
	}

	@Override
	public int insertAttIn(Attendance at) {
		return pDao.insertAttIn(sqlSession, at);
	}

	@Override
	public int checkedCountIn(SearchAt s) {
		return pDao.checkedCountIn(sqlSession, s);
	}

	@Override
	public int updateOut(Attendance at) {
		return pDao.updateOut(sqlSession, at);
	}
	
	@Override
	public int adjustMeCount(String memNo) {
		return pDao.adjustMeCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<Adjust> adjustMe(PageInfo pi,String memNo) {
		return pDao.adjustMe(sqlSession, memNo);
	}

	@Override
	public int adjModify(SearchAt s) {
		return pDao.adjModify(sqlSession, s);
	}

	@Override
	public int adjDelete(SearchAt s) {
		return pDao.adjDelete(sqlSession, s);
	}

	


}
