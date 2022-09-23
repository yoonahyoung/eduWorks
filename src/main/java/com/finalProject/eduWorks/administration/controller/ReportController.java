package com.finalProject.eduWorks.administration.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.finalProject.eduWorks.administration.model.service.ReportService;
import com.finalProject.eduWorks.board.model.service.BlindService;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.handler.ReplyEchoHandler;
import com.finalProject.eduWorks.common.model.service.AlarmService;
import com.finalProject.eduWorks.common.model.vo.AlarmData;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class ReportController {
	@Autowired
	private ReportService rService;
	@Autowired
	private BlindService bService;
	@Autowired
	private AlarmService aService;
	@Autowired
	private ReplyEchoHandler replyEcho;
	
	//private String rptNoList; // rptNo 저장하기 위한 변수
	
	/**
	 * 신고 게시글 리스트 조회
	 * @param currentPage
	 * @param mv
	 * @param session
	 * @return 신고 관리 게시판
	 */
	@RequestMapping("reportList.ad")
	public ModelAndView reportList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		String rCount = "desc"; // 신고 많은순
		String rStatus = ""; 	// 미처리
		int listCount = rService.selectListCount(rCount, rStatus);
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 신고 리스트 조회
		ArrayList<Report> list = rService.selectReportList(pi, rCount, rStatus);
		
		mv.addObject("pi", pi).addObject("list", list);
		System.out.println(list);
		mv.setViewName("administration/adminReportListView");
		return mv;
	}
	
	/**
	 * 신고 게시판 상세 조회
	 * @param no		게시글/댓글 번호
	 * @param rptRefCat 신고 카테고리(게시글/댓글)
	 * @param rptNoStr 신고 번호(,로 이어진)
	 * @param model
	 * @return 익명 게시글 상세 페이지
	 */
	@RequestMapping("reportDetail.bl")
	public ModelAndView reportDetail(int no, int rptRefCat, String rptNoStr, ModelAndView mv) {
		//rptNoList = rptNoStr;
		System.out.println(rptNoStr);
		// 신고 게시판에서 확인용으로 넘어가기 때문에 조회수 증가 x
		if(rptRefCat == 2) {
			mv.addObject("rNo", no); // 댓글 번호 담아두기
			// 댓글이 등록된 게시글 번호 조회
			no = rService.checkReBoardNo(no);
			System.out.println(no);
		}
		System.out.println(no);
		// 게시글 상세 조회
		Board b = bService.selectBlind(no);
		
		mv.addObject("b", b);
		System.out.println(b);
		mv.addObject("isReport", 1); // 1이면 true
		mv.addObject("rptNoStr", rptNoStr); // 신고자 목록 불러오기 위해서 뿌려줌
		mv.setViewName("board/blindDetailView");
		
		return mv;
	}
	
	/**
	 * 게시글 블라인드 처리
	 * @param no		게시글 번호
	 * @param category	1==B처리, 2==Y처리
	 * @param model
	 * @return 성공여부
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="goBlind.ad", produces="application/json; charset=utf-8")
	public String goBlind(int rptBoardNo, int category, String rptNoStr, Model model) throws IOException {
		int result = 0;
		int result1 = 1;
		int rptRefCat = 1;
		
		switch(category) {
		case 1 : result = rService.goBoBlind(rptBoardNo); break; 	// 게시글 블라인드 처리
		case 2 : result = rService.clearBoBlind(rptBoardNo); break;	// 게시글 블라인드 해제
		}
		
		// 신고 처리 여부 Y로 변경
		if(result > 0) {
			System.out.println("신고처리 if문 들어옴");
			
			// 신고자 리스트 구하기
			ArrayList<Report> list = rService.selectTargets(rptNoStr, rptRefCat); 
			System.out.println(rptNoStr);
			System.out.println(list);
			// 신고처리 여부 Y로 변경
			rService.reportStatus(rptNoStr); 
			
			// websocket을 이용해서 알람 전송 (즉, target한테 sendMessage())
			for(Report r : list) {
				System.out.println("for문들어옴");
				Map<String, WebSocketSession> userSessions = replyEcho.getUserSessions();
				
				AlarmData alarm = new AlarmData();
				alarm.setCmd("2");
				alarm.setBoardNo(r.getRptBoardNo() + "");
				alarm.setBoardWriter(r.getRptMemNo());
				
				String alarmContent = "[" + r.getBoardTitle() + "] " + (r.getRptRefCat() == 1 ? "게시글" : "댓글") + "에 대한 신고 제재가 완료되었습니다.";
				alarm.setAlarmContent(alarmContent);
				System.out.println("알람 인설트");
				result1 *= aService.insertAlarm(alarm);
				
				WebSocketSession targetClient = userSessions.get(r.getRptMemNo());
				
				if(targetClient != null) {
					targetClient.sendMessage(new TextMessage(alarmContent));
				}
			}
			System.out.println(result1);
		}
		
		return new Gson().toJson(result1);
	}
	
	/**
	 * 댓글 블라인드 처리
	 * @param replyNo	댓글 번호
	 * @param model
	 * @return 성공 여부
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="goReBlind.ad", produces="application/json; charset=utf-8")
	public String goReBlind(int replyNo, String rptNoStr, Model model) throws IOException {
		// 댓글 블라인드 처리
		int result = rService.goReBlind(replyNo);
		int result1 = 0;
		int rptRefCat = 2;
		
		// 신고 처리 여부 Y로 변경
		if(result > 0) {
			System.out.println("신고처리 if문 들어옴");
			
			// 신고자 리스트 구하기
			ArrayList<Report> list = rService.selectTargets(rptNoStr, rptRefCat); 
			System.out.println(rptNoStr);
			System.out.println(list);
			// 신고처리 여부 Y로 변경
			rService.reportStatus(rptNoStr); 
			
			// websocket을 이용해서 알람 전송 (즉, target한테 sendMessage())
			for(Report r : list) {
				
				Map<String, WebSocketSession> userSessions = replyEcho.getUserSessions();
				
				AlarmData alarm = new AlarmData();
				alarm.setCmd("2");
				alarm.setBoardNo(replyNo + "");
				alarm.setBoardWriter(r.getRptMemNo());
				
				String alarmContent = "[" + r.getBoardTitle() + "] " + (r.getRptRefCat() == 1 ? "게시글" : "댓글") + "에 대한 신고 제재가 완료되었습니다.";
				alarm.setAlarmContent(alarmContent);
				
				result1 *= aService.insertAlarm(alarm);
				
				WebSocketSession targetClient = userSessions.get(r.getRptMemNo());
				
				if(targetClient != null) {
					targetClient.sendMessage(new TextMessage(alarmContent));
				}
			}
			System.out.println(result1);
		}
		return new Gson().toJson(result1);
	}
	
	/**
	 * 신고 처리 여부 변경
	 * @param rptBoardNo 게시글/댓글 번호
	 * @param rptRefCat 게시글/댓글 여부
	 * @return 성공 여부
	 * @throws IOException 
	 */
	 @ResponseBody
	 @RequestMapping("reportStatus.ad") 
	 public String ajaxReportList(String rptNoStr, int rptBoardNo, int rptRefCat) throws IOException {
		// 신고자 리스트 구하기
		ArrayList<Report> list = rService.selectTargets(rptNoStr, rptRefCat); 
		System.out.println(rptNoStr);
		System.out.println(list);
		// 신고처리 여부 Y로 변경
		int result = rService.reportStatus(rptNoStr); 
		int result1 = 0;
		
		if(result > 0) {
			// websocket을 이용해서 알람 전송 (즉, target한테 sendMessage())
			for(Report r : list) {
				
				Map<String, WebSocketSession> userSessions = replyEcho.getUserSessions();
				
				AlarmData alarm = new AlarmData();
				alarm.setCmd("2");
				alarm.setBoardNo(rptBoardNo + "");
				alarm.setBoardWriter(r.getRptMemNo());
				
				String alarmContent = "[" + r.getBoardTitle() + "] " + (r.getRptRefCat() == 1 ? "게시글" : "댓글") + "에 대한 신고 제재가 완료되었습니다.";
				alarm.setAlarmContent(alarmContent);
				
				result1 *= aService.insertAlarm(alarm);
				
				WebSocketSession targetClient = userSessions.get(r.getRptMemNo());
				
				if(targetClient != null) {
					targetClient.sendMessage(new TextMessage(alarmContent));
				}
				System.out.println(result1);
			}
		}
		
		 return new Gson().toJson(result); 
	 }
	 
	 /**
	  * 신고 분류에 따른 리스트
	  * @param page		현재 페이지
	  * @param rCount	신고 많은 순/적은 순
	  * @param rStatus	신고 처리 여부
	  * @return 
	  */
	 @ResponseBody
	 @RequestMapping(value="option.re", produces="application/json; chatset=utf-8")
	 public String optionReport(int page, String rCount, String rStatus) {
		 int listCount = rService.selectListCount(rCount, rStatus);
		 PageInfo pi = Pagination.getInfo(listCount, page, 10, 10);
		 
		 ArrayList<Report> list = rService.selectReportList(pi, rCount, rStatus);
		 
		 HashMap<String, Object> map = new HashMap<>();
		 map.put("pi", pi);
		 map.put("list", list);
		 return new Gson().toJson(map);
	 }
}
