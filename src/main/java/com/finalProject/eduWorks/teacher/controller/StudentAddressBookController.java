package com.finalProject.eduWorks.teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class StudentAddressBookController {
	
	@RequestMapping("list.st")
	public ModelAndView selectStudentAddressBook(ModelAndView mv) {
		mv.setViewName("teacher/studentAddressBookView");
		return mv;
	}

}
