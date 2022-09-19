package com.finalProject.eduWorks.administration.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.administration.model.service.LectureService;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;
	
	// 승인된 강의 리스트
	@RequestMapping("doneList.cl")
	public ModelAndView adminLectureList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv){
		
		int listCount = lService.selectAdminListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Teacher> list = lService.adminLectureList(pi);
		
		for(int i=0; i<list.size(); i++) {
			switch(list.get(i).getClassApproval()){
			case "1": list.get(i).setClassApproval("대기중"); break;
			case "2": list.get(i).setClassApproval("승인"); break;
			case "3": list.get(i).setClassApproval("보류"); break;
			}
		}
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("administration/adminLectureList");
		
		return mv;
	}
	
	// 보류, 대기중인 강의 리스트
	@RequestMapping("appList.cl")
	public ModelAndView adminAppLectureList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv){
		
		int listCount = lService.selectAppListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Teacher> list = lService.adminAppLectureList(pi);
		
		for(int i=0; i<list.size(); i++) {
			switch(list.get(i).getClassApproval()){
			case "1": list.get(i).setClassApproval("대기중"); break;
			case "2": list.get(i).setClassApproval("승인"); break;
			case "3": list.get(i).setClassApproval("반려"); break;
			}
		}
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("administration/adminAppLectureList");
		
		return mv;
	}
	
	// 승인된 강의 상세페이지
	@RequestMapping("doneDetail.cl")
	public ModelAndView adminLectureDetailSelect(int no, ModelAndView mv, HttpSession session) {
		
		Teacher t = lService.adminLectureDetailSelect(no);
		
		
		if(t != null) {
			mv.addObject("t", t).setViewName("administration/adminLectureDetail");
			
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "조회 실페");
			session.setAttribute("alertMsg", "페이지 조회를 실패하였습니다.");
			mv.setViewName("administration/adminLectureList");
		}
		return mv;
	}
	
	// (행정) 승인된 강의 수정 페이지 이동
	@RequestMapping("donUpdateForm.cl")
	public ModelAndView adminLectureUpdateForm(int no, ModelAndView mv) {
		
		ArrayList<Member> list = lService.teacherList();
		mv.addObject("t", lService.adminLectureDetailSelect(no)).setViewName("administration/adminLectureUpdate");
		mv.addObject("list", list).setViewName("administration/adminLectureUpdate");
		return mv;
	}
	
	// (행정) 승인된 강의 수정
	@RequestMapping("donUpdate.cl")
	public String adminLectureUpdate(Teacher t, HttpSession session) {
		
		int result = lService.adminLectureUpdate(t);
			
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "수정 성공");
			session.setAttribute("alertMsg", "강의 수정을 성공하였습니다.");
			return "redirect:doneDetail.cl?no=" + t.getClassNo();
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "수정 실페");
			session.setAttribute("alertMsg", "강의 수정을 실패하였습니다.");
			return "redirect:doneDetail.cl?no=" + t.getClassNo();
		}
	}
	
	// (행정) 승인된 강의 삭제
	@RequestMapping("doneDelete.cl")
	public String adminLectureDelete(int no, HttpSession session) {
		
		int result = lService.adminLectureDelete(no);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "삭제 성공");
			session.setAttribute("alertMsg", "강의 삭제를 성공하였습니다.");
			return "redirect:doneList.cl";
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "삭제 실페");
			session.setAttribute("alertMsg", "강의 삭제를 실패하였습니다.");
			return "redirect:doneDetail.cl?no=" + no;
		}
	}
	
	// (행정) 대기중, 반려된 강의 상세패이지
	@RequestMapping("appDetail.cl")
	public ModelAndView adminAppLectureDetailSelect(int no, ModelAndView mv, HttpSession session) {
			
			Teacher t = lService.adminAppLectureDetailSelect(no);
			if(t != null) {
				mv.addObject("t", t).setViewName("administration/adminAppLectureDetail");
				
			}else {
				session.setAttribute("alertIcon", "error");
				session.setAttribute("alertTitle", "조회 실페");
				session.setAttribute("alertMsg", "페이지 조회를 실패하였습니다.");
				mv.setViewName("administration/adminAppLectureList");
			}
			return mv;
		}
	
	// (행정) 대기중, 반려된 강의 상세페이지에서 강의 상태 변경
	@RequestMapping("appStatus.cl")
	public String appLectureStatus(Teacher t, HttpSession session) {
		
		int result = lService.appLectureStatus(t);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "변경 성공");
			session.setAttribute("alertMsg", "강의 상태 변경을 성공하였습니다.");
			return "redirect:appList.cl";
		}else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "변경 실페");
			session.setAttribute("alertMsg", "강의 상태 변경을 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
