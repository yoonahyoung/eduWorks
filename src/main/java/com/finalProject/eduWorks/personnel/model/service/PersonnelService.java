package com.finalProject.eduWorks.personnel.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.vo.Adjust;
import com.finalProject.eduWorks.personnel.model.vo.Attendance;
import com.finalProject.eduWorks.personnel.model.vo.Holiday;
import com.finalProject.eduWorks.personnel.model.vo.HolidayForm;
import com.finalProject.eduWorks.personnel.model.vo.Ojt;
import com.finalProject.eduWorks.personnel.model.vo.Restdate;
import com.finalProject.eduWorks.personnel.model.vo.SearchAt;

public interface PersonnelService {
	
	//강사목록조회
	int teacherListCount();
	ArrayList<Member> teacherList(PageInfo pi);
	
	//검색용 강사목록조회
	int searchTeacherListCount(HashMap m);
	ArrayList<Member> searchTeacherList(PageInfo pi, HashMap m);
	
	//강사퇴사처리(일괄)
	int resignTeacher(ArrayList<String> list);
	//강사퇴사처리
	int resignTeacher(String memNo);
	
	//강사상세정보조회
	Member detailTeacherInfo(String memNo);
	ArrayList<Department> selectDept();
	ArrayList<Job> selectJob();
	
	//강사복직처리
	int returnTeacher(String memNo);
	
	//이미지수정
	int uploadProfileImg(Member m);
	int defaultProfile(String memNo);
	
	//멤버정보 업데이트
	int updateMember(Member m);
	int updateMyInfo(Member m);
	
	//멤버추가하기
	int addMember(Member m);
	
	//직원목록조회
	int employeeListCount();
	ArrayList<Member> employeeList(PageInfo pi);
	
	//검색용 직원목록조회
	int searchEmployeeListCount(HashMap m);
	ArrayList<Member> searchEmployeeList(PageInfo pi, HashMap m);
	
	//ojt 리스트조회
	int ojtListCount();
	ArrayList<Ojt> ojtList(PageInfo pi);
	
	//ojt 검색조회
	int searchOjtListCount(HashMap m);
	ArrayList<Ojt> searchOjtList(PageInfo pi, HashMap m);
	
	//ojt 일정등록및 메일보내기
	int updateOjtDate(String[] memNos,HashMap m);
	int sendOjtMail(HashMap m,ArrayList<MailStatus> list);
	
	//ojt 수료완료처리
	int completeOjt(ArrayList<String> list);
	
	//ojt 취소및취소메일보내기
	int cancelOjt(ArrayList<String> list);
	int sendCancelOjtMail(ArrayList<String> list,HashMap m);
	
	//근태조회 상세검색
	ArrayList<Restdate> searchRestdate(SearchAt s);
	int atListCount(SearchAt s);
	ArrayList<Attendance> searchAtList(PageInfo pi,SearchAt s);
	
	//근태수정하기
	int insertAtDate(Attendance at);
	int updateAtData(Attendance at);
	int deleteAtData(Attendance at);
	
	//조정신청내역페이지
	int objectionManageCount();
	ArrayList<Adjust> objectionManageList(PageInfo pi);
	
	//조정신청내역 체크박스처리
	int searchAdjCount(SearchAt at);
	ArrayList<Adjust> searchAdjList(PageInfo pi,SearchAt at);
	
	//조정신청처리하기
	int approveAdj(Adjust ad);
	int refuseAdj(Adjust ad);
	
	//연차개별지급관련 회원조회
	ArrayList<Ojt> selectAllMem();
	ArrayList<Ojt> searchSelectMem(SearchAt at);
	
	//연차지급및회수
	int addHoliday(HashMap m);
	int deleteHoliday(HashMap m);
	
	//내 근무내역관리
	ArrayList<Attendance> searchMyAt(SearchAt at);
	int atListCount2(SearchAt s);
	Attendance searchDetailAt(SearchAt s);
	Adjust checkedAdj(SearchAt s);
	int adhFormInsert(SearchAt s);
	
	//출퇴근찍기
	int checkedCountIn(SearchAt s);
	Attendance checkedIn(SearchAt at);
	int updateAttIn(Attendance at);
	int insertAttIn(Attendance at);
	int updateOut(Attendance at);
	
	//개인 조정신청내역
	int adjustMeCount(String memNo);
	ArrayList<Adjust> adjustMe(PageInfo pi, String memNo);
	int adjModify(SearchAt s);
	int adjDelete(SearchAt s);
	
	//개인연차조회페이지
	int hoApproveCount(HashMap<String,String> m1);
	ArrayList<HolidayForm> hoApproveList(PageInfo pi1,HashMap<String,String> m1);
	int hoCount(HashMap<String,String> m1);
	ArrayList<Holiday> hoList(PageInfo pi2,HashMap<String,String> m1);
	String totalHo(String memNo);
	String useHo(String memNo);
	
	//연차관리매니지
	int holidayMgCount(SearchAt s);
	ArrayList<HolidayForm> holidayMgList(PageInfo pi1,SearchAt s);
	int holidayAddCount(SearchAt s);
	ArrayList<Holiday> holidayAddList(PageInfo pi1,SearchAt s);
	int addHoCalendar(SearchAt s,List enrollDate);
}
