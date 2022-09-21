package com.finalProject.eduWorks.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.service.ScheduleService;
import com.finalProject.eduWorks.schedule.model.vo.Likecal;
import com.finalProject.eduWorks.schedule.model.vo.Mycal;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;
import com.google.gson.Gson;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService sService;
	
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD");
	String d = formatter.format(date);
	
	// 캘린더 화면 조회
	@RequestMapping("list.ca")
	public ModelAndView calendar(String memNo, ModelAndView mv) {
		
		// 멤버 리스트 조회
		String keyword = "";
		ArrayList<Member> aList = sService.selectMemberList(keyword, memNo);
		
		// 마이 캘린더 리스트
		ArrayList<Mycal> clist = sService.selectMycalList(memNo);
		String str = "";
		for(int i = 0; i < clist.size(); i++) {
			str += clist.get(i).getMycalNo() + ",";
		}
		
		var calArr = str.substring(0, str.lastIndexOf(","));
		
		mv.addObject("calArr", calArr).addObject("aList", aList).setViewName("schedule/calendarView");
		
		return mv;
	}
	
	// 내 캘린더 리스트 조회
	@ResponseBody
	@RequestMapping(value="mclist.ca", produces="application/json; charset=UTF-8")
	public String ajaxSelectMycalList(String memNo) {
		
		ArrayList<Mycal> list = sService.selectMycalList(memNo);
		
		return new Gson().toJson(list);
	}
	
	// 관심 캘린더 리스트 조회
	@ResponseBody
	@RequestMapping(value="lclist.ca", produces="application/json; charset=UTF-8")
	public String ajaxSelectlikecalList(String memNo) {
		
		// 관심 캘린더 조회
		ArrayList<Likecal> list = sService.selectLikecalList(memNo);
		
		return new Gson().toJson(list);
	}
	
	// 내 캘린더 추가
	@ResponseBody
	@RequestMapping("mcinsert.ca")
	public String ajaxInsertMycal(Mycal m) {
		int result = sService.insertMycal(m);
		
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 수정
	@ResponseBody
	@RequestMapping("mcupdate.ca")
	public String ajaxUpdateMycal(int mcNo, String mcName) {
		int result = sService.updateMycal(mcNo, mcName);
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 삭제
	@ResponseBody
	@RequestMapping("mcdelete.ca")
	public String ajaxDeleteMycal(String checkCnt) {
		int result = sService.deleteMycal(checkCnt);
		return result > 0 ? "success" : "fail";
	}
	
	// 관심 캘린더 삭제
	@ResponseBody
	@RequestMapping("lcdelete.ca")
	public String ajaxDeleteLikecal(int lcNo) {
		int result = sService.deleteLikecal(lcNo);
		return result > 0 ? "success" : "fail";
	}
	
	// 캘린더 색상 변경
	@ResponseBody
	@RequestMapping("mccolor.ca")
	public String ajaxColorMycal(Mycal m) {
		int result = sService.colorMycal(m);
		return result > 0 ? "success" : "fail";
	}
	
	// 캘린더 관리 화면 조회
	@RequestMapping("manage.ca")
	public String mCalendar() {
		return "schedule/manageCalendarView";
	}
	
	// 일정 조회
	@ResponseBody
	@RequestMapping(value="sclist.ca", produces="application/json; charset=UTF-8")
	public List<Map<String, Object>> ajaxSelectScheduleList(String memNo) throws Exception{
	     ArrayList<Schedule> list = sService.selectScheList(memNo);
	     
	     List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
	     Map<String, Object> map = new HashMap<String, Object>();
	     
	     
	     for (int i = 0; i < list.size(); i++) {
	    	 	map.put("id", list.get(i).getScheNo());
	            map.put("start", list.get(i).getScheStartDate());
	            map.put("end", list.get(i).getScheEndDate());
	            map.put("color", list.get(i).getMycal().getMycalColor());
	            map.put("title", list.get(i).getScheTitle());
	            map.put("atnd", list.get(i).getScheAtndNo());
	            map.put("cmpy", list.get(i).getScheCmpy());
	            map.put("mycal", list.get(i).getMycalNo());
	            map.put("writer", list.get(i).getScheWriter());
	            
	            mapList.add(map);
	            map = new HashMap<String, Object>();
	        }
		return mapList;
	}
	
	// 일정 등록 페이지로 이동
	@RequestMapping("enrollForm.ca")
	public ModelAndView enrollForm(String day, String memNo, ModelAndView mv) {
		ArrayList<Mycal> list = sService.selectMycalList(memNo);
		String keyword = "";
		ArrayList<Member> aList = sService.selectMemberList(keyword, memNo) ;
		
		mv.addObject("day", day).addObject("list", list).addObject("aList", aList);
		mv.setViewName("schedule/scheduleEnrollForm");
		return mv;
	}
		
	// 참석자 추가
	@ResponseBody
	@RequestMapping(value="chatnd.ca", produces="application/json; charset=UTF-8")
	public String selectMember(String memNo) {
		Member m = sService.selectMember(memNo);
		
		return new Gson().toJson(m);
	}
		
	// 일정 등록
	@RequestMapping("insert.ca")
	public String insertSche(Schedule s, HttpSession session) {
		
		int result = sService.insertSche(s);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "일정 등록 완료");
			session.setAttribute("alertMsg", "일정 등록을 완료하였습니다.");
			return "redirect:list.ca?memNo=" + s.getScheWriter();
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "일정 등록 실패");
			session.setAttribute("alertMsg", "일정 등록을 실패하였습니다.");
			return "redirect:list.ca?memNo=" + s.getScheWriter();
		}
		
	}
	
	// 일정 상세
	@RequestMapping("detail.ca")
	public ModelAndView selectSche(int sNo, String memNo, ModelAndView mv) {
		Schedule s = sService.selectSche(sNo);
		
		String no = s.getScheAtndNo();
		String list = s.getScheAtndList();
		String[] nArr = {};
		String[] lArr = {};
		
		// 배열로 만들기
		
		if(no != null) {
			nArr = no.split(",");
		}
		if(list != null) {
			lArr = list.split(",");
		}
		
		// 내 캘린더 항목
		ArrayList<Mycal> mlist = sService.selectMycalList(memNo);
		// 멤버 리스트
		String keyword = "";
		ArrayList<Member> aList = sService.selectMemberList(keyword, memNo) ;
		
		mv.addObject("s", s).addObject("n", nArr).addObject("l", lArr)
		  .addObject("mlist", mlist).addObject("aList", aList);
		mv.setViewName("schedule/scheduleDetailView");
		return mv;
	}
	
	// 일정 수정
	@RequestMapping("update.ca")
	public String updateSche(Schedule s, HttpSession session) {
		//System.out.println(s);
		
		int result = sService.updateSche(s);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "일정 수정 완료");
			session.setAttribute("alertMsg", "일정 수정을 완료하였습니다.");
			return "redirect:detail.ca?sNo=" + s.getScheNo() + "&memNo=" + s.getScheWriter();
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "일정 수정 실패");
			session.setAttribute("alertMsg", "일정 수정을 실패하였습니다.");
			return "redirect:detail.ca?sNo=" + s.getScheNo() + "&memNo=" + s.getScheWriter();
		}
		
	}
	
	
	// 일정 삭제
	@RequestMapping("delete.ca")
	public String deleteSche(int sNo, HttpSession session) {
		Schedule s = sService.selectSche(sNo);
		int result = sService.deleteSche(sNo);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "일정 삭제 완료");
			session.setAttribute("alertMsg", "일정 삭제를 완료하였습니다.");
			return "redirect:list.ca?memNo=" + s.getScheWriter();
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "일정 삭제 실패");
			session.setAttribute("alertMsg", "일정 삭제를 실패하였습니다.");
			return "redirect:list.ca?memNo=" + s.getScheWriter();
		}
	}
	
	// 댓글 리스트 조회
	@ResponseBody
	@RequestMapping(value="rlist.ca", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int no) {
		
		ArrayList<Reply> list = sService.selectReplyList(no);
		
		return new Gson().toJson(list);
	}
	
	// 댓글, 대댓글 입력
	@ResponseBody
	@RequestMapping("rinsert.ca")
	public String ajaxInsertReply(Reply r) {
		
		if(r.getReplyParent() == 0) { // 원댓글일 때
			r.setReplyDepth(0);
		} else {
			r.setReplyDepth(1);
		}
		
		int result = sService.insertReply(r);
		
		return result > 0 ? "success" : "fail";
	}
	
	// 댓글 수정
	@ResponseBody
	@RequestMapping(value="rupdate.ca", produces="application/json; charset=UTF-8")
	public String ajaxUpdateReply(Reply rr) {
		int result = sService.updateReply(rr);
		Reply r = sService.selectReply(rr.getReplyNo());
		
		if(result > 0) {
			return new Gson().toJson(r);
		} else {
			return "fail";
		}
	}
	
	// 댓글 취소
	@ResponseBody
	@RequestMapping(value="rcancel.ca", produces="application/json; charset=UTF-8")
	public String ajaxCancelReply(int replyNo) {
		Reply r = sService.selectReply(replyNo);
		
		return new Gson().toJson(r);
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("rdelete.ca")
	public int ajaxDeleteReply(int replyNo) {
		int result = sService.deleteReply(replyNo);
		
		return result;
	}
	
	// 참석자 검색
	@ResponseBody
	@RequestMapping(value="search.ca", produces="application/json; charset=UTF-8")
	public String ajaxSearchAtnd(String keyword, String memNo) {
		ArrayList<Member> list = sService.selectMemberList(keyword, memNo);
		return new Gson().toJson(list);
	}
	
	// 내 캘린더 번호 리스트
	@ResponseBody
	@RequestMapping(value="mcnolist.ca", produces="application/json; charset=UTF-8")
	public String ajaxselectMycalNo(String memNo) {
		ArrayList<Mycal> list = sService.selectMycalList(memNo);
		return new Gson().toJson(list);
	}
	
	// 관심 캘린더 추가
	@ResponseBody
	@RequestMapping("lcinsert.ca")
	public String ajaxInsertLikecal(String memNo, String likeMemNo) {
		Likecal l = new Likecal();
		l.setMemNo(memNo);
		l.setLikeMemNo(likeMemNo);
		int result = sService.insertLikecal(l);
		
		return result > 0 ? "success" : "fail";
	}
}
