package com.finalProject.eduWorks.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	/*
	 * * Interceptor (정확히는 HandlerInterceptor)
	 * - 해당 Controller가 실행되기 전, 실행된 후에 낚아채서 실행할 내용 작성 가능
	 * - 로그인 여부 판단, 회원의 권한 체크 할때 주로 사용
	 * 
	 * preHandle(전처리) : DispatcherServlet이 해당 컨트롤러를 호출하기 전에 낚아채는 영역
	 * postHandle(후처리) : 컨트롤러에서 요청처리 후 DispatcherServlet으로 뷰 정보가 리턴되는 순간 낚아채는 영역
	 */
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		
		// true 리턴시 : 기존 흐름대로 해당 Controller 제대로 실행
		// false 리턴시 : Controller를 실행시키지 않겠다.
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginUser") != null) { // 로그인 후 => 정상적으로 Controller 실행
			return true;
		}else { // 로그인 전 => Controller 실행 안되도록
			
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());
			
			return false;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
