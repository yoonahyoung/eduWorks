package com.finalProject.eduWorks.addressBook.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.addressBook.model.service.AddressServiceImpl;
import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class AddressController {
	
	@Autowired
	private AddressServiceImpl aService;
	
	/**
	 * 1. 공용 주소록 페이지 이동
	 * @return : 공용 주소록 페이지
	 */
	@RequestMapping("publicAddress.ad")
	public ModelAndView publicAddressList(@RequestParam(value="page", defaultValue="1") int currentPage, @RequestParam(value="range", defaultValue="oldest") String range,  ModelAndView mv) {
		
		// 공용 주소록 전체 갯수 조회
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 공용 주소록 목록 조회
		ArrayList<Member> list = aService.selectAddressList(pi, range);

		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("range", range);
				
		mv.setViewName("addressBook/publicAddressBook");
		
		return mv;
		
	}
	
	/**
	 * 2. 개인 주소록 페이지 이동 (개인주소록 첫 페이지)
	 * @return : 개인 주소록 페이지
	 */
	@RequestMapping("individualAddress.ad")
	public ModelAndView individualAddressBook(@RequestParam(value="page", defaultValue="1") int currentPage, @RequestParam(value="range", defaultValue="oldest") String range, ModelAndView mv, String memNo, HttpSession session) {
		
		// 개인 주소록 기본('개인주소록') 번호 조회
		String basicAddNum = String.valueOf(aService.basicAddressNum(memNo));

		// 개인 주소록 기본 연락처 목록 조회
		Address a = new Address();
		a.setMemNo(memNo);
		a.setAddNo(basicAddNum);
		
		// 개인 기본 주소록에 들어가는 사람 수 조회
		int count = aService.selectIndivNumCount(a);

		// 페이징
		PageInfo pi = Pagination.getInfo(count, currentPage, 10, 10);
		
		ArrayList<Address> list = aService.selectAddIndivList(pi, a, range);
		
		// 개인 주소록 카테고리 목록 조회
		ArrayList<AddressOut> category = aService.selectAddCategory(a);
				
		mv.addObject("addNo", basicAddNum); // 개인주소록 번호
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("range", range);
		mv.addObject("category", category);
		
		mv.setViewName("addressBook/individualAddressBook");
		
		return mv;
		
	}
		
	/**
	 * 3. 개인 주소록 그룹 추가
	 * @param ado : 로그인한 회원 번호, 추가하고자하는 그룹 명
	 * @return : 그룹 추가 성공 여부가 담긴 int형 변수 (성공 : 1 : 실패 : 0)
	 */
	@ResponseBody
	@RequestMapping("insertAddIndiv.ad")
	public String ajaxInsertAddIndiv(AddressOut ado) {
		
		int result = aService.ajaxInsertAddIndiv(ado);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 4. 개인 주소록 그룹 중 선택한 페이지로 이동
	 * @param a : 로그인한 회원 아이디, 개인 주소록 번호
	 * @return : 선택한 개인 주소록 그룹 페이지 정보
	 */
	@RequestMapping("indivAddressBook.ad")
	public ModelAndView individualAddressBook(@RequestParam(value="page", defaultValue="1") int currentPage, @RequestParam(value="range", defaultValue="oldest") String range, ModelAndView mv, Address a) {
		
		// 해당 개인주소록에 등록된 연락처 수 조회
		int listCount = aService.selectIndivNumCount(a);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 해당 개인주소록에 등록된 연락처 목록 조회
		ArrayList<Address> list = aService.selectAddIndivList(pi, a, range);
		
		// 개인 주소록 카테고리 목록 조회
		ArrayList<AddressOut> category = aService.selectAddCategory(a);
		
		mv.addObject("addNo", a.getAddNo()); // 개인 주소록 그룹 중 선택한 그룹 번호
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("range", range);
		mv.addObject("category", category);
		
		mv.setViewName("addressBook/indivAddressBookDetail");
		
		return mv;
		
	}
	
	/**
	 * 4. 개인 주소록 그룹 중 선택한 그룹에 연락처 등록
	 * @param a : 연락처 정보
	 * @return : 등록 성공 여부 (성공 : success | 실패 : fail)
	 */
	@ResponseBody
	@RequestMapping("insertAddIndivNum.ad")
	public String ajaxInsertAddIndivNum(Address a) {

		int result = aService.insertAddIndivNum(a);
		
		return result > 0 ? "success" : "fail";
		
	}
		
	/**
	 * 5. 개인 주소록 그룹 및 연락처들 삭제
	 * @param a : 로그인한 회원, 주소록 그룹 번호
	 * @return : 삭제 여부가 담긴 String 변수 (성공 : success : 실패 : fail)
	 */
	@ResponseBody
	@RequestMapping("deleteAllIndivAddBook.ad")
	public String ajaxDeleteIndivAddBook(Address a) {
				
		// 삭제할 연락처 갯수 조회
		int count = aService.selectIndivNumCount(a);

		// 삭제된 그룹에 들어가있는 연락처들 삭제
		int result1 = 1;
		if(count > 0) {
			result1 = aService.deleteAllIndivAddNum(a);
		}

		// 주소록 그룹 삭제
		int result2 = aService.deleteIndivAddressBook(a);
		
		int total = result1 * result2;
		
		return total > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 6. 선택한 연락처 삭제 
	 * @param addPerNo : 선택한 연락처 번호
	 * @return : 삭제 성공 여부 (성공 : sucess | 실패 : fail)
	 */
	@ResponseBody
	@RequestMapping("deleteAddNum.ad")
	public String ajaxDeleteIndivAddNum(String addPerNo) {

		int result = aService.deleteIndivAddNum(addPerNo);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 7_1. 선택한 연락처 정보 조회
	 * @param addPerNo : 선택한 연락처 번호
	 * @return : 선택한 연락처 정보
	 */
	@ResponseBody
	@RequestMapping(value="selectAddInfo.ad", produces="application/json; charset=UTF-8")
	public String ajaxSelectAddInfo(String addPerNo) {

		Address a = aService.ajaxSelectAddInfo(addPerNo);
		
		return new Gson().toJson(a);
		
	}
	
	/**
	 * 7_2. 선택한 연락처 정보 수정
	 * @param a : 수정된 연락처 정보
	 * @return : 수정 성공 여부 (성공 : success | 실패 : fail)
	 */
	@ResponseBody
	@RequestMapping("updateIndivAdd.ad")
	public String ajaxUpdateIndivAddress(Address a, HttpSession session) {
		
		int result = aService.updateIndivAddress(a);

		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 8_1. 연락처 검색 (개인 주소록)
	 * @param kind : 페이지 종류
	 * @param keyword : 검색 키워드
	 * @param a : 로그인한 회원 아이디, 주소록 그룹
	 * @return : 검색 목록, 페이지 종류
	 */
	@RequestMapping("searchIndivAdd.ad")
	public ModelAndView ajaxSeacrhIndivAdd(@RequestParam(value="page", defaultValue="1") int currentPage, @RequestParam(value="range", defaultValue="oldest") String range, ModelAndView mv, String kind, String keyword, Address a) {

		// 연락처 조회시 나오는 연락처 수 조회
		int searchCount = aService.searchIndivCount(keyword, a);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(searchCount, currentPage, 10, 10);
		
		// 연락처 조회시 나오는 연락처 목록 조회
		ArrayList<Address> search = aService.searchIndivAdd(pi, keyword, a, range);
		
		// 개인 주소록 카테고리 목록 조회
		ArrayList<AddressOut> category = aService.selectAddCategory(a);
		
		mv.addObject("pi", pi);
		mv.addObject("list", search);
		mv.addObject("addNo", a.getAddNo());
		mv.addObject("category", category);
		mv.addObject("keyword", keyword);
		
		if(kind == "basic") {
			mv.setViewName("addressBook/indivAddressBook");
		} else {
			mv.setViewName("addressBook/indivAddressBookDetail");
		}
		
		return mv;
		
	}
	
	/**
	 * 8_2. 연락처 검색 (전사 주소록)
	 * @param keyword : 검색 키워드
	 * @return : 검색 목록
	 */
	@RequestMapping("searchPublicAdd.ad")
	public ModelAndView searchPublicAdd(@RequestParam(value="page", defaultValue="1") int currentPage, @RequestParam(value="range", defaultValue="oldest") String range, ModelAndView mv, String keyword) {

		// 연락처 조회시 나오는 연락처 수 조회
		int searchCount = aService.searchPublicCount(keyword);
				
		// 페이징
		PageInfo pi = Pagination.getInfo(searchCount, currentPage, 10, 10);
				
		// 연락처 조회시 나오는 연락처 목록 조회
		ArrayList<Member> search = aService.searchPublicAdd(pi, keyword, range);
				
		mv.addObject("pi", pi);
		mv.addObject("list", search);
		mv.addObject("keyword", keyword);
		mv.addObject("range", range);
		
		mv.setViewName("addressBook/publicAddressBook");
		
		return mv;
		
	}
	
}
