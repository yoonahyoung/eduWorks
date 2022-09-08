package com.finalProject.eduWorks.board.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.board.model.service.NoticeServiceImpl;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl nService;
	
	/**
	 * 전사공지 리스트 조회
	 * @param currentPage 현재 페이지 전달값
	 * @param mv 
	 * @param cpage 페이지 키값
	 * @param defaultValue 처음 리스트에 들어갈땐 페이지 기본값 1
	 * @return 전사 공지 조회 화면
	 */
	@RequestMapping("list.no")
	public ModelAndView noticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		Member loginUser = new Member("500001", "user02", "pass02", "황재범", "D1", "J3", "010-2222-2223", "2222-2223", "aaaa1112@gmail.com", "1997-01-06", 111111, "111111", "상세주소2", "참고항목2", "2022-08-02", "2022-08-02", "N", "file");
		session.setAttribute("loginUserN", loginUser);
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		HashMap<String,ArrayList<Board>> map = nService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("topList", map.get("topList")).addObject("list", map.get("list")).setViewName("board/noticeListView");
		return mv;
	}
	
	
	/**
	 * 전사 공지 상세 조회
	 * @param no 게시글 번호
	 * @param model
	 * @return 전사 공지 상세 화면
	 */
	@RequestMapping("detail.no")
	public String selectNotice(int no, Model model) {
		
		// 조회수 증가
		int result = nService.increaseCount(no);
		
		if(result > 0) {
			// 게시글 상세 조회
			Board b = nService.selectNotice(no);
			model.addAttribute("b", b);
			
		}else {
			model.addAttribute("alertMsg", "게시글 조회에 실패하였습니다.");
		}
		
		return "board/noticeDetailView";
	}
	
	/**
	 * 댓글 리스트 조회
	 * @param no 게시글 번호
	 * @param model
	 * @return 댓글 리스트
	 */
	@ResponseBody
	@RequestMapping(value="rList.no", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int no) {
		ArrayList<Reply> rList = nService.selectReplyList(no);
		return new Gson().toJson(rList);
	}
	
	@RequestMapping("enrollForm.no")
	public String noticeEnrollForm(Model model) {
		return "board/noticeEnrollForm";
	}
}
