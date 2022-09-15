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

import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.service.ScheduleService;
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
	public ModelAndView calendar(ModelAndView mv) {
		// 멤버 리스트
		ArrayList<Member> aList = sService.selectMemberList() ;
		
		mv.addObject("aList", aList)
		  .setViewName("schedule/calendarView");
		
		return mv;
	}
	
	// 내 캘린더 리스트 조회
	@ResponseBody
	@RequestMapping(value="mclist.ca", produces="application/json; charset=UTF-8")
	public String ajaxSelectMycalList(String memNo) {
		
		ArrayList<Mycal> list = sService.selectMycalList(memNo);
		
		return new Gson().toJson(list);
	}
	
	// 내 캘린더 추가
	@ResponseBody
	@RequestMapping("mcinsert.ca")
	public String insertMycal(Mycal m) {
		int result = sService.insertMycal(m);
		
		return result > 0 ? "success" : "fail";
	}
	
	// 내 캘린더 삭제
	@ResponseBody
	@RequestMapping("mcdelete.ca")
	public String ajaxDeleteMycal(String checkCnt) {
		int result = sService.deleteMycal(checkCnt);
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
	            map.put("start", list.get(i).getScheStartDate());
	            map.put("end", list.get(i).getScheEndDate());
	            map.put("color", list.get(i).getMycal().getMycalColor());
	            map.put("title", list.get(i).getScheTitle());
	            
	            
	            mapList.add(map);
	            map = new HashMap<String, Object>();
	        }
		return mapList;
	}
	
	// 일정 등록 페이지로 이동
	@RequestMapping("enrollForm.ca")
	public ModelAndView enrollForm(String day, String memNo, ModelAndView mv) {
		ArrayList<Mycal> list = sService.selectMycalList(memNo);
		ArrayList<Member> aList = sService.selectMemberList() ;
		
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
		String no = s.getScheAtndNo();
		no = no.substring(0, no.lastIndexOf(",")); // 맨 뒤 콤마 제거
		String list = s.getScheAtndList();
		list = list.substring(0, list.lastIndexOf(","));
		s.setScheAtndNo(no);
		s.setScheAtndList(list);
		
		int result = sService.insertSche(s);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "일정 등록 완료");
			session.setAttribute("alertMsg", "일정 등록을 완료하였습니다.");
			return "redirect:list.ca";
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "일정 등록 실패");
			session.setAttribute("alertMsg", "일정 등록을 실패하였습니다.");
			return "redirect:list.ca";
		}
		
	}
		
	

}
