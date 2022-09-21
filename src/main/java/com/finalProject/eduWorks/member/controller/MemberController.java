package com.finalProject.eduWorks.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.member.model.service.MemberService;
import com.finalProject.eduWorks.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	//@Autowired  
	//private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null /*&& bcryptPasswordEncoder.matches(m.getMemId(), loginUser.getMemPwd())*/) {
			
			switch(loginUser.getJobCode()){
			case "J0": loginUser.setJobName("강사"); break;
			case "J1": loginUser.setJobName("사원"); break;
			case "J2": loginUser.setJobName("대리"); break;
			case "J3": loginUser.setJobName("팀장"); break;
			case "J4": loginUser.setJobName("대표"); break;
			}
			
			switch(loginUser.getDeptCode()) {
			case "D0" : session.setAttribute("deptName", "강사"); break;
			case "D1" : session.setAttribute("deptName", "인사팀"); break;
			case "D2" : session.setAttribute("deptName", "행정팀"); break;
			case "D3" : session.setAttribute("deptName", "홍보팀"); break;
			case "DN" : session.setAttribute("deptName", "대표"); break;
			// 대표일 경우 게시판 고를 수 있도록 처리할 예정
			}
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
			return mv;
		}else {
			//mv.addObject("errorMsg", "로그인 실패");
			//mv.setViewName("common/errorPage");
			session.setAttribute("alertMsg", "로그인 정보를 다시 입력해주세요.");
			mv.setViewName("redirect:/");
			return mv;
		}
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		
		return "member/loginForm";
	}
	
	@RequestMapping("mainpage.me")
	public String mainPage() {
		return "main";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
}
