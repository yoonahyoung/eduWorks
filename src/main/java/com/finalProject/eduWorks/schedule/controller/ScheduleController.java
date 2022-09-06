package com.finalProject.eduWorks.schedule.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ScheduleController {
	
	Date date = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD");
	String d = formatter.format(date);
	
	// 캘린더 화면 조회
	@RequestMapping("list.ca")
	public String calendar() {
		return "schedule/calendarView";
	}
	
	// 일정 등록 페이지로 이동
	@RequestMapping("enrollForm.ca")
	public String enrollForm(String day, Model model) {
		model.addAttribute("day", day);
		return "schedule/scheduleEnrollForm";
	}

}
