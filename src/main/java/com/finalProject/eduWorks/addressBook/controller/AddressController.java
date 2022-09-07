package com.finalProject.eduWorks.addressBook.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.addressBook.model.service.AddressServiceImpl;
import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;

@Controller
public class AddressController {
	
	@Autowired
	private AddressServiceImpl aService;
	
	/**
	 * 전사 주소록 페이지 이동
	 * @return : 전사 주소록 페이지
	 */
	@RequestMapping("publicAddress.ad")
	public String publicAddressBook(Model model) {
		return "addressBook/publicAddressBook";
	}
	
	@RequestMapping("individualAddress.ad")
	public ModelAndView individualAddressBook(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		ArrayList<Address> list = aService.selectList(pi);
		s
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		
		mv.setViewName("addressBook/individualAddressBook");
		
		return mv;
		
	}

}
