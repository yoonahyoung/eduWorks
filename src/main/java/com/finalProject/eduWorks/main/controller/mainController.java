package com.finalProject.eduWorks.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.main.model.service.mainService;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;
import com.google.gson.Gson;

@Controller
public class mainController {

	@Autowired
	private mainService mService;
	
	/**
	 * 전사공지 리스트 조회
	 * @param currentPage	현재 페이지 전달값
	 * @param mv 
	 * @param cpage 		페이지 키값
	 * @param defaultValue 	처음 리스트에 들어갈땐 페이지 기본값 1
	 * @return 전사 공지 조회 화면
	 */
	@ResponseBody
	@RequestMapping(value="mainList.ma", produces="application/json; charset=utf-8")
	public String selectMainList(@RequestParam(value="cpage", defaultValue="1") int currentPage) {
		int listCount = mService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = mService.selectMainList(pi);
		
		HashMap<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("pi", pi);
		return new Gson().toJson(map);
	}
	
	/**
	 * 부서게시판 리스트 조회
	 * @param currentPage	현재 페이지 전달값
	 * @param mv 
	 * @param cpage 		페이지 키값
	 * @param defaultValue 	처음 리스트에 들어갈땐 페이지 기본값 1
	 * @return 부서 게시판 조회 화면
	 */
	@ResponseBody
	@RequestMapping(value="mainDeptList.ma", produces="application/json; charset=utf-8")
	public String selectMainDeptList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session) {
		int listCount = mService.selectDeptListCount();
		
		String deptCode = ((Member)session.getAttribute("loginUser")).getDeptCode();
	
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Board> list = mService.selectMainDeptList(pi, deptCode);
		HashMap<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("pi", pi);
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="mainMailList.ma", produces="application/json; charset=utf-8")
	public String selectMainMailList(@RequestParam(value="cpage", defaultValue="1") int currentPage, HttpSession session) {

		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		// 로그인한 회원 이메일
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);

		// 받은 메일 개수 조회
		int listCount = mService.receiveMainListCount(m);

		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 7);
		
		// 받은 메일 조회
		ArrayList<Mail> list = mService.selectReceiveMainMailList(pi, m);

		// 안읽은 메일 개수 조회
		int unreadList = mService.receiveMainUnReadCount(m);
		
		
		HashMap<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("pi", pi);
        map.put("unread", unreadList);
        map.put("count", listCount);
		return new Gson().toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value="mainAddressList.ma", produces="application/json; charset=utf-8")
	public String selectMainAddressList(@RequestParam(value="cpage", defaultValue="1") int currentPage) {
		int listCount = mService.selectAddressListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 5);
		ArrayList<Member> list = mService.selectMainAddressList(pi);
		
		HashMap<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("pi", pi);
		return new Gson().toJson(map);
	}
	
	// 전체 검색 페이지
	@RequestMapping("allSearch.ma")
	public ModelAndView allSearchForm(ModelAndView mv, String key, HttpSession session) {
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		// 로그인한 회원 이메일
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		String deptCode = ((Member)session.getAttribute("loginUser")).getDeptCode();
		Mail ma = new Mail();
		ma.setMemNo(memNo);
		ma.setReceiverMem(memEmail);
		HashMap map = new HashMap();
		map.put("key", key);
		map.put("ma", ma);
		
		HashMap bMap = new HashMap();
		bMap.put("key", key);
		bMap.put("deptCode", deptCode);
		
		
		ArrayList<Mail> m = mService.searchMail(map);
		ArrayList<Board> b = mService.searchBoard(bMap);
		ArrayList<Board> n = mService.searchNotice(key);
		ArrayList<Schedule> s = mService.searchSchedule(map);
		
		System.out.println(m);
		
		mv.addObject("mail", m)
		  .addObject("board", b)
		  .addObject("notice", n)
		  .addObject("schedule", s)
		  .addObject("key", key)
		  .setViewName("common/allSearchForm");
		
		return mv;
	}
	
	
	
	
	
	
}
