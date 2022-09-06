package com.finalProject.eduWorks.promotion.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.promotion.model.service.PromotionService;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;

@Controller
public class PromotionController {
	
	@Autowired
	private PromotionService pService;
	
	@RequestMapping("list.pr")
	public ModelAndView selectPromoList(@RequestParam(value="ppage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 3, 5);
		ArrayList<Promotion> list = pService.selectPromoList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("promotion/promotionListView");
		  
		return mv;
	}

}
