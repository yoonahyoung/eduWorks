package com.finalProject.eduWorks.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MailController {
	
	/**
	 * 보낸 메일함으로 이동
	 * @return : 보낸 메일함 페이지
	 */
	@RequestMapping("sendMailForm.ma")
	public String sendMailForm(Model model) {
		return "mail/sendMailList";
	}
	
	/**
	 * 받은 메일함으로 이동
	 * @return : 받은 메일함 페이지
	 */
	@RequestMapping("receiveMailForm.ma")
	public String receiveMailForm(Model model) {
		return "mail/receiveMailList";
	}
	
	/**
	 * 메일 작성 페이지로 이동
	 * @return : 메일 작성 페이지
	 */
	@RequestMapping("writeMailForm.ma")
	public String writeMailForm(Model model) {
		return "mail/writeMailForm";
	}
	
	@RequestMapping("importantMailForm.ma")
	public String importantMailForm(Model model) {
		return "mail/importantMailList";
	}
	
}
