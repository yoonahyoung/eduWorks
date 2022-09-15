package com.finalProject.eduWorks.personnel.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.FileUpload;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.service.PersonnelService;
import com.finalProject.eduWorks.personnel.model.vo.Attendance;
import com.finalProject.eduWorks.personnel.model.vo.Ojt;
import com.finalProject.eduWorks.personnel.model.vo.SearchAt;

@Controller
public class PersonnelController {
	
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
	public String sendOjt(String[] memNos,String sendTitle,String sendContent,String sendDate,HttpSession session) {
		HashMap m = new HashMap();
		m.put("sendDate", sendDate);
		int result = pService.updateOjtDate(memNos, m);
		
		if(result>0) {
			session.setAttribute("alertMsg", "등록성공");
			return "redirect:ojtMain.oj";
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
	public String cancelOjt(@RequestParam(value="memNo[]")ArrayList<String> list,String title,String content) {
		int result = pService.cancelOjt(list);
		return result > 0 ? "success" : "fail";
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
		
		//int listCount = 
		//ArrayList<Attendance> list = 
		
		ArrayList<Department> dlist = pService.selectDept();
		ArrayList<Job> jlist = pService.selectJob();
		model.addAttribute("jlist", jlist);
		model.addAttribute("dlist", dlist);
		return "personnel/selectAttendance"; 
	}
	
	
	
	@RequestMapping("test.at")
	public String test() {
		return "personnel/commutingManagement";
	}
	
}
