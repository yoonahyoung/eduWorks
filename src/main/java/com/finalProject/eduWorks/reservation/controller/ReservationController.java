package com.finalProject.eduWorks.reservation.controller;

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

import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.reservation.model.service.ReservationService;
import com.finalProject.eduWorks.reservation.model.vo.Reservation;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;
import com.google.gson.Gson;

@Controller
public class ReservationController {

	@Autowired
	private ReservationService rService;
	
	@RequestMapping("reservationView.re")
	public ModelAndView reservationView(ModelAndView mv, String memNo) {
		
		ArrayList<Reservation> res = rService.reservationView(memNo);
		
		mv.addObject("res", res)
		  .setViewName("reservation/reservation");
		
		return mv;
	}
	
	// 일정 조회
		@ResponseBody
		@RequestMapping(value="reservationSelect.re", produces="application/json; charset=UTF-8")
		public List<Map<String, Object>> ajaxSelectScheduleList(String memNo) throws Exception{
		     ArrayList<Reservation> list = rService.reservationView(memNo);
		     
		     List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
		     Map<String, Object> map = new HashMap<String, Object>();
		     
		     
		     for (int i = 0; i < list.size(); i++) {
		    	 	map.put("id", list.get(i).getResNo());
		            map.put("start", list.get(i).getResStartTime());
		            map.put("end", list.get(i).getResEndTime());
		            map.put("color", list.get(i).getResColor());
		            map.put("title", list.get(i).getResTitle());
		            map.put("content", list.get(i).getResContent());
		            mapList.add(map);
		            map = new HashMap<String, Object>();
		        }
			return mapList;
		}
	
	// 예약 등록
	@RequestMapping("reservationInsert.re")
	public String reservationInsert(Reservation res, HttpSession session) {
		
		System.out.println(res);
		int result = rService.reservationInsert(res);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "예약 완료");
			session.setAttribute("alertMsg", "예약을 완료하였습니다.");
			return "redirect:reservationView.re?memNo=" + res.getResNo();
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "예약 실패");
			session.setAttribute("alertMsg", "예약을 실패하였습니다.");
			return "redirect:reservationView.re?memNo=" + res.getResNo();
		}
	}
	
	// 예약 수정폼
	@ResponseBody
	@RequestMapping(value="reservationUpdateForm.re", produces="application/json; charset=UTF-8")
	public String reservationUpdateForm(String resNo) {
		Reservation r = rService.reservationUpdateForm(resNo);
		
		return new Gson().toJson(r);
	}
	
	// 예약 수정
	@RequestMapping("reservationUpdate.re")
	public String reservationUpdate(int resNoU, String resStartTimeU, String resEndTimeU, String resTitleU, String resContentU, String resColorU, HttpSession session) {
		
		Reservation res = new Reservation();
		res.setResStartTime(resStartTimeU);
		res.setResEndTime(resEndTimeU);
		res.setResTitle(resTitleU);
		res.setResContent(resContentU);
		res.setResColor(resColorU);
		System.out.println(res);
		int result = rService.reservationInsert(res);
		
		if(result > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "예약 수정 완료");
			session.setAttribute("alertMsg", "예약 수정을 완료하였습니다.");
			return "redirect:reservationView.re?memNo=" + res.getResNo();
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "예약 수정 실패");
			session.setAttribute("alertMsg", "예약 수정을 실패하였습니다.");
			return "redirect:reservationView.re?memNo=" + res.getResNo();
		}
	}
	
	
	
}
