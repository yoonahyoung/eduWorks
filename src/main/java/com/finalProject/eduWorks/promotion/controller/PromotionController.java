package com.finalProject.eduWorks.promotion.controller;

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

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
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
//	@RequestMapping("insert.pr")
//	public String insertPromotion(Promotion p, MultipartFile upfile, Attachment at, 
//			HttpSession session, Model model) {
//		
//	}
	
	
	
	// 게시글 삭제 기능
	@ResponseBody
	@RequestMapping("delete.pr")
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
