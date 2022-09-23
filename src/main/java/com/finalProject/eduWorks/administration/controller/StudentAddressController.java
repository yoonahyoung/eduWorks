package com.finalProject.eduWorks.administration.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
		String keyword = "";
		String chkDate = "";
		int listCount = sService.selectListStCount(keyword, chkDate);
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		// 학생 조회
		ArrayList<Student> list = sService.selectStAddressList(pi, keyword, chkDate);
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
	public ModelAndView selectTeAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage,  ModelAndView mv, HttpSession session) {
		String keyword = "";
		String chkDate = "";
		String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();		
		// 페이징 처리
		int listCount = sService.selectListTeCount(memNo, keyword, chkDate);
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 학생 조회
		ArrayList<Student> list = sService.selectTeAddressList(pi, memNo, keyword, chkDate);
		mv.addObject("pi", pi).addObject("list", list).setViewName("teacher/studentAddressBookView");
		
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
	
	/**
	 * 학생 주소록 검색/분류 (전체, 강사 통합 처리)
	 * @param keyword	검색값
	 * @param chkDate	최신순/오래된순
	 * @param page		현재 페이지
	 * @param memNo		강사 번호
	 * @param isTeacher	0 = 전체 / 1 = 강사
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="option.st", produces="application/json; charset=utf-8")
	public String teAdOptionList(String keyword, String chkDate, int page, String memNo, int isTeacher) {
		ArrayList<Student> list = new ArrayList<>();
		HashMap<String, Object> map = new HashMap<>();
		PageInfo pi = null;
		
		if(isTeacher == 1) { // 강사 학생 주소록 검색 및 옵션 처리
			// 페이징 처리
			int listCount = sService.selectListTeCount(memNo, keyword, chkDate);
			pi = Pagination.getInfo(listCount, page, 10, 10);
			
			// 학생 조회
			list = sService.selectTeAddressList(pi, memNo, keyword, chkDate);
		}else { // 전체 학생 주소록 검색 및 옵션 처리
			int listCount = sService.selectListStCount(keyword, chkDate);
			pi = Pagination.getInfo(listCount, page, 10, 10);
			
			// 학생 조회
			list = sService.selectStAddressList(pi, keyword, chkDate);
		}
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
		
	}
	

}
