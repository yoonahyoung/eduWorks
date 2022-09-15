package com.finalProject.eduWorks.administration.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.administration.model.service.LectureService;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.teacher.model.vo.Teacher;

@Controller
public class LectureController {

	@Autowired
	private LectureService lService;
	
	@RequestMapping("doneList.cl")
	public ModelAndView adminLectureList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv){
		
		int listCount = lService.selectAdminListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Teacher> list = lService.adminLectureList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("administration/adminLectureList");
		
		return mv;
	}
	
	@RequestMapping("appList.cl")
	public ModelAndView adminAppLectureList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv){
		
		int listCount = lService.selectAppListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Teacher> list = lService.adminAppLectureList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("administration/adminAppLectureList");
		
		return mv;
	}
	
}
