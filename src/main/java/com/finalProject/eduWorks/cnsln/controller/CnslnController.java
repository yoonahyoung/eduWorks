package com.finalProject.eduWorks.cnsln.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.cnsln.model.service.CnslnService;
import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.common.template.Pagination;
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
	public ModelAndView enrollForm(String day, String memNo, ModelAndView mv) {
		
		String keyword = "";
		ArrayList<Member> mList = cService.selectMemberList(keyword, memNo) ;
		String key = "";
		ArrayList<Student> sList = cService.selectStudentList(key);
		
		mv.addObject("day", day).addObject("mList", mList).addObject("sList", sList);
		mv.setViewName("cnsln/counselingEnrollForm");
		return mv;
	}
	
	// 상담 일정 등록
	@RequestMapping("insert.cn")
	public String insertCnsln(Cnsln c, Student s, HttpSession session) {
		int result2 = 1;
		 if(s.getStudentNo() == 0) {
			 result2 = cService.insertStudent(s);
			 String key = "";
			 int listCount = cService.selectStudentList(key).size();
			 c.setStudentNo(listCount);
		 }
		 
		 //System.out.println(c);
		 int result = cService.insertCnsln(c);
		  
		 if(result * result2 > 0) { 
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
	public String ajaxSearchCharge(String keyword, String memNo) {
		ArrayList<Member> list = cService.selectMemberList(keyword, memNo);
		return new Gson().toJson(list);
	}
	
	// 상담 일정 상세 조회
	@RequestMapping("detail.cn")
	public ModelAndView selectCnsln(int cNo, String memNo, ModelAndView mv) {
		String keyword = "";
		ArrayList<Member> mList = cService.selectMemberList(keyword, memNo) ;
		String key = "";
		ArrayList<Student> sList = cService.selectStudentList(key);
		
		int result = cService.increaseCount(cNo);
		Cnsln c = cService.selectCnsln(cNo);
		//System.out.println(c);
		int sNo = c.getStudentNo();
		Student s = cService.selectStudent(sNo);
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
		if(result > 0) {
			mv.addObject("c", c).addObject("n", nArr).addObject("l", lArr)
			  .addObject("mList", mList).addObject("s", s).addObject("sList", sList);
		}
		mv.setViewName("cnsln/counselingDetailView");
		return mv;
		
	}
	
	// 상담 일정 수정
	@RequestMapping("update.cn")
	public String updateCnsln(Cnsln c, Student s, HttpSession session) {
		int result1 = cService.updateCnsln(c);
		int result2 = cService.updateStudent(s);
		
		if(result1 * result2 > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "상담 일정 수정 완료");
			session.setAttribute("alertMsg", "상담 일정 수정을 완료하였습니다.");
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "상담 일정 수정 실패");
			session.setAttribute("alertMsg", "상담 일정 수정을 실패하였습니다.");
		}
		return "redirect:detail.cn?cNo=" + c.getCnslnNo();
	}
	
	// 상담 일정 삭제
	@RequestMapping("delete.cn")
	public String deleteCnsln(int cNo, HttpSession session) {
		int result = cService.deleteCnsln(cNo);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "상담 일정 삭제 완료");
			session.setAttribute("alertMsg", "상담 일정 삭제를 완료하였습니다.");
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "일정 삭제 실패");
			session.setAttribute("alertMsg", "일정 삭제를 실패하였습니다.");
		}
		return "redirect:list.cn";
	}
	
	// 댓글 리스트 조회
	@ResponseBody
	@RequestMapping(value="rlist.cn", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int no) {
		
		ArrayList<Reply> list = cService.selectReplyList(no);
		
		return new Gson().toJson(list);
	}
	
	// 댓글, 대댓글 입력
	@ResponseBody
	@RequestMapping("rinsert.cn")
	public String ajaxInsertReply(Reply r) {
		
		if(r.getReplyParent() == 0) { // 원댓글일 때
			r.setReplyDepth(0);
		} else {
			r.setReplyDepth(1);
		}
		
		int result = cService.insertReply(r);
		
		return result > 0 ? "success" : "fail";
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="rupdate.cn", produces="application/json; charset=UTF-8")
	public String ajaxUpdateReply(Reply rr) {
		int result = cService.updateReply(rr);
		Reply r = cService.selectReply(rr.getReplyNo());
		
		if(result > 0) {
			return new Gson().toJson(r);
		} else {
			return "fail";
		}
	}
	
	// 댓글 취소
	@ResponseBody
	@RequestMapping(value="rcancel.cn", produces="application/json; charset=UTF-8")
	public String ajaxCancelReply(int replyNo) {
		Reply r = cService.selectReply(replyNo);
		
		return new Gson().toJson(r);
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("rdelete.cn")
	public int ajaxDeleteReply(int replyNo) {
		int result = cService.deleteReply(replyNo);
		
		return result;
	}
	
	// 상담 내역 리스트
	@RequestMapping("list.tcn")
	public ModelAndView selectCnslnList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, String cNo, ModelAndView mv) {
		int cate = 1;
		int listCount = cService.selectListCount(keyword, cate);
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 4, 5);
		ArrayList<Cnsln> list = cService.selectCnslnList(pi, keyword, cate);

		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("cnsln/counselingListView");
		  
		return mv;
	}
	
	// 상담 내역 상세 조회
	@RequestMapping("detail.tcn")
	public ModelAndView selectCnslnRe(int cNo, ModelAndView mv) {
		Cnsln c = cService.selectCnsln(cNo);
		
		mv.addObject("c", c).setViewName("cnsln/cnslnDetailView");
		return mv;
	}
	
	// 상담 내역 리스트 검색
	@ResponseBody
	@RequestMapping(value="search.tcn", produces="application/json; charset=UTF-8")
	public String ajaxSelectCnslnList(@RequestParam(value="cpage", defaultValue="1") int currentPage, String keyword, int cate) {
		int listCount = cService.selectListCount(keyword, cate);
		
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 4, 5);
		
		
		ArrayList<Cnsln> list = cService.selectCnslnList(pi, keyword, cate);
		System.out.println(list);
		HashMap<String, Object> map = new HashMap<>();
		map.put("pi", pi);
		map.put("list", list);
		
		return new Gson().toJson(map);
		
	} 
	
	// 상담 내역 수정 페이지 이동
	@RequestMapping("updateForm.tcn")
	public ModelAndView updateFormReCnsln(int cNo, ModelAndView mv) {
		Cnsln c = cService.selectCnsln(cNo);
		mv.addObject("c", c).setViewName("cnsln/cnslnUpdateFormView");
		return mv;
	}
	
	// 상담 내역 수정
	@RequestMapping("update.tcn")
	public String updateReCnsln(Cnsln c, HttpSession session) {
		int result = cService.updateCnsln(c);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "상담 내역 수정 완료");
			session.setAttribute("alertMsg", "상담 내역 수정을 완료하였습니다.");
			return "redirect:detail.tcn?cNo=" + c.getCnslnNo();
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "상담 내역 수정 실패");
			session.setAttribute("alertMsg", "상담 내역 수정을 실패하였습니다.");
			return "redirect:detail.tcn?cNo=" + c.getCnslnNo();
		}
	}
	
	// 상담 내역 삭제
	@RequestMapping("delete.tcn")
	public String deleteReCnsln(int cNo, HttpSession session) {
		int result = cService.deleteReCnsln(cNo);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "상담 내역 삭제 완료");
			session.setAttribute("alertMsg", "상담 내역 삭제를 완료하였습니다.");
			return "redirect:list.tcn";
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "상담 내역 삭제 실패");
			session.setAttribute("alertMsg", "상담 내역 삭제를 실패하였습니다.");
			return "redirect:list.tcn";
		}
	}
	
	// 학생 검색
	@ResponseBody
	@RequestMapping(value="stsearch.cn", produces="application/json; charset=UTF-8")
	public String searchStudent(String key) {
		ArrayList<Student> list = cService.selectStudentList(key);
		
		return new Gson().toJson(list);
	}
	
	// 학생 조회
	@ResponseBody
	@RequestMapping(value="stst.cn", produces="application/json; charset=UTF-8")
	public String selectStudent(int sNo) {
		Student s = cService.selectStudent(sNo);
		return new Gson().toJson(s);
	}
	
	
	
	
}
