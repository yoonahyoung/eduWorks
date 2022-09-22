package com.finalProject.eduWorks.administration.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.administration.model.service.StudentAddressService;
import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class StudentAddressController {
	
	@Autowired
	private StudentAddressService sService;
	
	/**
	 * 학생 주소록 리스트 조회(행정)
	 * @param currentPage
	 * @param mv
	 * @param session
	 * @return 학생 주소록 리스트, 주소록 리스트 화면
	 */
	@RequestMapping("listSt.ad") // 강사는 listSt.te
	public ModelAndView selectStAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		int listCount = sService.selectListStCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		// 학생 조회
		ArrayList<Student> list = sService.selectStAddressList(pi);
		mv.addObject("pi", pi).addObject("list", list).setViewName("addressBook/adStudentAddressBook");
		
		return mv;
	}
	
	/**
	 * 학생 주소록 리스트 조회(강사)
	 * @param currentPage
	 * @param mv
	 * @param session
	 * @return 학생 주소록 리스트, 주소록 리스트 화면
	 */
	@RequestMapping("listSt.te")
	public ModelAndView selectTeAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
											@RequestParam(value="range", defaultValue="desc") String range, ModelAndView mv, HttpSession session) {
		int memNo = Integer.parseInt(((Member)session.getAttribute("loginUser")).getMemNo());		
		// 페이징 처리
		int listCount = sService.selectListTeCount(memNo);
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 학생 조회
		ArrayList<Student> list = sService.selectTeAddressList(pi, memNo, range);
		mv.addObject("pi", pi).addObject("list", list).addObject("range", range).setViewName("teacher/studentAddressBookView");
		
		return mv;
	}

	
	/**
	 * 학생 주소록 상세 조회 (전체)
	 * @param no	학생 번호
	 * @param model
	 * @return 학생 주소록 화면, 학생 정보
	 */
	@RequestMapping("detailSt.ad")
	public String detailStudent(int no, Model model) {
		// 학생 기본 정보 조회
		Student s = sService.selectStudent(no);
		// 신청 강의 조회
		ArrayList<RegClass> list = sService.selectListRegClass(no);
		// 상담 이력 조회
		ArrayList<Cnsln> cList = sService.selectCnsln(no);
		
		model.addAttribute("s", s);
		model.addAttribute("list", list);
		model.addAttribute("cList", cList);
		return "addressBook/adStudentAdBookDetail";
	}
	
	/**
	 * 학생 정보 수정 화면
	 * @param no	학생 번호
	 * @param model
	 * @return 학생 상세 화면에서의 수정 화면
	 */
	@RequestMapping("updateStForm.ad")
	public String updateStudentForm(int no, Model model) {
		model.addAttribute("update", 1);
		// 학생 기본 정보 조회
		Student s = sService.selectStudent(no);
		
		// 신청 강의 조회
		ArrayList<RegClass> list = sService.selectListRegClass(no);
		
		model.addAttribute("s", s);
		model.addAttribute("list", list);
		return "addressBook/adStudentAdBookDetail";
	}
	
	/**
	 * 학생 정보 수정
	 * @param s		학생 정보
	 * @param model
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping("updateSt.ad")
	public String updateStudent(Student s, Model model) {
		int result = sService.updateStudent(s);
		return new Gson().toJson(result);
	}
	
	
	
//	@RequestMapping("searchStudentAdd.te") 검색 기능 보류
//	public ModelAndView ajaxSeacrhIndivAdd(@RequestParam(value="page", defaultValue="1") int currentPage, @RequestParam(value="range", defaultValue="oldest") String range, ModelAndView mv, String kind, String keyword, Address a) {
//
//		// 연락처 조회시 나오는 연락처 수 조회
//		int searchCount = sService.searchIndivCount(keyword, a);
//		
//		// 페이징
//		PageInfo pi = Pagination.getInfo(searchCount, currentPage, 10, 10);
//		
//		// 연락처 조회시 나오는 연락처 목록 조회
//		ArrayList<Address> search = sService.searchIndivAdd(pi, keyword, a, range);
//		
//		// 개인 주소록 카테고리 목록 조회
//		ArrayList<AddressOut> category = sService.selectAddCategory(a);
//		
//		mv.addObject("pi", pi);
//		mv.addObject("list", search);
//		mv.addObject("addNo", a.getAddNo());
//		mv.addObject("category", category);
//		mv.addObject("keyword", keyword);
//		
//		if(kind == "basic") {
//			mv.setViewName("addressBook/indivAddressBook");
//		} else {
//			mv.setViewName("addressBook/indivAddressBookDetail");
//		}
//		
//		return mv;
//		
//	}

}
