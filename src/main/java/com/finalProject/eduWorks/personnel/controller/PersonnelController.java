package com.finalProject.eduWorks.personnel.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.IsoFields;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.FileUpload;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.service.MemberService;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.service.PersonnelService;
import com.finalProject.eduWorks.personnel.model.vo.Adjust;
import com.finalProject.eduWorks.personnel.model.vo.Attendance;
import com.finalProject.eduWorks.personnel.model.vo.Holiday;
import com.finalProject.eduWorks.personnel.model.vo.HolidayForm;
import com.finalProject.eduWorks.personnel.model.vo.Ojt;
import com.finalProject.eduWorks.personnel.model.vo.PersonnelCount;
import com.finalProject.eduWorks.personnel.model.vo.Restdate;
import com.finalProject.eduWorks.personnel.model.vo.SearchAt;
import com.google.gson.Gson;

@Controller
public class PersonnelController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private PersonnelService pService;
	
	// 강사관리
	
	@RequestMapping("list.te")
	public String selectTeacherList(@RequestParam(value="p",defaultValue = "1")int currentPage, Model model) {
		
		int listCount = pService.teacherListCount();
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = pService.teacherList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "personnel/selectTeacher";
	}
	
	@RequestMapping("search.te")
	public String selectTeacherList(boolean check1,boolean check2, String keyword,@RequestParam(value="p",defaultValue = "1")int currentPage, Model model) {
		HashMap m = new HashMap();
		m.put("check1", check1);
		m.put("check2", check2);
		m.put("keyword", keyword);
		
		int listCount = pService.searchTeacherListCount(m);
		PageInfo pi = Pagination.getInfo(listCount, currentPage , 5, 10);
		ArrayList<Member> list = pService.searchTeacherList(pi, m);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchck", 1);
		model.addAttribute("keyword", keyword);
		model.addAttribute("check1", check1);
		model.addAttribute("check2", check2);
		return "personnel/selectTeacher";
	}
	
	@ResponseBody
	@RequestMapping(value="out.te")
	public String resignTeacher(@RequestParam(value="userNo[]")ArrayList<String> list) {
		int result = pService.resignTeacher(list);
		System.out.println(result);
		return result > 0 ? "success" : "fail";
	}
	
	@RequestMapping("detail.te")
	public String detailTeacherInfo(String no,Model model) {
		Member m = pService.detailTeacherInfo(no);
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		
		model.addAttribute("m", m);
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		return "personnel/detailTeacher";
	}
	
	@ResponseBody
	@RequestMapping("resign.te")
	public String resignTeacher(@RequestParam(value="memNo")String memNo) {
		int result = pService.resignTeacher(memNo);
		return result > 0 ? "success" : "fail";
	}
	
	@ResponseBody
	@RequestMapping("return.te")
	public String returnTeacher(@RequestParam(value="memNo")String memNo) {
		int result = pService.returnTeacher(memNo);
		return result > 0 ? "success" : "fail";
	}
	
	/*
	@ResponseBody
	@RequestMapping("uploadProfile.cm")
	public void ajaxUploadProfile(MultipartFile uploadFile, Member m, String originalFile, HttpSession session) {
	
		if(uploadFile != null) { 
			
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			m.setMemProfile(saveFilePath);
			
			int result = pService.uploadProfileImg(m);
			
			if(result > 0) { 
				
				if(!originalFile.equals("")) {
					new File( session.getServletContext().getRealPath(originalFile) ).delete();
				}
			}
		}
	}
	*/
	
	@ResponseBody
	@RequestMapping("previewProfile.cm")
	public String ajaxPreviewProfile(MultipartFile uploadFile, HttpSession session) {
	
		if(uploadFile != null) { 
			
			String saveFilePath = FileUpload.saveFile(uploadFile, session, "resources/profile_images/");
			System.out.println(saveFilePath);
			
			return saveFilePath;
		}else {
			return "none";
		}
	}
	
	/*
	@ResponseBody
	@RequestMapping("defaultProfile.cm")
	public void ajaxUploadProfile(String memNo,String orifile,HttpSession session) {
		int result = pService.defaultProfile(memNo);
		System.out.println("orifile: "+orifile);
		if(!orifile.equals("")) {
			new File(session.getServletContext().getRealPath(orifile)).delete();
		}
	}
	*/
	
	@RequestMapping("personnelUpdate.me")
	public String updateMember(Member m,HttpSession session) {
		int result = pService.updateMember(m);
		System.out.println(result);
		if(result>0) {
			session.setAttribute("alertMsg", "정보수정에 성공했습니다.");
			return "redirect:list.te";
		}else {
			session.setAttribute("alertMsg", "정보수정에 실패했습니다.");
			return "redirect:detail.te?no="+m.getMemNo();
		}
		
	}
	
	@RequestMapping("personnelUpdate.em")
	public String updateMember2(Member m,HttpSession session) {
		int result = pService.updateMember(m);
		System.out.println(result);
		if(result>0) {
			session.setAttribute("alertMsg", "정보수정에 성공했습니다.");
			return "redirect:list.em";
		}else {
			session.setAttribute("alertMsg", "정보수정에 실패했습니다.");
			return "redirect:detail.em?no="+m.getMemNo();
		}
		
	}
	
	@RequestMapping("addForm.te")
	public String addFormTeacher() {
		return "personnel/addTeacher";
	}
	
	@RequestMapping("personnelAdd.pe")
	public String addMember(Member m,HttpSession session) {
		int result = pService.addMember(m);
		if(result>0) {
			session.setAttribute("alertMsg", "등록성공");
			return "redirect:list.te";
		}else {
			session.setAttribute("alertMsg", "등록실패");
			return "redirect:addForm.te";
		}
		
	}
	
	// 직원관리
	
	@RequestMapping("list.em")
	public String selectEmployeeList(@RequestParam(value="p",defaultValue = "1")int currentPage, Model model) {
		
		int listCount = pService.employeeListCount();
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 5, 10);
		ArrayList<Member> list = pService.employeeList(pi);
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		dlist.remove(0);
		jlist.remove(0);
		model.addAttribute("list", list);
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("pi", pi);
		return "personnel/selectEmployee";
	}
	
	@RequestMapping("search.em")
	public String selectEmployeeList(boolean check1,boolean check2, String keyword, String deptCode, String jobCode, @RequestParam(value="p",defaultValue = "1")int currentPage, Model model) {
		HashMap m = new HashMap();
		m.put("check1", check1);
		m.put("check2", check2);
		m.put("keyword", keyword);
		m.put("deptCode", deptCode);
		m.put("jobCode", jobCode);
		
		int listCount = pService.searchEmployeeListCount(m);
		PageInfo pi = Pagination.getInfo(listCount, currentPage , 5, 10);
		ArrayList<Member> list = pService.searchEmployeeList(pi, m);
		
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("searchck", 1);
		model.addAttribute("keyword", keyword);
		model.addAttribute("check1", check1);
		model.addAttribute("check2", check2);
		model.addAttribute("deptCode", deptCode);
		model.addAttribute("jobCode", jobCode);
		return "personnel/selectEmployee";
	}
	
	@RequestMapping("detail.em")
	public String detailEmployeeInfo(String no,Model model) {
		Member m = pService.detailTeacherInfo(no);
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		
		model.addAttribute("m", m);
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		return "personnel/detailEmployee";
	}
	
	@RequestMapping("addForm.em")
	public String addFormTeacher(Model model) {
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		dlist.remove(0);
		jlist.remove(0);
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		return "personnel/addEmployee";
	}
	
	@RequestMapping("personnelAdd.em")
	public String addEmployee(Member m,HttpSession session) {
		int result = pService.addMember(m);
		if(result>0) {
			session.setAttribute("alertMsg", "등록성공");
			return "redirect:list.em";
		}else {
			session.setAttribute("alertMsg", "등록실패");
			return "redirect:addForm.em";
		}
	}
	
	// OJT
	
	@RequestMapping("ojtMain.oj")
	public String ojtMain(@RequestParam(value="p",defaultValue = "1")int currentPage, Model model) {
		int listCount = pService.ojtListCount();
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 5, 5);
		ArrayList<Ojt> list = pService.ojtList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "personnel/ojtPage";
	}
	
	@RequestMapping("search.oj")
	public String searchOjt(boolean check1,boolean check2,boolean check3, String keyword,@RequestParam(value="p",defaultValue = "1")int currentPage, Model model) {
		HashMap m = new HashMap();
		m.put("check1", check1);
		m.put("check2", check2);
		m.put("check3", check3);
		m.put("keyword", keyword);
		
		int listCount = pService.searchOjtListCount(m);
		PageInfo pi = Pagination.getInfo(listCount, currentPage , 5, 5);
		ArrayList<Ojt> list = pService.searchOjtList(pi, m);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("searchck", 1);
		model.addAttribute("keyword", keyword);
		model.addAttribute("check1", check1);
		model.addAttribute("check2", check2);
		model.addAttribute("check3", check3);
		return "personnel/ojtPage";
	}
	
	
	// 메일기능추가!!
	@RequestMapping("sendOjt.oj")
	public String sendOjt(String[] memNos,String[] memEmail,String sendTitle,String sendContent,String sendDate,HttpSession session) {
		HashMap m = new HashMap();
		m.put("sendDate", sendDate);
		int result = pService.updateOjtDate(memNos, m);
		
		if(result>0) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String sendUserNo = loginUser.getMemNo();
			String sendUserEmail = loginUser.getMemEmail();
			String memEmailStr = String.join(",", memEmail);
			HashMap m2 = new HashMap();
			m2.put("memEmailStr", memEmailStr);
			m2.put("sendContent", sendContent);
			m2.put("sendTitle", sendTitle);
			m2.put("sendUserNo", sendUserNo);
			ArrayList<MailStatus> list = new ArrayList<>();
			MailStatus ms = new MailStatus();
			ms.setSendMail(sendUserEmail);
			ms.setReceiveMail(memEmailStr);
			ms.setMailFolder(1);
			list.add(ms);
			for(String e : memEmail) {
				MailStatus ms1 = new MailStatus();
				ms1.setSendMail(sendUserEmail);
				ms1.setReceiveMail(e);
				ms1.setMailFolder(2);
				list.add(ms1);
			}
			int result2 = pService.sendOjtMail(m2, list);
			if(result2>0) {
				session.setAttribute("alertMsg", "등록성공");
				return "redirect:ojtMain.oj";
			}else {
				session.setAttribute("alertMsg", "메일전송실패");
				return "redirect:ojtMain.oj";
			}
			
		}else {
			session.setAttribute("alertMsg", "등록실패");
			return "redirect:ojtMain.oj";
		}
	}
	
	@ResponseBody
	@RequestMapping("complete.oj")
	public String completeOjt(@RequestParam(value="memNo[]")ArrayList<String> list) {
		int result = pService.completeOjt(list);
		return result > 0 ? "success" : "fail";
	}
	
	// 메일기능추가!!
	@ResponseBody
	@RequestMapping("cancel.oj")
	public String cancelOjt(@RequestParam(value="memNo[]")ArrayList<String> list,@RequestParam(value="memEmail[]")ArrayList<String> list2,
							String title,String content,HttpSession session) {
		int result = pService.cancelOjt(list);
		if(result>0) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			String sendUserNo = loginUser.getMemNo();
			String sendUserEmail = loginUser.getMemEmail();
			String memEmailStr = String.join(",", list2);
			HashMap m2 = new HashMap();
			m2.put("memEmailStr", memEmailStr);
			m2.put("sendContent", content);
			m2.put("sendTitle", title);
			m2.put("sendUserNo", sendUserNo);
			ArrayList<MailStatus> alist = new ArrayList<>();
			MailStatus ms = new MailStatus();
			ms.setSendMail(sendUserEmail);
			ms.setReceiveMail(memEmailStr);
			ms.setMailFolder(1);
			alist.add(ms);
			for(String e : list2) {
				MailStatus ms1 = new MailStatus();
				ms1.setSendMail(sendUserEmail);
				ms1.setReceiveMail(e);
				ms1.setMailFolder(2);
				alist.add(ms1);
			}
			int result2 = pService.sendOjtMail(m2, alist);
			if(result2>0) {
				return "success";
			}else {
				return "fail";
			}
		}else {
			return "fail";
		}
	}
	
	@RequestMapping("select.at")
	public String selectAttendance(Model model) {
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		return "personnel/selectAttendance";
	}
	
	@RequestMapping("search.at")
	public String searchAttendance(SearchAt s,@RequestParam(value="p",defaultValue = "1")int currentPage,Model model) {
		
		ArrayList<Restdate> restList = pService.searchRestdate(s);
		System.out.println(restList);
		if(!restList.isEmpty()) {
			s.setList(restList);
		}
		
		int listCount = pService.atListCount(s);
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Attendance> list = pService.searchAtList(pi, s);
		
		SearchAt count = new SearchAt();
		count.setDeptCode(s.getDeptCode());
		count.setJobCode(s.getJobCode());
		count.setKeyword(s.getKeyword());
		count.setStartDate(s.getStartDate());
		count.setEndDate(s.getEndDate());
		count.setList(s.getList());
		
		count.setCheck1(true);
		count.setCheck2(false);
		count.setCheck3(false);
		int normal = pService.atListCount(count);
		
		count.setCheck1(false);
		count.setCheck2(true);
		count.setCheck3(false);
		int leave = pService.atListCount(count);
		
		count.setCheck1(false);
		count.setCheck2(false);
		count.setCheck3(true);
		int absent = pService.atListCount(count);
		
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		model.addAttribute("list", list);
		model.addAttribute("condition", s);
		model.addAttribute("searchck", 1);
		model.addAttribute("normal", normal);
		model.addAttribute("leave", leave);
		model.addAttribute("absent", absent);
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("pi", pi);
		return "personnel/selectAttendance"; 
	}
	
	@RequestMapping("changeData.At")
	public String changeAtData(Attendance at, String testCheck, HttpSession session) {
		System.out.println(at);
		System.out.println(testCheck);
		if(at.getAttStatus().equals("D") || at.getAttStatus().equals("E") || at.getAttStatus().equals("L") || at.getAttStatus().equals("F")) {
			at.setAttHstatus("N");
		}else if(at.getAttStatus().equals("H0")) {
			at.setAttStatus("H");
			at.setAttHstatus("H0");
			at.setAttWorktime("0");
		}else if(at.getAttStatus().equals("H1")) {
			at.setAttStatus("H");
			at.setAttHstatus("H1");
		}else {
			at.setAttStatus("H");
			at.setAttHstatus("H2");
		}
		System.out.println(at);
		int result;
		if(testCheck.equals("무단결근")) {
			if(!at.getAttStatus().equals("F")) {
				// insertAtData
				result = pService.insertAtDate(at);
			}else {
				// 무단결근에서 바꿀 근태상태를 다시정해주세요
				result = 100;
			}
		}else {
			if(at.getAttStatus().equals("F")) {
				// deleteAtData
				result = pService.deleteAtData(at);
			}else {
				// updateAtData
				result = pService.updateAtData(at);
			}
		}
		if(result>0 && result<99) {
			session.setAttribute("alertMsg", "근태정보 수정성공");
			return "redirect:select.at";
		}else if(result==100) {
			session.setAttribute("alertMsg", "무단결근에서 바꿀 근태상태를 다시정해주세요");
			return "redirect:select.at";
		}else {
			session.setAttribute("alertMsg", "근태정보 수정실패");
			return "redirect:select.at";
		}
		
	}
	
	@RequestMapping("objectionManage.ad")
	public String objectionManagePage(@RequestParam(value="p",defaultValue = "1")int currentPage, Model model) {
		int listCount = pService.objectionManageCount();
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 5, 5);
		ArrayList<Adjust> list = pService.objectionManageList(pi);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "personnel/objectionManage";
	}
	
	@RequestMapping("search.ad")
	public String searchAdj(@RequestParam(value="p",defaultValue = "1")int currentPage,SearchAt at, Model model) {
		int listCount = pService.searchAdjCount(at);
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 5, 5);
		ArrayList<Adjust> list = pService.searchAdjList(pi,at);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		model.addAttribute("at", at);
		model.addAttribute("searchck", "1");
		return "personnel/objectionManage";
	}
	
	@RequestMapping("approve.ad")
	public String approveAdj(Adjust ad,HttpSession session) {
		int result = pService.approveAdj(ad);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "승인처리성공");
			session.setAttribute("alertMsg", "승인 및 정보수정에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "승인처리실패");
			session.setAttribute("alertMsg", "승인 및 정보수정에 실패했습니다.");
		}
		return "redirect:objectionManage.ad";
	}
	
	@RequestMapping("refuse.ad")
	public String refuseAdj(Adjust ad,HttpSession session) {
		int result = pService.refuseAdj(ad);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "승인거절완료");
			session.setAttribute("alertMsg", "승인거절처리에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "승인거절처리실패");
			session.setAttribute("alertMsg", "승인거절처리에 실패했습니다.");
		}
		return "redirect:objectionManage.ad";
	}
	
	@RequestMapping("addHoliday.ho")
	public String HolidayAddPage(Model model) {
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		ArrayList<Ojt> list = pService.selectAllMem();
		model.addAttribute("dlist", dlist);
		model.addAttribute("jlist", jlist);
		model.addAttribute("list", list);
		return "personnel/addHoliday";
	}
	
	@ResponseBody
	@RequestMapping(value="searchSelectMem.ho",produces="application/json; charset=utf-8")
	public String searchSelectMem(SearchAt at) {
		ArrayList<Ojt> list = pService.searchSelectMem(at);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("add.ho")
	public String addHoliday(String[] memNos,String dateCount,String comment,HttpSession session) {
		HashMap m = new HashMap();
		m.put("memNos", memNos);
		m.put("dateCount", dateCount);
		m.put("comment", comment);
		int result = pService.addHoliday(m);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "연차전달성공");
			session.setAttribute("alertMsg", "연차전달에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "연차전달실패");
			session.setAttribute("alertMsg", "연차전달실패");
		}
		return "redirect:addHoliday.ho";
	}
	
	@RequestMapping("delete.ho")
	public String deleteHoliday(String[] memNos,String dateCount,String comment,HttpSession session) {
		Double a = Double.parseDouble(dateCount)*-1;
		String dateCo = ""+a; 
		HashMap m = new HashMap();
		m.put("memNos", memNos);
		m.put("dateCount", dateCo);
		m.put("comment", comment);
		int result = pService.deleteHoliday(m);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "연차회수성공");
			session.setAttribute("alertMsg", "연차회수에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "연차회수실패");
			session.setAttribute("alertMsg", "연차회수실패");
		}
		return "redirect:addHoliday.ho";
	}
	
	@RequestMapping("info.me")
	public String myInfo(HttpSession session,Model model) {
		Member m = (Member) session.getAttribute("loginUser");
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		model.addAttribute("m", m);
		return "personnel/myInfo";
	}
	
	@RequestMapping("updateMyInfo.me")
	public String updateMyInfo(Member m,HttpSession session) {
		int result = pService.updateMyInfo(m);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "정보수정성공");
			session.setAttribute("alertMsg", "내정보 수정에 성공했습니다.");
			
			Member loginUser = mService.loginMember(m);
			switch(loginUser.getJobCode()){
				case "J0": loginUser.setJobName("강사"); break;
				case "J1": loginUser.setJobName("사원"); break;
				case "J2": loginUser.setJobName("대리"); break;
				case "J3": loginUser.setJobName("팀장"); break;
				case "J4": loginUser.setJobName("대표"); break;
			}
			session.setAttribute("loginUser", loginUser);
			
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "정보수정실패");
			session.setAttribute("alertMsg", "내정보 수정 실패");
		}
		return "redirect:info.me";
	}
	
	@RequestMapping("AttManage.me")
	public String test(HttpSession session) {
		 
		return "personnel/commutingManagement";
	}
	
	@ResponseBody
	@RequestMapping(value = "count.cl",produces="application/json; charset=utf-8")
	public String countCal(String start,String end,HttpSession session) {
		Member member = (Member) session.getAttribute("loginUser");
		String memNo = member.getMemNo();
		String memEnrollDate = member.getMemEnrollDate();
		
		LocalDate now = LocalDate.now();
		String sysdate = now+"";
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        Date date2 = null;
        Date date3 = null;
        Date date4 = null;
        String StartDate = null;
        String endDate = null;
        int result = 0;
        
        try {
            date1 = format.parse(start);
            date2 = format.parse(sysdate);
            date3 = format.parse(end);
            date4 = format.parse(memEnrollDate);
            
            long calDate = date1.getTime() - date2.getTime();
            if(calDate>0) {
            	result = 1;
            }else {
            	calDate = date1.getTime() - date4.getTime();
            	if(calDate>0) {
            		StartDate = start;
            	}else {
            		StartDate = memEnrollDate;
            	}
            }
            calDate = date3.getTime() - date2.getTime();
            if(calDate>0) {
            	endDate = sysdate;
            }else {
            	endDate = end;
            }
        }catch (ParseException e) {
            e.printStackTrace();
        }
        
        if(result>0) {
        	PersonnelCount pc = new PersonnelCount("0","0","0");
        	return new Gson().toJson(pc);
        }else {
		    SearchAt s = new SearchAt();
			s.setUserNo(memNo);
			s.setStartDate(StartDate);
			s.setEndDate(endDate);
			ArrayList<Restdate> restList = pService.searchRestdate(s);
			if(!restList.isEmpty()) {
				s.setList(restList);
			}
			
			s.setCheck1(true);
			s.setCheck2(false);
			s.setCheck3(false);
			int normal = pService.atListCount2(s);
			
			s.setCheck1(false);
			s.setCheck2(true);
			s.setCheck3(false);
			int leave = pService.atListCount2(s);
			
			s.setCheck1(false);
			s.setCheck2(false);
			s.setCheck3(true);
			int absent = pService.atListCount2(s);
			if(date3.getTime()>date2.getTime() && date2.getTime()>date1.getTime()) {
				s.setStartDate(sysdate);
				s.setEndDate(sysdate);
				int checkF = pService.atListCount2(s);
				System.out.println(checkF);
				absent = absent-checkF;
			}
			
			PersonnelCount pc = new PersonnelCount();
			pc.setNormal(normal+"");
			pc.setLeave(leave+"");
			pc.setAbsent(absent+"");
			return new Gson().toJson(pc);
        }
	}
	
	@ResponseBody
	@RequestMapping(value = "test.cl",produces="application/json; charset=utf-8")
	public String testCal(String start,String end,HttpSession session) throws ParseException {
		Member member = (Member) session.getAttribute("loginUser");
		String memNo = member.getMemNo();
		String memEnrollDate = member.getMemEnrollDate();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = null;
        Date date2 = null;
        String StartDate = null;
        
        try {
            date1 = format.parse(start);
            date2 = format.parse(memEnrollDate);
            
            long calDate = date1.getTime() - date2.getTime();
            if(calDate>=0) {
            	StartDate = start;
            }else {
            	StartDate = memEnrollDate;
            }
        }catch (ParseException e) {
            e.printStackTrace();
        }
        
        SearchAt s = new SearchAt();
        s.setStartDate(StartDate);
        s.setEndDate(end);
        s.setUserNo(memNo);
		ArrayList<Restdate> restList = pService.searchRestdate(s);
		if(!restList.isEmpty()) {
			s.setList(restList);
		}
		
		ArrayList<Attendance> atlist = pService.searchMyAt(s);
		
		ArrayList list = new ArrayList();
		
		for(Attendance at : atlist) {
			if(!at.getAttStatus().equals("F") && !at.getAttHstatus().equals("H0")) {
				HashMap m = new HashMap();
				m.put("start", at.getAttDate());
				if(at.getAttStatus().equals("D")&&at.getAttHstatus().equals("N")) {
					m.put("title", at.getAttIn()+" 출근");
					m.put("color", "green");
				}else if(at.getAttStatus().equals("H") || at.getAttStatus().equals("D")) {
					if(at.getAttHstatus().equals("H1")) {
						if(at.getAttIn()==null) {
							m.put("title", "오전연차");
							m.put("color", "blue");
						}else {
							m.put("title", at.getAttIn()+" 오전연차");
							m.put("color", "blue");
						}
					}else {
						if(at.getAttIn()==null) {
							m.put("title", "");
							m.put("color", "white");
						}else {
							m.put("title", at.getAttIn()+" 출근");
							m.put("color", "blue");
						}
					}
				}else {
					m.put("title", at.getAttIn()+" 무단지각/조퇴");
					m.put("color", "orange");
				}

				HashMap m2 = new HashMap();
				m2.put("start", at.getAttDate());
				if(at.getAttStatus().equals("D")) {
					if(at.getAttOut()!=null) {
						m2.put("title", at.getAttOut()+" 퇴근");
						m2.put("color", "green");
						list.add(m2);
					}
				}else if(at.getAttStatus().equals("H")) {
					if(at.getAttHstatus().equals("H1")) {
						if(at.getAttOut()!=null) {
							m2.put("title", at.getAttOut()+" 퇴근");
							m2.put("color", "blue");
							list.add(m2);
						}
					}else {
						
						m2.put("title", "오후연차");
						m2.put("color", "blue");
						list.add(m2);
					}
				}else {
					if(at.getAttOut()!=null) {
						m2.put("title", at.getAttOut()+" 무단지각/조퇴");
						m2.put("color", "orange");
						list.add(m2);
					}
				}
				
				list.add(m);
				
			}else if(at.getAttStatus().equals("F")) {
				
				Date current = new Date();
				String now1 = format.format(current);
				String atdate1 = at.getAttDate();
				Date now = format.parse(now1);
				Date atdate = format.parse(atdate1);
				if(now.getTime()-atdate.getTime()>0) {
					HashMap m = new HashMap();
					m.put("start", at.getAttDate());
					m.put("title", "무단결근");
					m.put("color", "red");
					list.add(m);
				}
			}else {
				HashMap m = new HashMap();
				m.put("start", at.getAttDate());
				m.put("title", "종일연차");
				m.put("color", "blue");
				list.add(m);
			}
		}
		
		for(Restdate r : restList) {
			if(!r.getReDatename().equals("토") && !r.getReDatename().equals("일")) {
			HashMap m = new HashMap();
			m.put("start", r.getReRestdate());
			m.put("title", r.getReDatename());
			m.put("color", "red");
			list.add(m);
			}
		}
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "searchDetailAt.me",produces="application/json; charset=utf-8")
	public String searchDetailAt(String day,HttpSession session) {
		String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		SearchAt s = new SearchAt();
		s.setUserNo(memNo);
		s.setStartDate(day);
		s.setEndDate(day);
		ArrayList<Restdate> restList = pService.searchRestdate(s);
		if(!restList.isEmpty()) {
			s.setList(restList);
		}
		Attendance at = pService.searchDetailAt(s);
		at.setRestList(restList);
		return new Gson().toJson(at);
	}
	
	@RequestMapping("adjForm.in")
	public String adhFormInsert(MultipartFile upfile,SearchAt s,HttpSession session) {
		String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		s.setUserNo(memNo);
		System.out.println(s);
		Adjust ad = pService.checkedAdj(s);
		System.out.println(ad);
		if(ad!=null) {
			session.setAttribute("alertIcon", "info");
			session.setAttribute("alertTitle", "조정처리 진행중");
			session.setAttribute("alertMsg", "조정처리 진행중입니다.");
			return "redirect:AttManage.me";
		}else {
			if(!upfile.getOriginalFilename().equals("")) {
				String filePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/personnelFiles/");
				s.setKeyword(filePath);
			}
			
			int result = pService.adhFormInsert(s);
			if(result>0) {
				session.setAttribute("alertIcon", "success");
				session.setAttribute("alertTitle", "조정신청성공");
				session.setAttribute("alertMsg", "조정신청에 성공했습니다.");
			}else {
				session.setAttribute("alertIcon", "error");
				session.setAttribute("alertTitle", "조정신청실패");
				session.setAttribute("alertMsg", "조정신청실패");
			}
			return "redirect:AttManage.me";
		}
		
	}
	//if(at != null) {
	//new File(savePath + at.getChangeName()).delete();
	//String savePath = session.getServletContext().getRealPath("/resources/board_upfiles/");
	
	@RequestMapping("modifyAdj.me")
	public String adjModify(MultipartFile upfile,SearchAt s,HttpSession session) {
			
		if(!upfile.getOriginalFilename().equals("")) {
				String filePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/personnelFiles/");
				s.setKeyword(filePath);
			}
			
			int result = pService.adjModify(s);
			if(result>0) {
				session.setAttribute("alertIcon", "success");
				session.setAttribute("alertTitle", "수정성공");
				session.setAttribute("alertMsg", "수정에 성공했습니다.");
			}else {
				session.setAttribute("alertIcon", "error");
				session.setAttribute("alertTitle", "수정실패");
				session.setAttribute("alertMsg", "수정실패");
			}
			return "redirect:adjust.me";
	}
	
	@RequestMapping("deleteAdj.me")
	public String adjDelete(MultipartFile upfile,SearchAt s,HttpSession session) {
			
		int result = pService.adjDelete(s);
			if(result>0) {
				session.setAttribute("alertIcon", "success");
				session.setAttribute("alertTitle", "삭제성공");
				session.setAttribute("alertMsg", "삭제에 성공했습니다.");
			}else {
				session.setAttribute("alertIcon", "error");
				session.setAttribute("alertTitle", "삭제실패");
				session.setAttribute("alertMsg", "삭제실패");
			}
			return "redirect:adjust.me";
	}
	
	@ResponseBody
	@RequestMapping(value = "submitIn.me")
	public String submitIn(String inDate,String inTime,HttpSession session) throws ParseException {
		String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		SearchAt s = new SearchAt();
		s.setUserNo(memNo);
		s.setStartTime(inTime);
		s.setStartDate(inDate);
		int count = pService.checkedCountIn(s);
		Attendance at = null;
	    if(count>0) {
	    	 at = pService.checkedIn(s);	
	    }
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String a = inDate+" "+inTime;
		String b = inDate+" 09:00";
		if(count>0) {
			b = inDate+" "+at.getAttFixedin();
		}
		Date in = format.parse(a);
		Date fixedIn = format.parse(b);
		long resultTime = in.getTime() - fixedIn.getTime();
		
		Attendance at2 = new Attendance();
		at2.setMemNo(memNo);
		at2.setAttDate(inDate);
		at2.setAttIn(inTime);
		if(resultTime<=0) {
			at2.setAttStatus("D");
		}else {
			at2.setAttStatus("L");
		}
		
		int result=0;
		if(count>0) {
			if(at.getAttIn().equals("")) {
				//출근시간비교후 update
				at2.setAttNo(at.getAttNo());
				result = pService.updateAttIn(at2);
			}else {
				//이미출근처리완료
				result=100;
			}
		}else {
			//출근시간비교후 insert
			result = pService.insertAttIn(at2);
		}
		
		if(result>0&&result<99) {
			return "success";
		}else if(result==100) {
			return "errors";
		}else {
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "submitOut.me")
	public String submitOut(String outDate,String outTime,HttpSession session) throws ParseException{
		String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		SearchAt s = new SearchAt();
		s.setUserNo(memNo);
		s.setStartDate(outDate);
		s.setEndTime(outTime);
		s.setEndDate(outDate);
		int count = pService.checkedCountIn(s);
		if(count==0) {
			//출근전입니다
			System.out.println("출근전");
			return "none";
		}else {
			Attendance at = pService.checkedIn(s);
			if(at.getAttOut()==null) {
				
				at.setAttOut(outTime);
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm");
				String a = outDate+" "+outTime;
				String b = outDate+" "+at.getAttFixedout();
				Date out = format.parse(a);
				Date fixedOut = format.parse(b);
				long resultTime = out.getTime() - fixedOut.getTime();
				String c = outDate+" "+at.getAttIn();
				Date in = format.parse(c);
				long resultWork = out.getTime() - in.getTime();
				double workTime1 = resultWork/1000.0/60/60;
				float w1 = (float) ((Math.round(workTime1*10))/10.0);
				String workTime = w1+"";
				at.setAttWorktime(workTime);
				if(resultTime<0) {
					at.setAttStatus("E");
				}
				int result = pService.updateOut(at);
				if(result>0) {
					//퇴근처리성공
					return "success";
				}else {
					//퇴근처리실패
					return "fail";
				}
			}else {
				//이미퇴근처리함
				return "zzz";
			}
		}
	}
	
	@RequestMapping("adjust.me")
	public String adjustMe(Model model,HttpSession session,@RequestParam(value="p",defaultValue = "1")int currentPage) {
		String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		int listCount = pService.adjustMeCount(memNo);
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 3, 10);
		ArrayList<Adjust> list = pService.adjustMe(pi, memNo);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "personnel/myAdjust";
	}
	
	@RequestMapping("holiday.me")
	public String myholiday(Model model,HttpSession session,@RequestParam(value="p1",defaultValue = "1")int currentPage1,
			                @RequestParam(value="p2",defaultValue = "1")int currentPage2,String selectY1,String selectY2) {
		//select 목록 자동화
		int start = 2021; //시작연도설정
		String now = LocalDate.now()+"";
		String year = now.substring(0, 4);
		ArrayList<String> selectlist = new ArrayList<>();
		int r = Integer.parseInt(year)-start;
		for(int i=0;i<=r;i++) {
			int year1 = start+i;
			String option = year1+"-01-01 ~ "+year1+"-12-31";
			selectlist.add(option);
		}
		model.addAttribute("selectlist",selectlist);
		
		String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		if(selectY1==null) {
			selectY1=year;
		}
		if(selectY2==null) {
			selectY2=year;
		}
		
		HashMap<String,String> m1 = new HashMap<String, String>();
		m1.put("memNo", memNo); m1.put("year", selectY1);
		int listCount1 = pService.hoApproveCount(m1);
		PageInfo pi1 = Pagination.getInfo(listCount1, currentPage1 , 3, 5);
		ArrayList<HolidayForm> list1 = pService.hoApproveList(pi1,m1);
		model.addAttribute("list1", list1);
		model.addAttribute("pi1", pi1);
		System.out.println(list1);
		
		HashMap<String,String> m2 = new HashMap<>();
		m2.put("memNo", memNo); m2.put("year", selectY2);
		int listCount2= pService.hoCount(m2);
		PageInfo pi2 = Pagination.getInfo(listCount2, currentPage2 , 3, 5);
		ArrayList<Holiday> list2 = pService.hoList(pi2,m2);
		model.addAttribute("list2", list2);
		model.addAttribute("pi2", pi2);
		
		String totalHo = pService.totalHo(memNo);
		String useHo = pService.useHo(memNo);
		if(totalHo==null) {
			totalHo="0";
		}
		if(useHo==null) {
			useHo="0";
		}
		double remain = Double.parseDouble(totalHo)-Double.parseDouble(useHo);
		model.addAttribute("totalHo", totalHo);
		model.addAttribute("useHo", useHo);
		model.addAttribute("remain", remain);
		model.addAttribute("selectY1", selectY1);
		model.addAttribute("selectY2", selectY2);
		
		return "personnel/myholiday";
	}
	
	@RequestMapping("selectManage.ho")
	public String selectManageHo(Model model,HttpSession session,@RequestParam(value="p1",defaultValue = "1")int currentPage1,
            					 @RequestParam(value="p2",defaultValue = "1")int currentPage2, SearchAt s) {
		
		if(s.getStartDate()==null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			String a = now+"";
			String end = a.substring(0, 10);
			String start = a.substring(0, 8)+"01";
			s.setStartDate(start);
			s.setEndDate(end);
		}
		
		if(s.getDeptCode()==null) {
			s.setDeptCode("all");
		}
		
		if(s.getJobCode()==null) {
			s.setJobCode("all");
		}
		
		int listCount1 = pService.holidayMgCount(s);
		PageInfo pi1 = Pagination.getInfo(listCount1, currentPage1, 3, 5);
		ArrayList<HolidayForm> list1 = pService.holidayMgList(pi1,s);
		model.addAttribute("list1", list1);
		model.addAttribute("pi1",pi1);
		
		int listCount2 = pService.holidayAddCount(s);
		PageInfo pi2 = Pagination.getInfo(listCount2, currentPage2, 3, 5);
		ArrayList<Holiday> list2 = pService.holidayAddList(pi2,s);
		model.addAttribute("list2", list2);
		model.addAttribute("pi2",pi2);
		model.addAttribute("condition", s);
		
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		return "personnel/holidayManage";
	}
	
	@RequestMapping("addCal.ho")
	public String addHoCalendar(SearchAt s,HttpSession session) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(s.getStartDate(), formatter);
		LocalDate endDate = LocalDate.parse(s.getEndDate(), formatter);
		List enrollDate = startDate.datesUntil(endDate).collect(Collectors.toList());
		enrollDate.add(endDate);
		int result = pService.addHoCalendar(s,enrollDate);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "등록성공");
			session.setAttribute("alertMsg", "등록에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "등록실패");
			session.setAttribute("alertMsg", "등록실패");
		}
		return "redirect:selectManage.ho";
	}
	
	@RequestMapping("addHCal.ho")
	public String addHalfHoCalendar(SearchAt s,boolean radio1,boolean radio2,HttpSession session) {
		int result = pService.addHalfHoCalendar(s,radio1,radio2);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "등록성공");
			session.setAttribute("alertMsg", "등록에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "등록실패");
			session.setAttribute("alertMsg", "등록실패");
		}
		return "redirect:selectManage.ho";
	}
	
	@ResponseBody
	@RequestMapping(value="count.ho")
	public String countHoli(@RequestParam(value="userNo[]")ArrayList<String> list) {
		System.out.println(list);
		SearchAt s = new SearchAt();
//		s.setUserNo(list.get(0));
//		s.setStartDate(list.get(1).substring(0, 4)+"-01-01");
//		s.setEndDate(list.get(1).substring(0, 4)+"-12-31");
		String totalho = pService.totalHo(list.get(0));
		String useho = pService.useHo(list.get(0));
		if(totalho==null) {
			totalho="0";
		}
		if(useho==null) {
			useho="0";
		}
		Double re = Double.parseDouble(totalho)-Double.parseDouble(useho);
		return totalho+","+useho+","+re;
	}
	
	@ResponseBody
	@RequestMapping(value="chart.at",produces="application/json; charset=utf-8")
	public String chart(String userNo) {
		LocalDateTime now = LocalDateTime.now();
		ArrayList<String> xlist = new ArrayList<>();
		ArrayList<String> xlist2 = new ArrayList<>();
		int y = now.getYear();
		int m = now.getMonthValue()+1;
		for(int i=0;i<12;i++) {
			m = m-1;
			if(m==0) {
				m=12;
				y=y-1;
			}
			String month;
			if(m<10) {
				month = 0+""+m;
			}else {
				month = m+"";
			}
			String date = y+"-"+month;
			String date2 = y+"-"+month+"-01";
			xlist.add(date);
			xlist2.add(date2);
		}
		ArrayList<String> ylist = pService.countWorktime(xlist,userNo);
		System.out.println(ylist);
		
		// ylist2 구하기
		SearchAt s = new SearchAt();
		
		s.setUserNo(userNo);
		
		ArrayList<String> ylist2 = pService.atListCount3(s, xlist, xlist2);
		System.out.println(ylist2);
		HashMap hs = new HashMap();
		Member mb = pService.detailTeacherInfo(userNo);
		hs.put("memName", mb.getMemName());
		hs.put("xlist", xlist); 
		hs.put("ylist", ylist); 
		hs.put("ylist2", ylist2);
		return new Gson().toJson(hs);
	}
	
	@ResponseBody
	@RequestMapping(value="chart.at2",produces="application/json; charset=utf-8")
	public String chart2(String userNo) {
		System.out.println(userNo);
		LocalDate currentDate = LocalDate.now();
	    int weekOfYear = currentDate.get(WeekFields.ISO.weekOfYear());
	    LocalDate dayStart = LocalDate.now()
	            .with(IsoFields.WEEK_OF_WEEK_BASED_YEAR, weekOfYear)
	            .with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
	    ArrayList<String> xlist = new ArrayList<>();
		ArrayList<String> xlist2 = new ArrayList<>();
	    for(int i=0;i<12;i++) {
	    	String start = dayStart.minusDays(7*i)+"";
	    	String end = dayStart.plusDays(4).minusDays(7*i)+"";
	    	xlist.add(start); xlist2.add(end);
	    }
	    ArrayList<String> ylist = pService.countWeekWorktime(xlist,xlist2,userNo);
	    System.out.println(ylist);
	    
	    //ylist2구하기
	    SearchAt s = new SearchAt();
		s.setUserNo(userNo);
		ArrayList<String> ylist2 = pService.atListWeekCount(s, xlist, xlist2);
		System.out.println(ylist2);
		HashMap hs = new HashMap();
		Member mb = pService.detailTeacherInfo(userNo);
		hs.put("memName", mb.getMemName());
		hs.put("xlist", xlist); 
		hs.put("xlist2", xlist2); 
		hs.put("ylist", ylist); 
		hs.put("ylist2", ylist2);
		return new Gson().toJson(hs);
	}
	
	@ResponseBody
	@RequestMapping(value="check.ho",produces="application/json; charset=utf-8")
	public String checkHo() {
		HashMap hs = pService.checkHo();
		
		return new Gson().toJson(hs);
	}
	
	@ResponseBody
	@RequestMapping(value="sendAuto1.ho")
	public String sendAuto1(@RequestParam(value="list1[]")String[] list1,@RequestParam(value="list15[]")String[] list15,HttpSession session) {
		System.out.println(list1);
		System.out.println(list15);
		int result1 = pService.sendAutoHo1(list1);
		int result2 = pService.sendAutoHo15(list15);
		if(result1*result2>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "등록성공");
			session.setAttribute("alertMsg", "등록에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "등록실패");
			session.setAttribute("alertMsg", "등록실패");
		}
		return "end";
	}
	
	@ResponseBody
	@RequestMapping(value="sendAuto2.ho")
	public String sendAuto2(@RequestParam(value="list1[]")String[] list1,HttpSession session) {
		System.out.println(list1);
		int result1 = pService.sendAutoHo1(list1);
		if(result1>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "등록성공");
			session.setAttribute("alertMsg", "등록에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "등록실패");
			session.setAttribute("alertMsg", "등록실패");
		}
		return "end";
	}
	
	@ResponseBody
	@RequestMapping(value="sendAuto3.ho")
	public String sendAuto3(@RequestParam(value="list15[]")String[] list15,HttpSession session) {
		System.out.println(list15);
		int result2 = pService.sendAutoHo15(list15);
		if(result2>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "등록성공");
			session.setAttribute("alertMsg", "등록에 성공했습니다.");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "등록실패");
			session.setAttribute("alertMsg", "등록실패");
		}
		return "end";
	}
	
	@RequestMapping("changePw.me")
	public String changePwd(String pwd,HttpSession session,Model model) {
		Member mb = (Member)session.getAttribute("loginUser");
		mb.setMemPwd(pwd);
		int result = pService.changePwd(mb);
		if(result>0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "변경성공");
			session.setAttribute("alertMsg", "비밀번호 변경에 성공했습니다.");
			
			Member loginUser = mService.loginMember((Member)session.getAttribute("loginUser"));
			
			if(loginUser != null /*&& bcryptPasswordEncoder.matches(m.getMemId(), loginUser.getMemPwd())*/) {
				
				switch(loginUser.getJobCode()){
				case "J0": loginUser.setJobName("강사"); break;
				case "J1": loginUser.setJobName("사원"); break;
				case "J2": loginUser.setJobName("대리"); break;
				case "J3": loginUser.setJobName("팀장"); break;
				case "J4": loginUser.setJobName("대표"); break;
				}
				
				switch(loginUser.getDeptCode()) {
				case "D0" : session.setAttribute("deptName", "강사"); break;
				case "D1" : session.setAttribute("deptName", "인사팀"); break;
				case "D2" : session.setAttribute("deptName", "행정팀"); break;
				case "D3" : session.setAttribute("deptName", "홍보팀"); break;
				case "DN" : session.setAttribute("deptName", "대표"); break;
				// 대표일 경우 게시판 고를 수 있도록 처리할 예정
				}
				session.setAttribute("loginUser", loginUser);;
			}else {
				
			}
			Member m = (Member) session.getAttribute("loginUser");
			ArrayList<Department> dlist = pService.selectDept();
			ArrayList<Job> jlist = pService.selectJob();
			model.addAttribute("jlist", jlist);
			model.addAttribute("dlist", dlist);
			model.addAttribute("m", m);
			return "personnel/myInfo";
			
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "변경실패");
			session.setAttribute("alertMsg", "변경실패");
			
			Member m = (Member) session.getAttribute("loginUser");
			ArrayList<Department> dlist = pService.selectDept();
			ArrayList<Job> jlist = pService.selectJob();
			model.addAttribute("jlist", jlist);
			model.addAttribute("dlist", dlist);
			model.addAttribute("m", m);
			return "personnel/myInfo";
		}

	}
	
}
