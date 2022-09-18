package com.finalProject.eduWorks.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.FileUpload;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.mail.model.service.MailServiceImpl;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.google.gson.Gson;

@Controller
public class MailController {
	
	@Autowired
	private MailServiceImpl mService;
	
	/**
	 * 1. 보낸 메일함으로 이동
	 * @return : 보낸 메일함 페이지
	 */
	@RequestMapping("sendMailList.ma")
	public ModelAndView sendMailList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		
		// 보낸 메일 개수 조회
		int listCount = mService.sendListCount(memNo);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 보낸 메일 조회
		ArrayList<Mail> list = mService.selectSendMailList(pi, memNo);
				
		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("mail/sendMailList");
		
		return mv;
	}
	
	/**
	 * 2. 받은 메일함으로 이동
	 * @return : 받은 메일함 페이지
	 */
	@RequestMapping("receiveMailList.ma")
	public ModelAndView receiveMailList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		// 로그인한 회원 이메일
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		// 받은 메일 개수 조회
		int listCount = mService.receiveListCount(memEmail);

		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 받은 메일 조회
		ArrayList<Mail> list = mService.selectReceiveMailList(pi, memEmail);
		
		// 안읽은 메일 개수 조회
		int unreadList = mService.receiveUnReadCount(memEmail);
		
		mv.addObject("count", listCount);
		mv.addObject("unread", unreadList);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("mail/receiveMailList");
		
		return mv;

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
	 * 5. 중요 메일함으로 이동
	 * @return : 중요 메일함 페이지
	 */
	@RequestMapping("importantMailList.ma")
	public String importantMailList(Model model) {
		return "mail/importantMailList";
	}
	
	/**
	 * 6. 메일 전송
	 * @param m : 전송할 메일 정보
	 * @param upfile : 전송할 파일 정보
	 * @return : 보낸메일함 페이지
	 */
	@RequestMapping("insertMail.ma")
	public String insertMail(Mail m, MultipartFile[] upfile, HttpSession session) {

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
			}
			
		}
		
		// 첨부파일 보내기
		if(atList.size() > 0) { // 첨부파일이 추가된 경우
			result3 = mService.insertAttachment(atList);
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

		return "redirect:sendMailList.ma";
		
	}
	
	/**
	 * 7. 중요 메일 설정
	 * @param ms : 중요메일 표시한 메일의 정보 
	 * @return : 중요 메일 설정 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@ResponseBody
	@RequestMapping("updateImportant.ma")
	public String ajaxUpdateImportant(MailStatus ms) {
		System.out.println(ms);
		int result = mService.updateImportant(ms);
		
		return result > 0 ? "success" : "fail";
		
	}

	
}
