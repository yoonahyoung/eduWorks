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
import com.finalProject.eduWorks.member.model.vo.Member;

@Controller
public class AddressController {
	
	@Autowired
	private AddressServiceImpl aService;
	
	/**
	 * 공용 주소록 페이지 이동
	 * @return : 공용 주소록 페이지
	 */
	@RequestMapping("publicAddress.ad")
	public ModelAndView publicAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		// 공용 주소록 전체 갯수 조회
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 공용 주소록 목록 조회
		ArrayList<Member> list = aService.selectAddressList(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		
		System.out.println(pi);
		
		mv.setViewName("addressBook/publicAddressBook");
		
		return mv;
		
	}
	
	/**
	 * 개인 주소록 페이지 이동
	 * @return : 개인 주소록 페이지
	 */
	@RequestMapping("individualAddress.ad")
	public ModelAndView individualAddressBook(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
//		int listCount = aService.selectListCount();
//		
//		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
//		ArrayList<Address> list = aService.selectList(pi);
//		
//		mv.addObject("pi", pi);
//		mv.addObject("list", list);
		
		mv.setViewName("addressBook/individualAddressBook");
		
		return mv;
		
	}

}
