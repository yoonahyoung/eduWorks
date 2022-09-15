package com.finalProject.eduWorks.mail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.template.FileUpload;
import com.finalProject.eduWorks.mail.model.service.MailServiceImpl;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Member;

@Controller
public class MailController {
	
	@Autowired
	private MailServiceImpl mService;
	
	/**
	 * 1. 보낸 메일함으로 이동
	 * @return : 보낸 메일함 페이지
	 */
	@RequestMapping("sendMailForm.ma")
	public String sendMailForm(Model model) {
		return "mail/sendMailList";
	}
	
	/**
	 * 2. 받은 메일함으로 이동
	 * @return : 받은 메일함 페이지
	 */
	@RequestMapping("receiveMailForm.ma")
	public String receiveMailForm(Model model) {
		return "mail/receiveMailList";
	}
	
	/**
	 * 3. 메일 작성 페이지로 이동
	 * @return : 메일 작성 페이지
	 */
	@RequestMapping("writeMailForm.ma")
	public String writeMailForm(Model model) {
		return "mail/writeMailForm";
	}
	
	/**
	 * 4. 메일 작성(나에게) 페이지로 이동
	 * @return : 메일 작성 페이지
	 */
	@RequestMapping("writeMailToMeForm.ma")
	public String writeMailToMeForm(Model model) {
		return "mail/writeMailToMeForm";
	}
	
	/**
	 * 중요 메일함으로 이동
	 * @return : 중요 메일함 페이지
	 */
	@RequestMapping("importantMailForm.ma")
	public String importantMailForm(Model model) {
		return "mail/importantMailList";
	}
	
	/**
	 * 5. 메일 전송
	 * @param m : 전송할 메일 정보
	 * @param upfile : 전송할 파일 정보
	 * @return : 보낸메일함 페이지
	 */
	@RequestMapping("insertMail.ma")
	public String insertMail(Mail m, MultipartFile[] upfile, HttpSession session, Model model) {
		
		System.out.println(upfile);
		
		// 회원 번호
		// String memNo = ((Member)session.getAttribute("loginUser")).getMemNo();
		
		// 보낸 사람 이메일
		String memEmail = ((Member)session.getAttribute("loginUser")).getMemEmail();

		// 메일 상태 (한명 또는 여러명에게 보낼 수 있음)
		ArrayList<MailStatus> list = new ArrayList<>();	
		
		// 첨부파일 (한개 또는 여러개 보낼 수 있음)
		ArrayList<Attachment> atList = new ArrayList<>();

		// 메일 보내기
		int result1 = mService.insertMail(m);
		// 메일 상태(보낸사람, 받는사람)
		int result2 = 0;
		// 첨부파일
		int result3 = 1; // (첨부파일 없으면 : 1 | 첨부파일 첨부시 => 성공 : 1 | 실패 : 0) 
		
		if(result1 > 0) {
			// 메일 보내기 성공 => 메일 상태에 insert하기
			
			// ----------- 보낸 메일 ------------
			MailStatus ms = new MailStatus();
			ms.setSendMail(memEmail);
			ms.setReceiveMail(m.getReceiverMem()); // 받는 사람 이메일(전체)
			ms.setMailFolder(1);
			
			list.add(ms); // ArrayList<MailStatus>에 추가
			
			// ------------- 받은 메일 ------------
			String[] receiveArr = m.getReceiverMem().split(","); // ','를 구분지어서 배열로 넣기
			System.out.println(receiveArr);
			
			for(String r : receiveArr) {
				System.out.println(r);
				
				MailStatus ms2 = new MailStatus();
				ms2.setSendMail(memEmail);
				ms2.setReceiveMail(r); // 받는 사람 이메일(','로 구분지은것)
				ms2.setMailFolder(2);
				
				list.add(ms2); // ArrayList<MailStatus>에 추가

			}

			
			// ------------ 참조 메일 ------------
			if( !m.getCcMem().equals("") ) { // 참조 이메일이 있는 경우
				
				String[] ccArr = m.getCcMem().split(","); 
				System.out.println(ccArr);
				
				for(String c : ccArr) {
					System.out.println(c);
					
					MailStatus ms3 = new MailStatus();
					ms3.setSendMail(memEmail);
					ms3.setReceiveMail(c); // 받는 사람 이메일(','로 구분지은것)
					ms3.setMailFolder(3);
					
					list.add(ms3); // ArrayList<MailStatus>에 추가
				}
				
			}

			// 메일 상태에 보내기 (성공 : 1 | 실패 : 0)
			result2 = mService.insertMailStatus(list);

		}


		// 첨부파일 보내기 (한개 또는 여러개)
		for (MultipartFile file : upfile) {

			if ( !file.getOriginalFilename().equals("") ) { // 첨부파일이 있는 경우

				// 저장 파일 경로!
				String saveFilePath = FileUpload.saveFile(file, session, "resources/uploadFiles/mailFiles/");

				// 첨부파일
				Attachment at = new Attachment();

				at.setAtOriginName(file.getOriginalFilename());
				at.setAtChangeName(saveFilePath);

				// at를 attachmentList에 담기
				atList.add(at);

				// 첨부파일 보내기 (성공 : 1 | 실패 : 0)

				System.out.println(file);

			}

			result3 += mService.insertAttachment(atList);
		}

		if(result1 > 0 && result2 > 0 && result3 > 0) {
			session.setAttribute("alertIcon", "success");
			session.setAttribute("alertTitle", "메일 전송 완료");
			session.setAttribute("alertMsg","성공적으로 메일을 보냈습니다.");
		} else {
			session.setAttribute("alertIcon", "error");
			session.setAttribute("alertTitle", "메일 전송 실패");
			session.setAttribute("alertMsg","메일 전송을 실패했습니다.");
		}

		return "redirect:sendMailForm.ma";
		
	}
	
	
	
}
