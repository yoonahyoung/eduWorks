package com.finalProject.eduWorks.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BlindController {

	@RequestMapping("list.bl")
	public ModelAndView selectBlindList(ModelAndView mv) {
		mv.setViewName("board/blindListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.bl")
	public String enrollFormBlind(Model model) {
		return "board/blindEnrollForm";
	}
}
