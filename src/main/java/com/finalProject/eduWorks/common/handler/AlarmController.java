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
	
	/**
	 * 댓글 리스트 조회
	 * @param mno	로그인 유저 번호
	 * @return	댓글 리스트
	 */
	@ResponseBody
	@RequestMapping(value="select.al", produces="application/json; charset=utf-8")
	public String selectAlarmList(int mno) {
		
		ArrayList<Alarm> list = aService.slectAlarmList(mno);
		return new Gson().toJson(list);
	}
	
	/**
	 * 알람 삭제
	 * @param alNo	알람 번호 (여러개 이어진 문자열)
	 * @return 성공 여부
	 */
	@ResponseBody
	@RequestMapping(value="delete.al", produces="application/json;")
	public String deleteAlarm(String alNo){
		int result = aService.deleteAlarm(alNo);
		return new Gson().toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value="read.al", produces="application/json;")
	public String readAlarm(String alNo) {
		int result = aService.readAlarm(alNo);
		return new Gson().toJson(result);
	}
	
}
