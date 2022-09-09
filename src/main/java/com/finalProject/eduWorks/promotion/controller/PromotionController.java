package com.finalProject.eduWorks.promotion.controller;

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

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.common.template.FileUpload;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.promotion.model.service.PromotionService;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;
import com.google.gson.Gson;

@Controller
public class PromotionController {
	
	@Autowired
	private PromotionService pService;
	
	// 게시글 리스트
	@RequestMapping("list.pr")
	public ModelAndView selectPromoList(@RequestParam(value="ppage", defaultValue="1") int currentPage, String keyword, String cNo, ModelAndView mv) {
		
		int listCount = pService.selectListCount(keyword, cNo);
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 4, 5);
		ArrayList<Promotion> list = pService.selectPromoList(pi, keyword, cNo);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("promotion/promotionListView");
		  
		return mv;
	}
	
	// 글 작성 페이지 이동
	@RequestMapping("enrollForm.pr")
	public String enrollForm() {
		return "promotion/promotionEnrollForm";
	}
	

	// 글 작성
	@RequestMapping("insert.pr")
	public String insertPromotion(Promotion p, MultipartFile upfile, Attachment at, 
			HttpSession session, Model model) {
		
		int result2 = 1;
		int result1 = pService.insertPromo(p);
		
		// 첨부파일이 있을 경우
		if( !upfile.getOriginalFilename().equals("") ) {
			// 새로운 파일 서버 업로드
			String saveFilePath = FileUpload.saveFile(upfile, session, "resources/uploadFiles/promoFiles/");
			
			at.setAtOriginName(upfile.getOriginalFilename());
			at.setAtChangeName(saveFilePath);
			int no = pService.selectLastNo();
			at.setAtRefBNo(no);
			
			result2 = pService.insertAt(at);
		}
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "홍보물 작성에 성공하였습니다.");
			return "redirect:list.pr";
		} else {
			//session.setAttribute("alertMsg", "수정 실패");
			return "redirect:list.pr?ppage=2";
		}
		
	}
	
	// 글 상세 조회
	@RequestMapping("detail.pr")
	public ModelAndView selectPromo(int no, ModelAndView mv) {
		int result = pService.increaseCount(no);
		
		if(result > 0) {
			Promotion p = pService.selectPromo(no);
			Attachment at = pService.selectAt(no);
	
			mv.addObject("p", p)
			  .addObject("at", at)
			  .setViewName("promotion/promotionDetailView");
			
		} else {
			//mv.addObject("alertMsg", "홍보물 상세조회에 실패하였습니다.");
			System.out.println("ddd");
		}
		return mv;
	}
	

	// 댓글 리스트 조회
	@ResponseBody
	@RequestMapping(value="rlist.pr", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int no) {
		
		ArrayList<Reply> list = pService.selectReplyList(no);
		
		return new Gson().toJson(list);
	}
	
	// 댓글, 대댓글 입력
	@ResponseBody
	@RequestMapping("rinsert.pr")
	public String ajaxInsertReply(Reply r) {
		
		if(r.getReplyParent() == 0) { // 원댓글일 때
			r.setReplyDepth(0);
		} else {
			r.setReplyDepth(1);
		}
		
		int result = pService.insertReply(r);
		
		return result > 0 ? "success" : "fail";
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="rupdate.pr", produces="application/json; charset=UTF-8")
	public String ajaxUpdateReply(Reply rr) {
		int result = pService.updateReply(rr);
		Reply r = pService.selectReply(rr.getReplyNo());
		
		if(result > 0) {
			return new Gson().toJson(r);
		} else {
			return "fail";
		}
	}
	
	// 댓글 취소
	@ResponseBody
	@RequestMapping(value="rcancel.pr", produces="application/json; charset=UTF-8")
	public String ajaxCancelReply(int replyNo) {
		Reply r = pService.selectReply(replyNo);
		
		return new Gson().toJson(r);
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("rdelete.pr")
	public int ajaxDeleteReply(int replyNo) {
		int result = pService.deleteReply(replyNo);
		
		return result;
	}
	
	// 글 수정 페이지 이동
	@RequestMapping("updateForm.pr")
	public String updateForm(int no, Model model) {

		model.addAttribute("p", pService.selectPromo(no));
		model.addAttribute("at", pService.selectAt(no));
		return "promotion/promotionUpdateForm";
	}
	
	// 글 수정
	@RequestMapping("update.pr")
	public String insertPromo(Promotion p, Attachment at, MultipartFile reupfile, HttpSession session, Model model) {
		
		int result2 = 1;
		// 새로운 첨부파일이 있을 경우
		if( !reupfile.getOriginalFilename().equals("") ) {
			
			 // 새로운 파일 서버 업로드
			String saveFilePath = FileUpload.saveFile(reupfile, session, "resources/uploadFiles/promoFiles/");
			
			// 기존 첨부파일이 있을 경우
			if( at.getAtOriginName() != null ) {
				new File( session.getServletContext().getRealPath(at.getAtChangeName())).delete();
				
				at.setAtOriginName(reupfile.getOriginalFilename());
				at.setAtChangeName(saveFilePath);
				at.setAtRefBNo(p.getPromoNo());
				
				result2 = pService.updateAt(at);
			} else {	// 기존 첨부파일이 없었을 경우
				at.setAtOriginName(reupfile.getOriginalFilename());
				at.setAtChangeName(saveFilePath);
				at.setAtRefBNo(p.getPromoNo());
				result2 = pService.insertAt(at);
			}
			
			
			
		}
		
		int result1 = pService.updatePromo(p);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "홍보물 수정에 성공하였습니다.");
			return "redirect:detail.pr?no=" + p.getPromoNo();
		} else {
			//session.setAttribute("alertMsg", "수정 실패");
			return "redirect:list.pr";
		}
	}
	
	// 글 삭제
	@RequestMapping("delete.pr")
	public String deletePromo(int no, HttpSession session) {
		String aNo = Integer.toString(no);
		System.out.println(no);
		System.out.println(aNo);
		
		ArrayList<Attachment> list = pService.selectAtList(aNo);
		int result2 = 1;
		
		if(list.size() != 0) {
			for(int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getAtChangeName());
			}
			
			result2 = pService.deletePromoAt(aNo);
		}
		
		int result1 = pService.deletePromo(aNo);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "홍보물 삭제에 성공하였습니다.");
			return "redirect:list.pr";
		} else {
			return "fail";
		}
	}
	
	// 게시글 삭제 기능
	@ResponseBody
	@RequestMapping("aDelete.pr")
	public String ajaxDeletePromo(String checkCnt, HttpSession session) {
		// 첨부파일이 있었을 경우 파일 삭제
		ArrayList<Attachment> list = pService.selectAtList(checkCnt);
		
		int result2 = 1;
		if(list.size() != 0) {
			for(int i = 0; i < list.size(); i++) {
				System.out.println(list.get(i).getAtChangeName());
			}
			
			result2 = pService.deletePromoAt(checkCnt);
		}
		
		int result1 = pService.deletePromo(checkCnt);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertMsg", "홍보물 삭제에 성공하였습니다.");
			return "success";
		} else {
			return "fail";
		}
		
	}
	
	// 게시글 검색 기능
	@ResponseBody
	@RequestMapping(value="search.pr", produces="application/json; charset=UTF-8")
	public String ajaxSelectPromoList(@RequestParam(value="ppage", defaultValue="1") int currentPage, String keyword, String cNo) {
		int listCount = pService.selectListCount(keyword, cNo);
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 4, 5);
		
		
		ArrayList<Promotion> list = pService.selectPromoList(pi, keyword, cNo);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
		
	}
	
}
