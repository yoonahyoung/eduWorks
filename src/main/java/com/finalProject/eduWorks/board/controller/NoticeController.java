package com.finalProject.eduWorks.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.board.model.service.NoticeServiceImpl;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl nService;
	
	@RequestMapping("list.no")
	public ModelAndView noticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
//		int listCount = nService.selectListCount();
//		
//		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
//		ArrayList<Board> list = nService.selectList(pi);
//		
//		mv.addObject("pi", pi);
//		mv.addObject("list", list);
		
		mv.setViewName("board/noticeListView");
		
		return mv;
	}
	
	@RequestMapping("enrollForm.no")
	public String noticeEnrollFOrm(Model model) {
		return "board/noticeEnrollForm";
	}
	
	
	
}
