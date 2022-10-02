package com.finalProject.eduWorks.personnel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import com.finalProject.eduWorks.personnel.model.vo.AutoHo;
import com.finalProject.eduWorks.personnel.model.vo.Holiday;
import com.finalProject.eduWorks.personnel.model.vo.HolidayForm;
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
	
	public String checkedCountIn2(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.checkedCountIn2", s);
	}
	
	public String chechOutTime(SqlSessionTemplate sqlSession,HashMap<String,String> h) {
		return sqlSession.selectOne("personnelMapper.chechOutTime", h);
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
	
	public int adjModify(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.update("personnelMapper.adjModify", s);
	}

	public int adjDelete(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.delete("personnelMapper.adjDelete", s);
	}
	//------------------------------------
	public int hoApproveCount(SqlSessionTemplate sqlSession,HashMap<String, String> m1) {
		return sqlSession.selectOne("personnelMapper.hoApproveCount", m1);
	}
	public ArrayList<HolidayForm> hoApproveList(SqlSessionTemplate sqlSession,PageInfo pi1, HashMap<String, String> m1) {
		int limit = pi1.getBoardLimit();
		int offset = (pi1.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.hoApproveList", m1, rowBounds);
	}
	public int hoCount(SqlSessionTemplate sqlSession,HashMap<String, String> m2) {
		return sqlSession.selectOne("personnelMapper.hoCount", m2);
	}
	public ArrayList<Holiday> hoList(SqlSessionTemplate sqlSession,PageInfo pi2, HashMap<String, String> m2) {
		int limit = pi2.getBoardLimit();
		int offset = (pi2.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.hoList", m2, rowBounds);
	}
	public String totalHo(SqlSessionTemplate sqlSession,String memNo) {
		return sqlSession.selectOne("personnelMapper.totalHo", memNo);
	}
	public String useHo(SqlSessionTemplate sqlSession,String memNo) {
		return sqlSession.selectOne("personnelMapper.useHo", memNo);
	}
	
	public int holidayMgCount(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.holidayMgCount", s);
	}
	
	public ArrayList<HolidayForm> holidayMgList(SqlSessionTemplate sqlSession,PageInfo pi1, SearchAt s) {
		int limit = pi1.getBoardLimit();
		int offset = (pi1.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.holidayMgList", s, rowBounds);
	} 
	
	public int holidayAddCount(SqlSessionTemplate sqlSession,SearchAt s) {
		return sqlSession.selectOne("personnelMapper.holidayAddCount", s);
	}
	
	public ArrayList<Holiday> holidayAddList(SqlSessionTemplate sqlSession,PageInfo pi2, SearchAt s) {
		int limit = pi2.getBoardLimit();
		int offset = (pi2.getCurrentPage()-1)*limit;
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("personnelMapper.holidayAddList", s, rowBounds);
	}
	
	public int addHoCalendar(SqlSessionTemplate sqlSession,SearchAt s,List enrollDate) {
		int result = 1;
		for(int i=1;i<=enrollDate.size();i++) {
			s.setStartDate(enrollDate.get(i-1)+"");
			if(i==1 && s.isCheck1()) {
				int j = sqlSession.insert("personnelMapper.updatefixout",s);
				result=result*j;
			}else if(i==enrollDate.size() && s.isCheck2()){
				int j = sqlSession.insert("personnelMapper.updatefixin",s);
				result=result*j;
			}else {
				int j = sqlSession.insert("personnelMapper.insertho",s);
				result=result*j;
			}
		}
		if(result>0) {
			return sqlSession.update("personnelMapper.updateannl", s);
		}else {
			return result;
		}
	}
	
	public int addHalfHoCalendar(SqlSessionTemplate sqlSession,SearchAt s, boolean radio1, boolean radio2){
		int i=0;
		if(radio1==true) {
			i = sqlSession.insert("personnelMapper.updateh1", s);
		}else {
			i = sqlSession.insert("personnelMapper.updateh2", s);
		}
		if(i>0) {
			return sqlSession.update("personnelMapper.updateannl", s);
		}else {
			return i;
		}
	}
	
	public ArrayList<String> countWorktime(SqlSessionTemplate sqlSession,ArrayList<String> xlist,String userNo){
		ArrayList<String> ylist = new ArrayList<>();
		for(String str : xlist) {
			HashMap m = new HashMap();
			m.put("str", str); m.put("userNo", userNo);
			String worktime = sqlSession.selectOne("personnelMapper.countWorktime", m);
			if(worktime==null) {
				worktime="0";
			}
			ylist.add(worktime);
		}
		return ylist;
	}
	
	public ArrayList<String> countWeekWorktime(SqlSessionTemplate sqlSession,ArrayList<String> xlist,ArrayList<String> xlist2, String userNo){
		ArrayList<String> ylist = new ArrayList<>();
		for(int i=0;i<xlist.size();i++) {
			SearchAt s = new SearchAt();
			s.setStartDate(xlist.get(i));
			s.setEndDate(xlist2.get(i));
			s.setUserNo(userNo);
			String worktime = sqlSession.selectOne("personnelMapper.countWeekWorktime", s);
			if(worktime==null) {
				worktime="0";
			}
			ylist.add(worktime);
		}
		return ylist;
	}
	
	public ArrayList<String> atListCount3(SqlSessionTemplate sqlSession,SearchAt s,ArrayList<String> xlist,ArrayList<String> xlist2){
		ArrayList<String> ylist2 = new ArrayList<>();
		for(int i=0;i<xlist.size();i++) {
			
			s.setStartDate(xlist2.get(i));
			s.setEndDate(xlist.get(i));
			ArrayList restList = (ArrayList)sqlSession.selectList("personnelMapper.searchRestdate2", s);
					if(!restList.isEmpty()) {
						s.setList(restList);
					}

			s.setCheck1(true);
			s.setCheck2(false);
			s.setCheck3(false);
			double normal = sqlSession.selectOne("personnelMapper.AtListCount3", s);
			
			s.setCheck1(false);
			s.setCheck2(true);
			s.setCheck3(false);
			double leave = sqlSession.selectOne("personnelMapper.AtListCount3", s);
			
			s.setCheck1(false);
			s.setCheck2(false);
			s.setCheck3(true);
			double absent = sqlSession.selectOne("personnelMapper.AtListCount3", s);
			
			double result;
			if(normal==0) {
				result = 0;
			}else {
				result = ((normal+(leave/2))/(normal+leave+absent))*100;
				result = Math.round(result);
			}
			ylist2.add(result+"");
		}
		return ylist2;
	}
	
	public ArrayList<String> atListWeekCount(SqlSessionTemplate sqlSession,SearchAt s,ArrayList<String> xlist,ArrayList<String> xlist2){
		ArrayList<String> ylist2 = new ArrayList<>();	
		for(int i=0;i<xlist.size();i++) {
			
			s.setStartDate(xlist.get(i));
			s.setEndDate(xlist2.get(i));
			ArrayList restList = (ArrayList)sqlSession.selectList("personnelMapper.searchRestdate", s);
					if(!restList.isEmpty()) {
						s.setList(restList);
					}

			s.setCheck1(true);
			s.setCheck2(false);
			s.setCheck3(false);
			double normal = sqlSession.selectOne("personnelMapper.atListWeekCount", s);
			
			s.setCheck1(false);
			s.setCheck2(true);
			s.setCheck3(false);
			double leave = sqlSession.selectOne("personnelMapper.atListWeekCount", s);
			
			s.setCheck1(false);
			s.setCheck2(false);
			s.setCheck3(true);
			double absent = sqlSession.selectOne("personnelMapper.atListWeekCount", s);
			
			double result;
			if(normal==0) {
				result = 0;
			}else {
				result = ((normal+(leave/2))/(normal+leave+absent))*100;
				result = Math.round(result);
			}
			ylist2.add(result+"");
		}
		return ylist2;
	}
	
	public HashMap checkHo(SqlSessionTemplate sqlSession) {
		ArrayList<AutoHo> memNos = (ArrayList)sqlSession.selectList("personnelMapper.memNolists");
		ArrayList<String> list1 = new ArrayList<>();
		ArrayList<String> namelist1 = new ArrayList<>();
		ArrayList<String> list15 = new ArrayList<>();
		ArrayList<String> namelist15 = new ArrayList<>();
		for(AutoHo a : memNos) {
			if(Double.parseDouble(a.getYear())<1) {
				if(Double.parseDouble(a.getMonth())>Double.parseDouble(a.getMemCount())*20) {
					list1.add(a.getMemNo()); 
					namelist1.add(a.getMemName());
				}
			}else {
				if(Double.parseDouble(a.getYear())>Double.parseDouble(a.getMemCount())) {
					list15.add(a.getMemNo());
					namelist15.add(a.getMemName());
				}
			}
		}
		HashMap hs = new HashMap();
		hs.put("list1", list1);
		hs.put("namelist1", namelist1);
		hs.put("list15", list15);
		hs.put("namelist15", namelist15);
		return hs;
	}
	
	public int sendAutoHo1(SqlSessionTemplate session, String[] list1) {
		int result = 1;
		for(String no : list1) {
			int i = session.insert("personnelMapper.sendAutoHo1", no);
			result = result*i;
		}
		if(result>0) {
			for(String no : list1) {
				int i = session.insert("personnelMapper.updateAutoHo1", no);
				result = result*i;
			}
			return result;
		}else {
			return result;
		}
	}
	
	public int sendAutoHo15(SqlSessionTemplate session, String[] list15) {
		int result = 1;
		for(String no : list15) {
			int i = session.insert("personnelMapper.sendAutoHo15", no);
			result = result*i;
		}
		if(result>0) {
			for(String no : list15) {
				int i = session.insert("personnelMapper.updateAutoHo15", no);
				result = result*i;
			}
			return result;
		}else {
			return result;
		}
	}
	
	public int changePwd(SqlSessionTemplate session,Member mb) {
		return session.update("personnelMapper.changePwd", mb);
	}
}
