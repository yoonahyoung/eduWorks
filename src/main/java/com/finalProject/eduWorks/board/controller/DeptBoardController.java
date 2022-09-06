package com.finalProject.eduWorks.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DeptBoardController {
	
//	@Autowired
//	private DeptBoardServiceImpl dService;
	
	@RequestMapping("list.de")
	public ModelAndView selectDeptBoardList(ModelAndView mv) {
		mv.setViewName("board/deptBoardListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.de")
	public String enrollFormDeptBoard(Model model) {
		return "board/deptBoardEnrollForm";
	}

}
