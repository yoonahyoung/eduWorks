package com.finalProject.eduWorks.teacher.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TeacherController {

	// (강사) 신청한 강의 리스트
	@RequestMapping("appAllList.cl")
	public ModelAndView appAllListSelect(ModelAndView mv) {
		mv.setViewName("teacher/appLectureList");
		return mv;
	}
	
	// (강사) 강의 신청 폼
	@RequestMapping("appEnrollForm.cl")
	public ModelAndView appEnrollFormInsert(ModelAndView mv) {
		mv.setViewName("teacher/appLectureEnroll");
		return mv;
	}
}
