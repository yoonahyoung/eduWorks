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
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("main");
			
			switch(loginUser.getJobCode()){
			case "j0": m.setJobName("강사"); break;
			case "j1": m.setJobName("사원"); break;
			case "j2": m.setJobName("대리"); break;
			case "j3": m.setJobName("팀장"); break;
			case "j4": m.setJobName("대표"); break;
			}
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
		
}
