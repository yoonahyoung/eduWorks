package com.finalProject.eduWorks.board.controller;

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

import com.finalProject.eduWorks.board.model.service.BlindServiceImpl;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Like;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.handler.ReplyEchoHandler;
import com.finalProject.eduWorks.common.model.service.AlarmService;
import com.finalProject.eduWorks.common.model.vo.AlarmData;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class BlindController {
	
	@Autowired
	private BlindServiceImpl bService;
	
	@Autowired
	private AlarmService aService;
	
	@Autowired
	private ReplyEchoHandler replyEcho;

	/**
	 * 익명 게시판 리스트 조회
	 * @param currentPage	현재 페이지 전달값
	 * @param mv 
	 * @param cpage 		페이지 키값
	 * @param defaultValue 	처음 리스트에 들어갈땐 페이지 기본값 1
	 * @return 익명 게시판 조회 화면
	 */
	@RequestMapping("list.bl")
	public ModelAndView selectBlindList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		// 글 리스트 조회
		ArrayList<Board> list = bService.selectBlindList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("board/blindListView");
		return mv;
	}
	
	/**
	 * 추천 수 조회
	 * @param model
	 * @return 추천 정보
	 */
	@ResponseBody
	@RequestMapping(value="likeCount.bl", produces="application/json; charset=utf-8")
	public String ajaxLikeCount() {
		// 추천수 조회
		ArrayList<Like> like = bService.likeCount();
		
		// 페이징 처리의 끝페이지를 listCount로 처리
		int listCount = bService.selectListCount();
		PageInfo pi = Pagination.getInfo(listCount, 1, listCount, listCount);
		// 글 리스트 조회
		ArrayList<Board> list = bService.selectBlindList(pi);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("like", like);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * 댓글 수 조회
	 * @param model
	 * @return 추천 정보
	 */
	@ResponseBody
	@RequestMapping(value="replyCount.bl", produces="application/json; charset=utf-8")
	public String ajaxReplyCount() {
		// 댓글 수 조회
		ArrayList<Reply> reply = bService.replyCount();
		
		// 페이징 처리의 끝페이지를 listCount로 처리
		int listCount = bService.selectListCount();
		PageInfo pi = Pagination.getInfo(listCount, 1, listCount, listCount);
		// 글 리스트 조회
		ArrayList<Board> list = bService.selectBlindList(pi);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("reply", reply);
		map.put("list", list);
		
		return new Gson().toJson(map);
	}
	
	/**
	 * 익명 게시판 상세 조회
	 * @param no 	게시글 번호
	 * @param model
	 * @return 익명 게시판 상세 화면
	 */
	@RequestMapping("detail.bl")
	public String selectBlind(int no, Model model) {
		
		// 조회수 증가
		int result = bService.increaseCount(no);
		
		if(result > 0) {
			// 게시글 상세 조회
			Board b = bService.selectBlind(no);
			
			model.addAttribute("b", b);
		}else {
			model.addAttribute("alertMsg", "게시글 조회에 실패하였습니다.");
		}
		
		return "board/blindDetailView";
	}
	
	/**
	 * 추천 조회
	 * @param model
	 * @return 추천 정보
	 */
	@ResponseBody
	@RequestMapping(value="selectLike.bl", produces="application/json; charset=utf-8")
	public String ajaxSelectLike(Like l) {
		// 추천 조회
		ArrayList<Like> like = bService.selectLike(l);
		return new Gson().toJson(like);
	}
	
	/**
	 * 추천하기
	 * @param model
	 * @return 추천 정보
	 */
	@ResponseBody
	@RequestMapping(value="insertLike.bl", produces="application/json; charset=utf-8")
	public String ajaxInsertLike(Like l) {
		// 추천 등록
		int result = bService.insertLike(l);
		return new Gson().toJson(result);
	}
	
	/**
	 * 추천삭제
	 * @param model
	 * @return 추천 정보
	 */
	@ResponseBody
	@RequestMapping(value="deleteLike.bl", produces="application/json; charset=utf-8")
	public String ajaxDeleteLike(Like l) {
		// 추천 삭제
		int result = bService.deleteLike(l);
		return new Gson().toJson(result);
	}
	
	/**
	 * 댓글 리스트 조회
	 * @param no 	게시글 번호
	 * @param model
	 * @return 댓글 리스트
	 */
	@ResponseBody
	@RequestMapping(value="rList.bl", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int no) {
		ArrayList<Reply> rList = bService.selectReplyList(no);
		return new Gson().toJson(rList);
	}
	
	/**
	 * 익명 아이디 중복 여부 check
	 * @param r 	참조 글번호, 사용자가 입력 요청한 익명 아이디
	 * @return 댓글 전체 정보
	 */
	@ResponseBody
	@RequestMapping(value="checkReId.bl", produces="application/json; charset=utf-8")
	public String ajaxCheckReId(Reply r) {
		int result = bService.checkReplyId(r);
		return new Gson().toJson(result);
	}
	
	/**
	 * 댓글 등록
	 * @param no 			참조 게시글 번호
	 * @param replyDepth 	댓글 깊이
	 * @param replyParent 	부모 댓글 번호
	 * @param replyContent 	댓글 내용
	 * @param session
	 * @param model
	 * @return 성공여부
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping("insertRe.bl")
	public String ajaxInsertReply(Reply r, HttpSession session, Model model) throws IOException {
		// 참조게시글번호, 댓글깊이(0/1), 참조댓글번호(0/숫자), 댓글작성자사번
		
		int result = bService.insertReply(r);
		
		// websocket을 이용해서 알람 전송 (즉, target한테 sendMessage())
		Map<String, WebSocketSession> userSessions = replyEcho.getUserSessions();
		
		// 알람테이블에 insert
		// 원댓글일경우 즉, 댓글깊이가 0일경우 => 1행 insert
		// 대댓글일경우 즉, 댓글깊이가 1일경우 => 2행 insert
		Board b = bService.selectBlind(r.getReBoardNo()); // 게시글번호, 게시글작성자사번, 게시글제목
		
		AlarmData alarm = new AlarmData();
		alarm.setCmd("1");
		alarm.setBoardNo(b.getBoardNo()+"");
		alarm.setBoardWriter(b.getBoardWriter()+"");
		
		String alarmContent = "[" + b.getBoardTitle() + "] 게시글에 " + ( r.getReplyDepth() == 0 ? "댓글이 달렸습니다." : "대댓글이 달렸습니다." ) ;
		alarm.setAlarmContent(alarmContent);
		
		aService.insertAlarm(alarm);
		
		WebSocketSession targetClient = userSessions.get(b.getBoardWriter()+""); // 타겟 : 게시글작성자 
		System.out.println("게시글작성자 : " + targetClient);
		if(targetClient != null) {
			targetClient.sendMessage(new TextMessage(alarmContent));
		}
		
		if(r.getReplyDepth() == 1) {
			System.out.println("대댓글작성");
			String rWriter = String.valueOf(aService.selectRWriter(r.getReplyParent()+""));
			alarm.setBoardWriter(rWriter);
			aService.insertAlarm(alarm);
			
			targetClient = userSessions.get(rWriter); // 타겟 : 원댓글작성자
			System.out.println("원댓글작성자 : " + targetClient);
			if(targetClient != null) {
				targetClient.sendMessage(new TextMessage(alarmContent));
			}
		}
		
		
		return result > 0 ? "success" : "fail";
	}
	
	/**
	 * 댓글조회(한개)
	 * @param no 	댓글 번호
	 * @return 댓글 전체 정보
	 */
	@ResponseBody
	@RequestMapping(value="selectRe.bl", produces="application/json; charset=utf-8")
	public String ajaxSelectReply(int no) {
		Reply r = bService.selectReply(no);
		return new Gson().toJson(r);
	}
	
	/**
	 * 댓글 수정
	 * @param no 			댓글 번호
	 * @param replyContent 	댓글 내용
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping(value="updateRe.bl", produces="application/json; charset=utf-8")
	public String ajaxUpdateReply(int no, String replyContent) {
		Reply r = new Reply();
		r.setReplyNo(no);
		r.setReplyContent(replyContent);
		int result = bService.updateReply(r);
		return new Gson().toJson(result);
	}
	
	/**
	 * 댓글 삭제
	 * @param no 댓글 번호
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping(value="deleteRe.bl", produces="application/json; charset=utf-8")
	public String ajaxDeleteReply(int no) {
		int result = bService.deleteReply(no);
		return new Gson().toJson(result);
	}
	
	/**
	 * 글 작성 페이지 포워딩
	 * @param model
	 * @return 글 작성 페이지
	 */
	@RequestMapping("enrollForm.bl")
	public String enrollFormBlind(Model model) {
		return "board/blindEnrollForm";
	}
	
	/**
	 * 익명 게시판 등록
	 * @param b				게시판 정보
	 * @param model
	 * @param session
	 * @return 전사 공지 게시판 리스트
	 */
	@RequestMapping("insert.bl")
	public String insertBlind(Board b, Model model, HttpSession session) {
		
		int	result = bService.insertBlind(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
		}else {
			session.setAttribute("alertMsg", "첨부파일 등록에 실패하였습니다");
		}
		return "redirect:list.bl";
	}
	
	/**
	 * 익명 게시판 삭제
	 * @param boardNo 	게시글 번호
	 * @param model
	 * @param session
	 * @return 성공여부
	 */
	@ResponseBody
	@RequestMapping(value="delete.bl", produces="application/json; charset=utf-8")
	public String deleteBlind(int boardNo, Model model, HttpSession session) {
		
		int result =  bService.deleteBlind(boardNo);
		
		return new Gson().toJson(result);
	}
	
	/**
	 * 익명 게시판 수정 화면
	 * @param no 		게시글 번호
	 * @param model
	 * @param session
	 * @return 공지사항 수정 화면
	 */
	@RequestMapping("updateForm.bl")
	public String updateFormBlind(int no, Model model, HttpSession session) {
		Board b = bService.selectBlind(no);
		
		model.addAttribute("b", b);
		
		return "board/blindUpdateForm";
	}
	
	/**
	 * 익명 게시판 수정 기능
	 * @param b			게시글 정보
	 * @param model
	 * @param session
	 * @return 성공여부
	 */
	@RequestMapping("update.bl")
	public String updateBlind(Board b , Model model, HttpSession session) {
		
		int result = bService.updateBlind(b);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
		}else {
			session.setAttribute("alertMsg", "게시글 수정에 실패하였습니다");
		}
		
		return "redirect:detail.bl?no=" + b.getBoardNo();
	}
	
	@ResponseBody
	@RequestMapping(value="insertReport.bl", produces="application/json; charset=utf-8")
	public String insertReport(Report r) {
		int result = bService.insertReport(r);
		return new Gson().toJson(result);
	}
}
