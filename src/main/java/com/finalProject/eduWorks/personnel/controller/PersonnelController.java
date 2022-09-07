package com.finalProject.eduWorks.personnel.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
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
}
