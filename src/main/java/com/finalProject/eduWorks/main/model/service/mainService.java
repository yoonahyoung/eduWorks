package com.finalProject.eduWorks.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

public interface mainService {
	
	// 메인페이지 공지사항 리스트조회, 페이징
	int selectListCount();
	ArrayList<Board> selectMainList(PageInfo pi);
	
	// 메인페이지 부서게시판 리스트조회, 페이징
	int selectDeptListCount();
	ArrayList<Board> selectMainDeptList(PageInfo pi, String deptcode);
	
	
	// 4. 받은 메일 조회
	int receiveMainListCount(Mail m); // 받은 메일 개수 조회
	int receiveMainUnReadCount(Mail m); // 받은 메일 중 안읽은 메일 개수 조회
	ArrayList<Mail> selectReceiveMainMailList(PageInfo pi, Mail m); // 받은 메일 목록

	// 1. 전사 주소록 조회 (페이징)
	int selectAddressListCount(); // 재직중인 사원수 조회
	ArrayList<Member> selectMainAddressList(PageInfo pi);
	
	ArrayList<Mail> searchMail(HashMap map);
	ArrayList<Board> searchBoard(HashMap bMap);
	ArrayList<Board> searchNotice(String key);
	ArrayList<Schedule> searchSchedule(HashMap map);
	
	
}
