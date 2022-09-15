package com.finalProject.eduWorks.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.board.model.service.NoticeServiceImpl;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.common.template.FileUpload;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl nService;
	
	/**
	 * 전사공지 리스트 조회
	 * @param currentPage	현재 페이지 전달값
	 * @param mv 
	 * @param cpage 		페이지 키값
	 * @param defaultValue 	처음 리스트에 들어갈땐 페이지 기본값 1
	 * @return 전사 공지 조회 화면
	 */
	@RequestMapping("list.no")
	public ModelAndView noticeList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		HashMap<String,ArrayList<Board>> map = nService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("topList", map.get("topList")).addObject("list", map.get("list")).setViewName("board/noticeListView");
		return mv;
	}
	
	
	/**
	 * 전사 공지 상세 조회
	 * @param no 	게시글 번호
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
			Attachment at = nService.selectAttachment(no);
			model.addAttribute("b", b);
			model.addAttribute("at", at);
		}else {
			model.addAttribute("alertMsg", "게시글 조회에 실패하였습니다.");
		}
		
		return "board/noticeDetailView";
	}
	
	/**
	 * 댓글 리스트 조회
	 * @param no 	게시글 번호
	 * @param model
	 * @return 댓글 리스트
	 */
	@ResponseBody
	@RequestMapping(value="rList.no", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int no) {
		ArrayList<Reply> rList = nService.selectReplyList(no);
		return new Gson().toJson(rList);
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
	 */
	@ResponseBody
	@RequestMapping("insertRe.no")
	public String ajaxInsertReply(Reply r, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		r.setReplyWriter(loginUser.getMemName());
		r.setReplyJob(loginUser.getJobName());
		
		int result = nService.insertReply(r);
		
		if(result > 0) {
			Board b = nService.selectNotice(r.getReBoardNo());
			model.addAttribute("b", b);
		}else {
			session.setAttribute("alertMsg", "댓글 작성 실패!");
		}
		
		return result > 0 ? "success" : "fail";
	}
	
	/**
	 * 댓글조회(한개)
	 * @param no 	댓글 번호
	 * @return 댓글 전체 정보
	 */
	@ResponseBody
	@RequestMapping(value="selectRe.no", produces="application/json; charset=utf-8")
	public String ajaxSelectReply(int no) {
		Reply r = nService.selectReply(no);
		return new Gson().toJson(r);
	}
	
	/**
	 * 댓글 수정
	 * @param no 			댓글 번호
	 * @param replyContent 	댓글 내용
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping(value="updateRe.no", produces="application/json; charset=utf-8")
	public String ajaxUpdateReply(int no, String replyContent) {
		Reply r = new Reply();
		r.setReplyNo(no);
		r.setReplyContent(replyContent);
		int result = nService.updateReply(r);
		return new Gson().toJson(result);
	}
	
	/**
	 * 댓글 삭제
	 * @param no 댓글 번호
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping(value="deleteRe.no", produces="application/json; charset=utf-8")
	public String ajaxDeleteReply(int no) {
		int result = nService.deleteReply(no);
		return new Gson().toJson(result);
	}
	
	/**
	 * 글 작성 페이지 포워딩
	 * @param model
	 * @return 글 작성 페이지
	 */
	@RequestMapping("enrollForm.no")
	public String noticeEnrollForm(Model model) {
		return "board/noticeEnrollForm";
	}
	
	/**
	 * 공지사항 등록
	 * @param b				게시판 정보
	 * @param atOriginName	첨부파일 원본명
	 * @param model
	 * @param session
	 * @return 전사 공지 게시판 리스트
	 */
	@RequestMapping("insert.no")
	public String insertNotice(Board b, MultipartFile atOriginName, Model model, HttpSession session) {
		Attachment at = new Attachment();
		
		int result1 = 0;
		// 전달된 파일이 있을 경우
		if(!atOriginName.getOriginalFilename().equals("")) {
			
			// 저장 파일 경로
			String saveFilePath = FileUpload.saveFile(atOriginName, session, "resources/uploadFiles/boardFiles/");
			
			at.setAtOriginName(atOriginName.getOriginalFilename());
			at.setAtChangeName(saveFilePath);
			result1 = 1;
		}
		
		int	result = nService.insertNotice(b);
		
		
		if(result > 0 && result1 > 0) {
			result1 = nService.insertAttachment(at);
		}else {
			session.setAttribute("alertMsg", "게시글 등록 완료");
			return "redirect:list.no";
		}
		
		if(result1 > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
		}else {
			session.setAttribute("alertMsg", "첨부파일 등록에 실패하였습니다");
		}
		return "redirect:list.no";
	}
	
	/**
	 * 공지사항 삭제
	 * @param boardNo 	게시글 번호
	 * @param atPath 	기존 첨부파일 경로
	 * @param model
	 * @param session
	 * @return 성공여부
	 */
	@ResponseBody
	@RequestMapping(value="delete.no", produces="application/json; charset=utf-8")
	public String deleteNotice(int boardNo, String atPath, Model model, HttpSession session) {
		
		int result =  nService.deleteNotice(boardNo);
		
		if(result > 0) { // db에 삭제 성공
			
			// 기존의 첨부 파일이 있었을 경우
			if(!atPath.equals("")) {
				new File(session.getServletContext().getRealPath(atPath)).delete();
			}
			result = 3; // 성공시(3) 목록 페이지로
		}else {
			result = 4; // 실패시(3) 해당 게시글 조회
		}
		
		return new Gson().toJson(result);
	}
	
	/**
	 * 공지사항 수정 화면
	 * @param no 		게시글 번호
	 * @param model
	 * @param session
	 * @return 공지사항 수정 화면
	 */
	@RequestMapping("updateForm.no")
	public String updateFormNotice(int no, Model model, HttpSession session) {
		Board b = nService.selectNotice(no);
		Attachment at = nService.selectAttachment(no);
		
		model.addAttribute("b", b);
		model.addAttribute("at", at);
		
		return "board/noticeUpdateForm";
	}
	
	/**
	 * 공지사항 수정 기능
	 * @param b			게시글 정보
	 * @param at		기존 첨부파일 정보
	 * @param reupfile	새로운 첨부파일
	 * @param model
	 * @param session
	 * @return 성공여부
	 */
	@RequestMapping("update.no")
	public String updateNotice(Board b, Attachment at, MultipartFile reupfile , Model model, HttpSession session) {
		int result1 = 0;
		
		// 새로 넘어온 첨부파일이 있을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일이 있었을 경우
			if(at.getAtOriginName() != null) { // 기존의 첨부파일 지우기
				new File(session.getServletContext().getRealPath(at.getAtChangeName())).delete();
				nService.updateAttachment(at);
			}
			
			// 새로 넘어온 첨부파일 서버 업로드 시키기
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/boardFiles/");
			
			at.setAtOriginName(reupfile.getOriginalFilename());
			at.setAtChangeName(saveFilePath);
			result1 = 1;
		}
		
		int result = nService.updateNotice(b);
		
		if(result > 0 && result1 > 0) { // 게시글 완, 첨부파일 o
			result1 = nService.insertAttachment(at);
		}else { // 게시글 완, 첨부파일 x
			session.setAttribute("alertMsg", "게시글 수정 완료");
			return "redirect:detail.no?no=" + b.getBoardNo();
		}
		
		if(result1 > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
		}else {
			session.setAttribute("alertMsg", "게시글 수정에 실패하였습니다");
		}
		
		return "redirect:detail.no?no=" + b.getBoardNo();
	}
}

