package com.finalProject.eduWorks.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.board.model.service.DeptBoardServiceImpl;

@Controller
public class DeptBoardController {
	
//	@Autowired
//	private DeptBoardServiceImpl dService;
	
	@RequestMapping("list.de")
	public ModelAndView selectDeptBoardList(ModelAndView mv) {
		mv.setViewName("board/deptBoardListView");
		return mv;
	}

}
