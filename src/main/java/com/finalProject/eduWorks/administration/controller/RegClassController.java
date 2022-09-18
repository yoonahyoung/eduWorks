package com.finalProject.eduWorks.administration.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.administration.model.service.RegClassService;
import com.finalProject.eduWorks.administration.model.vo.RegClass;
import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class RegClassController {
	
	@Autowired
	private RegClassService rService;
	
	/**
	 * 수강 신청 관리 화면 조회
	 * @param mv
	 * @return 수강 신청 관리 화면
	 */
	@RequestMapping("list.rc") 
	public ModelAndView selectRegClassList(@RequestParam(value="cpage", defaultValue="1") int currentPage, 
										   @RequestParam(value="regStatus", defaultValue="1") String regStatus, ModelAndView mv) {
		// 페이징 처리
		int listCount = rService.selectListCount(regStatus);
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 5, 5);
		// 강의 신청 조회
		ArrayList<RegClass> list = rService.selectList(pi, regStatus);
		mv.addObject("pi", pi).addObject("list", list).addObject("regStatus", regStatus).setViewName("administration/adminRegClassList");
		
		return mv;
	}
	
	/**
	 * 수강 승인 처리
	 * @param regNo	수강 신청 번호
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping("update.rc")
	public String updateRegClass(int regNo, Model model) {
		int result = rService.updateRegClass(regNo);
		model.addAttribute("alertIcon", "success");
		model.addAttribute("alertTitle", "승인 처리 완료!");
		model.addAttribute("alertMsg", "수강 신청이 승인 처리 되었습니다");
		return new Gson().toJson(result);
	}
	
	/**
	 * 수강 반려 처리
	 * @param r	수강 신청 번호, 반려 사유
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping("return.rc")
	public String returnRegClass(RegClass r) {
		int result = rService.returnRegClass(r);
		return new Gson().toJson(result);
	}
}
