package com.finalProject.eduWorks.addressBook.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddressController {
	
	/**
	 * 전사 주소록 페이지 이동
	 * @return : 전사 주소록 페이지
	 */
	@RequestMapping("publicAddress.ad")
	public String publicAddressBook(Model model) {
		return "addressBook/publicAddressBook";
	}
	
	@RequestMapping("individualAddress.ad")
	public String individualAddressBook(Model model) {
		return "addressBook/individualAddressBook";
	}

}
