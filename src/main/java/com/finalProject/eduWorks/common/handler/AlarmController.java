package com.finalProject.eduWorks.common.handler;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalProject.eduWorks.common.model.service.AlarmService;
import com.finalProject.eduWorks.common.model.vo.Alarm;
import com.google.gson.Gson;

@Controller
public class AlarmController {
	
	@Autowired
	private AlarmService aService;
	
	@ResponseBody
	@RequestMapping("select.al")
	public String selectAlarmList(int no) {
		
		ArrayList<Alarm> list = aService.slectAlarmList(no);
		
		return new Gson().toJson(list);
	}

}
