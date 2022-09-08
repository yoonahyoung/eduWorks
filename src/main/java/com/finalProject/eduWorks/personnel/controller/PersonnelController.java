package com.finalProject.eduWorks.personnel.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.member.model.vo.Department;
import com.finalProject.eduWorks.member.model.vo.Job;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.personnel.model.service.PersonnelService;

@Controller
public class PersonnelController {
	
	@Autowired
	private PersonnelService pService;
	
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
}
