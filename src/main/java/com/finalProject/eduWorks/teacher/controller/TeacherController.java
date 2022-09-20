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
		/*
		for(int i=0; i<list.size(); i++) {
			switch(list.get(i).getClassApproval()){
			case "1": list.get(i).setClassApproval("대기중"); break;
			case "2": list.get(i).setClassApproval("승인"); break;
			case "3": list.get(i).setClassApproval("반려"); break;
			}
		}
		*/
		System.out.println(pi.getMaxPage());
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
		
		int result = tService.appEnrollFormInsert(t);

		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "강의 개설신청 완료");
			session.setAttribute("alertMsg", "강의 개설신청을 완료하였습니다.");
			return "redirect:appAllList.cl";
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

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("teacher/bookList");
		return mv;
	}
	
	// (강사) 교재등록페이지
	@RequestMapping("bookEnrollForm.bk")
	public String BookEnroll() {
		return "teacher/bookEnrollForm";
	}
	
	// (강사) 교재 등록
	@RequestMapping("bookInsert.bk")
	public String bookEnrollFormInsert(Book b, HttpSession session) {
		int result = tService.bookEnrollFormInsert(b);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "교재등록 완료");
			session.setAttribute("alertMsg", "교재등록을 완료하였습니다.");
			return "redirect:bookList.bk";
		}else {
			session.setAttribute("errorMsg", "교재등록 실패.");
			return "redierct:/";
		}
	}
	
	// (강사) 교재 상세페이지
	@RequestMapping("bookDetailView.bk")
	public ModelAndView bookDetailViewSelect(int no, ModelAndView mv, HttpSession session) {
		
		Book b = tService.bookDetailViewSelect(no);
		
		if(b != null) {
			mv.addObject("b", b).setViewName("teacher/bookDetailView");
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "조회 실페");
			session.setAttribute("alertMsg", "페이지 조회를 실패하였습니다.");
			mv.setViewName("teacher/bookList");
		}
		return mv;
		
	}
	// (강사) 교재 수정 페이지 이동
	@RequestMapping("bookUpdateForm.bk")
	public ModelAndView bookUpdateForm(int no, ModelAndView mv) {
		mv.addObject("b", tService.bookDetailViewSelect(no)).setViewName("teacher/bookUpdate");
		return mv;
	}
	
	// (강사) 교재 수정
	@RequestMapping("bookUpdate.bk")
	public String bookUpdate(Book b, HttpSession session) {
		
		int result = tService.bookUpdate(b);
			
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "수정 성공");
			session.setAttribute("alertMsg", "교재 수정을 성공하였습니다.");
			return "redirect:bookDetailView.bk?no=" + b.getBookNo();
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "수정 실페");
			session.setAttribute("alertMsg", "교재 수정을 실패하였습니다.");
			return "redirect:bookDetailView.bk?no=" + b.getBookNo();
		}
	}
	
	// (강사) 교재 삭제
	@RequestMapping("bookDelete.bk")
	public String deletBook(int no, HttpSession session) {
		
		int result = tService.deleteBook(no);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "삭제 성공");
			session.setAttribute("alertMsg", "교재 삭제를 성공하였습니다.");
			return "redirect:bookList.bk";
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "삭제 실페");
			session.setAttribute("alertMsg", "교재 삭제를 실패하였습니다.");
			return "redirect:bookDetailView.bk?no=" + no;
		}
	}
	
	// (강사) 교재 리스트 검색 기능
	@RequestMapping("bookSearchForm.bk")
	public ModelAndView bookSearchForm(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, String condition, String keyword, HttpSession session) {
		
		int listCount = tService.searchBookListCount(condition, keyword);
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Book> list = tService.bookSearchForm(pi, condition, keyword);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("teacher/bookList");
		
		return mv;
	}
	
	// (강사) 등록한 강의 리스트 검색 기능
	@RequestMapping("appSearchForm.cl")
	public ModelAndView appLectureSearchList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, String condition, String keyword, HttpSession session) {
		
		int listCount = tService.searchAppListCount(condition, keyword);
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Teacher> list = tService.appLectureSearchList(pi, condition, keyword);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .addObject("condition", condition)
		  .addObject("keyword", keyword)
		  .setViewName("teacher/appLectureList");
		System.out.println(pi.getMaxPage());
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
