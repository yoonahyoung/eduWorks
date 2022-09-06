package com.finalProject.eduWorks.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DownloadController {
	
	@RequestMapping("list.do")
	public ModelAndView selectDownloadList(ModelAndView mv) {
		mv.setViewName("board/downloadListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.do")
	public String enrollFormDownload(Model model) {
		return "board/downloadEnrollForm";
	}

}
