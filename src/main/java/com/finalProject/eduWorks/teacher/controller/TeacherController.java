package com.finalProject.eduWorks.teacher.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.teacher.model.service.TeacherService;
import com.finalProject.eduWorks.teacher.model.vo.Book;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

@Controller
public class TeacherController {
	
	@Autowired
	private TeacherService tService;

	// (강사) 신청한 강의 리스트
	@RequestMapping("appAllList.cl")
	public ModelAndView appAllListSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = tService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Teacher> list = tService.appAllListSelect(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("teacher/appLectureList");
		
		return mv;
	}
	
	// (강사) 강의 신청 페이지 이동
	@RequestMapping("appEnroll.cl")
	public String appEnroll() {
		return "teacher/appLectureEnroll";
	}
	
	// (강사) 강의 신청 insert
	@RequestMapping("appEnrollForm.cl")
	public String appEnrollFormInsert(Teacher t, HttpSession session) {
		
		int result = tService.bookEnrollFormInsert(t);
		System.out.println(t);
		if(result > 0) {
			session.setAttribute("alertMsg", "강의 개설신청을 완료하였습니다.");
			return "redirect:bookList.bk";
		}else {
			session.setAttribute("errorMsg", "강의 개설신청 실패.");
			return "redierct:/";
		}
	}
	
	// (강사) 교재리스트
	@RequestMapping("bookList.bk")
	public ModelAndView bookListSelect(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = tService.selectBookListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Book> list = tService.bookListSelect(pi);
		System.out.println(list);
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("teacher/bookList");
		return mv;
	}
	
	// (강사) 교재 등록
	@RequestMapping("bookEnrollForm.bk")
	public ModelAndView bookEnrollFormInsert(ModelAndView mv) {
		mv.setViewName("teacher/appLectureEnroll");
		return mv;
	}
	
	// (강사) 교재 상세페이지
	@RequestMapping("bookDetailView.bk")
	public ModelAndView bookDetailViewSelect(ModelAndView mv) {
		mv.setViewName("teacher/bookDetailView");
		return mv;
	}
	
	// (강사) 교재 수정
	@RequestMapping("bookUpdate.bk")
	public ModelAndView bookUpdateForm(ModelAndView mv) {
		mv.setViewName("teacher/bookUpdate");
		return mv;
	}
}
