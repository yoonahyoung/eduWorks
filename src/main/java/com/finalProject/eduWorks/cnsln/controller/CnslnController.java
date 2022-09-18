package com.finalProject.eduWorks.cnsln.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.cnsln.model.service.CnslnService;
import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class CnslnController {
	
	@Autowired
	private CnslnService cService;
	
	// 상담 일정 관리 페이지 이동
	@RequestMapping("list.cn")
	public ModelAndView counseling(ModelAndView mv) {
		mv.setViewName("cnsln/counselingView");
		return mv;
	}
	
	// 상담 일정 리스트 조회
	@ResponseBody
	@RequestMapping(value="cnlist.cn", produces="application/json; charset=UTF-8")
	public List<Map<String, Object>> ajaxSelectCnslnList(String memNo) throws Exception{
	     ArrayList<Cnsln> list = cService.selectCnslnList(memNo);
	     
	     List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
	     Map<String, Object> map = new HashMap<String, Object>();
	     
	     
	     for (int i = 0; i < list.size(); i++) {
	    	 	map.put("id", list.get(i).getCnslnNo());
	            map.put("start", list.get(i).getCnslnStartDate());
	            map.put("end", list.get(i).getCnslnEndDate());
	            map.put("title", list.get(i).getCnslnTitle());
	            map.put("atnd", list.get(i).getCnslnChargeNo());
	            
	            mapList.add(map);
	            map = new HashMap<String, Object>();
	        }
		return mapList;
	}
		
	// 상담 일정 등록 페이지 
	@RequestMapping("enrollForm.cn")
	public ModelAndView enrollForm(String day, ModelAndView mv) {
		
		String keyword = "";
		ArrayList<Member> mList = cService.selectMemberList(keyword) ;
		
		mv.addObject("day", day).addObject("mList", mList);
		mv.setViewName("cnsln/counselingEnrollForm");
		return mv;
	}
	
	// 상담 일정 등록
	@RequestMapping("insert.cn")
	public String insertCnsln(Cnsln c, HttpSession session) {
		
		 int result = cService.insertCnsln(c);
		  
		 if(result > 0) { 
			 session.setAttribute("alertIcon", "success");
			 session.setAttribute("alertTitle", "상담 일정 등록 완료");
			 session.setAttribute("alertMsg", "상담 일정 등록을 완료하였습니다."); 
			 return "redirect:list.cn"; 
		 } else { 
			 session.setAttribute("alertIcon", "error");
			 session.setAttribute("alertTitle", "상담 일정 등록 실패");
			 session.setAttribute("alertMsg", "상담 일정 등록을 실패하였습니다."); 
			 return "redirect:list.cn"; 
		 }
		 
	}
		
	// 담당자 추가
	@ResponseBody
	@RequestMapping(value="chcharge.cn", produces="application/json; charset=UTF-8")
	public String selectMember(String memNo) {
		Member m = cService.selectMember(memNo);
		
		return new Gson().toJson(m);
	}
	
	// 담당자 검색
	@ResponseBody
	@RequestMapping(value="search.cn", produces="application/json; charset=UTF-8")
	public String ajaxSearchCharge(String keyword) {
		System.out.println(keyword);
		ArrayList<Member> list = cService.selectMemberList(keyword);
		return new Gson().toJson(list);
	}
	
	// 상담 일정 상세 조회
	@RequestMapping("detail.cn")
	public ModelAndView selectCnsln(int cNo, String memNo, ModelAndView mv) {
		String keyword = "";
		ArrayList<Member> mList = cService.selectMemberList(keyword) ;
		
		int result = cService.increaseCount(cNo);
		Cnsln c = cService.selectCnsln(cNo);
		
		String no = c.getCnslnChargeNo();
		String list = c.getCnslnChargeList();
		String[] nArr = {};
		String[] lArr = {};
		
		// 배열로 만들기
		
		if(no != null) {
			nArr = no.split(",");
		}
		if(list != null) {
			lArr = list.split(",");
		}
		
		mv.addObject("c", c).addObject("n", nArr).addObject("l", lArr).addObject("mList", mList);
		mv.setViewName("cnsln/counselingDetailView");
		return mv;
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
		
		

}
