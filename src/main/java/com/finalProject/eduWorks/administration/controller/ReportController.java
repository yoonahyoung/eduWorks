package com.finalProject.eduWorks.administration.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.administration.model.service.ReportService;
import com.finalProject.eduWorks.board.model.service.BlindService;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class ReportController {
	@Autowired
	private ReportService rService;
	@Autowired
	private BlindService bService;
	
	/**
	 * 신고 게시글 리스트 조회
	 * @param currentPage
	 * @param mv
	 * @param session
	 * @return 신고 관리 게시판
	 */
	@RequestMapping("reportList.ad")
	public ModelAndView reportList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		int listCount = rService.selectListCount();
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 신고 리스트 조회
		ArrayList<Report> list = rService.selectReportList(pi);
		
		mv.addObject("pi", pi).addObject("list", list);
		
		mv.setViewName("administration/adminReportListView");
		return mv;
	}
	
	/**
	 * 신고 게시판 상세 조회
	 * @param no
	 * @param model
	 * @return 익명 게시글 상세 페이지
	 */
	@RequestMapping("reportDetail.bl")
	public String reportDetail(int no, String rptRefCat, Model model) {
		// 신고 게시판에서 확인용으로 넘어가기 때문에 조회수 증가 x
		if(rptRefCat.equals("댓글")) {
			model.addAttribute("rNo", no); // 댓글 번호 담아두기
			// 댓글이 등록된 게시글 번호 조회
			no = rService.checkReBoardNo(no);
		}
		// 게시글 상세 조회
		Board b = bService.selectBlind(no);
		
		model.addAttribute("b", b);
		model.addAttribute("isReport", 1); // 1이면 true
		
		return "board/blindDetailView";
	}
	
	/**
	 * 게시글 블라인드 처리
	 * @param no		게시글 번호
	 * @param category	1==B처리, 2==Y처리
	 * @param model
	 * @return 성공여부
	 */
	@ResponseBody
	@RequestMapping(value="goBlind.ad", produces="application/json; charset=utf-8")
	public String goBlind(int no, int category, Model model) {
		int result = 0;
		int result1 = 0;
		int rptRefCat = 1;
		
		switch(category) {
		case 1 : result = rService.goBoBlind(no); break; 	// 게시글 블라인드 처리
		case 2 : result = rService.clearBoBlind(no); break;	// 게시글 블라인드 해제
		}
		
		// 신고 처리 여부 Y로 변경
		if(result > 0) {
			result1 = rService.reportStatus(no, rptRefCat); 
		}
		
		return new Gson().toJson(result1);
	}
	
	/**
	 * 댓글 블라인드 처리
	 * @param replyNo	댓글 번호
	 * @param model
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping(value="goReBlind.ad", produces="application/json; charset=utf-8")
	public String goReBlind(int replyNo, Model model) {
		// 댓글 블라인드 처리
		int result = rService.goReBlind(replyNo);
		
		// 신고 처리 여부 Y로 변경
		int result1 = 0;
		int rptRefCat = 2;
		if(result > 0) {
			result1 = rService.reportStatus(replyNo, rptRefCat); 
		}
		return new Gson().toJson(result1);
	}
	
	/**
	 * 신고 처리 여부 변경
	 * @param rptBoardNo 게시글/댓글 번호
	 * @param rptRefCat 게시글/댓글 여부
	 * @return 성공 여부
	 */
	 @ResponseBody
	 @RequestMapping("reportStatus.ad") 
	 public String ajaxReportList(int rptBoardNo, int rptRefCat) {
		 int result = rService.reportStatus(rptBoardNo, rptRefCat); 
		 return new Gson().toJson(result); 
	 }
	 
}
