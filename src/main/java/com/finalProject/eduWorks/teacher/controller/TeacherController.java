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
	
	// (강사) 교재리스트
	@RequestMapping("bookList.bk")
	public ModelAndView bookListSelect(ModelAndView mv) {
		mv.setViewName("teacher/bookList");
		return mv;
	}
	
	// (강사) 교재 등록
	@RequestMapping("bookEnrollForm.bk")
	public ModelAndView bookEnrollFormInsert(ModelAndView mv) {
		mv.setViewName("teacher/bookEnrollForm");
		return mv;
	}
	
	// (강사) 교재 상세페이지
	@RequestMapping("bookDetailView.bk")
	public ModelAndView bookDetailViewSelect(ModelAndView mv) {
		mv.setViewName("teacher/bookDetailView");
		return mv;
	}
}
