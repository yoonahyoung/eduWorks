package com.finalProject.eduWorks.personnel.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	public String addHoliday(String[] memNos,String dateCount,HttpSession session) {
		HashMap m = new HashMap();
		m.put("memNos", memNos);
		m.put("dateCount", dateCount);
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
	public String deleteHoliday(String[] memNos,String dateCount,HttpSession session) {
		Double a = Double.parseDouble(dateCount)*-1;
		String dateCo = ""+a; 
		HashMap m = new HashMap();
		m.put("memNos", memNos);
		m.put("dateCount", dateCo);
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
			PersonnelCount pc = new PersonnelCount();
			pc.setNormal(normal+"");
			pc.setLeave(leave+"");
			pc.setAbsent(absent+"");
			return new Gson().toJson(pc);
        }
	}
	
	@ResponseBody
	@RequestMapping(value = "test.cl",produces="application/json; charset=utf-8")
	public String testCal(String start,String end,HttpSession session) {
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
				if(at.getAttStatus().equals("D")) {
					m.put("title", at.getAttIn()+" 출근");
					m.put("color", "green");
				}else if(at.getAttStatus().equals("H")) {
					if(at.getAttHstatus().equals("H1")) {
						m.put("title", at.getAttIn()+" 오전연차");
						m.put("color", "blue");
					}else {
						m.put("title", at.getAttIn()+" 출근");
						m.put("color", "blue");
					}
				}else {
					m.put("title", at.getAttIn()+" 무단지각/조퇴");
					m.put("color", "orange");
				}

				HashMap m2 = new HashMap();
				m2.put("start", at.getAttDate());
				if(at.getAttStatus().equals("D")) {
					m2.put("title", at.getAttOut()+" 퇴근");
					m2.put("color", "green");
				}else if(at.getAttStatus().equals("H")) {
					if(at.getAttHstatus().equals("H1")) {
						m2.put("title", at.getAttOut()+" 퇴근");
						m2.put("color", "blue");
					}else {
						m2.put("title", at.getAttOut()+" 오후연차");
						m2.put("color", "blue");
					}
				}else {
					m2.put("title", at.getAttOut()+" 무단지각/조퇴");
					m2.put("color", "orange");
				}
				
				list.add(m);
				list.add(m2);
			}else if(at.getAttStatus().equals("F")) {
				HashMap m = new HashMap();
				m.put("start", at.getAttDate());
				m.put("title", "무단결근");
				m.put("color", "red");
				list.add(m);
			}else {
				HashMap m = new HashMap();
				m.put("start", at.getAttDate());
				m.put("title", "종일연차");
				m.put("color", "blue");
				list.add(m);
			}
		}
		
		for(Restdate r : restList) {
			HashMap m = new HashMap();
			m.put("start", r.getReRestdate());
			m.put("title", r.getReDatename());
			m.put("color", "red");
			list.add(m);
		}
		
		return new Gson().toJson(list);
	}
	
}
