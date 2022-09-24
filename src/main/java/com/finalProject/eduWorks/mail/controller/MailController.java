package com.finalProject.eduWorks.mail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.template.FileUpload;
import com.finalProject.eduWorks.common.template.Pagination;
import com.finalProject.eduWorks.mail.model.service.MailServiceImpl;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.mail.model.vo.Tag;
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
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);
		
		// 보낸 메일 개수 조회
		int listCount = mService.sendListCount(m);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 보낸 메일 조회
		ArrayList<Mail> list = mService.selectSendMailList(pi, m);
				
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
		
		// 로그인한 회원 번호
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		// 로그인한 회원 이메일
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);

		// 받은 메일 개수 조회
		int listCount = mService.receiveListCount(m);

		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 받은 메일 조회
		ArrayList<Mail> list = mService.selectReceiveMailList(pi, m);

		// 안읽은 메일 개수 조회
		int unreadList = mService.receiveUnReadCount(m);

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
	public ModelAndView importantMailList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setSendMail(memEmail);
		m.setReceiverMem(memEmail);
		
		// 중요 메일 개수 조회
		int listCount = mService.importantListCount(m);

		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 중요 메일 목록 조회
		ArrayList<Mail> list = mService.selectImportantMailList(pi, m);
		
		// 안읽은 메일 조회
		int unread = mService.importantUnReadCount(m);

		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("unread", unread);
		mv.setViewName("mail/importantMailList");
		
		return mv;
	}
	
	/**
	 * 6_1. 메일 전송
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
	 * 6_2. 주소록에서 찾기(전사 주소록)
	 * @return : 전사 주소록 목록
	 */
	@ResponseBody
	@RequestMapping(value="publicMailAddress.ad", produces="application/json; charset=UTF-8")
	public String ajaxSelectPublicAddresss() {
		ArrayList<Member> pAdd = mService.selectPublicAddress(); 
		return new Gson().toJson(pAdd);
	}

	/**
	 * 6_3. 주소록에서 찾기(개인 주소록-기본)
	 * @param memNo : 로그인한 회원 사번
	 * @return : 개인 주소록 및 그룹 목록
	 */
	@ResponseBody
	@RequestMapping(value="indivMailAddress.ad", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxSelectIndivAddress(String memNo) {

		String num =  String.valueOf(mService.selectIndivBasicNum(memNo));
		
		// 개인 주소록 기본 연락처 목록 조회
		Address a = new Address();
		a.setMemNo(memNo);
		a.setAddNo(num);
		
		ArrayList<Address> iAdd = mService.selectIndivAddress(a);
		ArrayList<AddressOut> category = mService.selectIndivCategory(a);
		
		Map<String, Object> result = new HashMap<>();
		result.put("iAdd", iAdd);
		result.put("c", category);
		
		return result;
		
	}
	
	/**
	 * 6_4. 주소록에서 찾기(개인 주소록-그룹)
	 * @param memNo : 로그인한 회원 사번
	 * @return : 개인 주소록 및 그룹 목록
	 */
	@ResponseBody
	@RequestMapping(value="indivMailAddressGroup.ad", produces="application/json; charset=UTF-8")
	public Map<String, Object> ajaxSelectIndivAddress(Address a) {
		
		ArrayList<Address> iAdd = mService.selectIndivAddress(a);
		ArrayList<AddressOut> category = mService.selectIndivCategory(a);
		
		Map<String, Object> result = new HashMap<>();
		result.put("iAdd", iAdd);
		result.put("c", category);
		
		return result;
		
	}
	
	/**
	 * 7. 메일 전송(나에게)
	 * @param m : 전송할 메일 정보
	 * @param upfile : 전송할 파일 정보
	 * @return : 보낸메일함 페이지
	 */
	@RequestMapping("insertMailToMe.ma")
	public String insertMailToMe(Mail m, MultipartFile[] upfile, HttpSession session) {

		// 보낸 사람 이메일
		String memEmail = ((Member)session.getAttribute("loginUser")).getMemEmail();
		
		// 나에게 보내기
		m.setReceiverMem(memEmail);
		
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
			ms.setReceiveMail(memEmail); // 받는 사람 이메일(전체)
			ms.setMailFolder(1);

			list.add(ms); // ArrayList<MailStatus>에 추가
			
			// ------------- 받은 메일 ------------
			MailStatus ms2 = new MailStatus();
			ms2.setSendMail(memEmail);
			ms2.setReceiveMail(memEmail); // 받는 사람 이메일(전체)
			ms2.setMailFolder(2);

			list.add(ms2); // ArrayList<MailStatus>에 추가

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

		return "redirect:sendMailToMeList.ma";
		
	}
	
		
	/**
	 * 8. 중요 메일 설정
	 * @param ms : 중요메일 표시한 메일의 정보 
	 * @return : 중요 메일 설정 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@ResponseBody
	@RequestMapping("updateImportant.ma")
	public String ajaxUpdateImportant(MailStatus ms, HttpSession session) {
		
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();

		if(ms.getMailFolder() == 1) {
			ms.setSendMail(memEmail);
		} else {
			ms.setReceiveMail(memEmail);
		}

		int result = mService.updateImportant(ms);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 9. 내게 쓴 메일함으로 이동
	 * @return : 내게 쓴 메일함 페이지
	 */
	@RequestMapping("sendMailToMeList.ma")
	public ModelAndView sendMailToMeList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);
		
		// 내게 쓴 메일 개수 조회
		int listCount = mService.sendToMeListCount(m);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 내게 쓴 메일 조회
		ArrayList<Mail> list = mService.selectSendToMeMailList(pi, m);
		
		// 안읽은 메일 조회
		int unread = mService.sendMeUnReadCount(m);

		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("unread", unread);
		mv.addObject("pi", pi);
		mv.setViewName("mail/sendToMeList");
		
		return mv;
	}
	
	
	/**
	 * 10. 휴지통으로 이동
	 * @return : 휴지통 페이지
	 */
	@RequestMapping("deleteMailList.ma")
	public ModelAndView deleteMailList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setSendMail(memEmail);
		m.setReceiverMem(memEmail);
		
		// 휴지통 개수 조회
		int listCount = mService.deleteListCount(m);

		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);

		// 휴지통 조회
		ArrayList<Mail> list = mService.selectDeleteMailList(pi, m);
		
		// 안읽은 메일 개수 조회
		int unreadList = mService.deleteUnReadCount(m);

		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("unread", unreadList);
		mv.setViewName("mail/deleteMailList");
		
		return mv;
	}
	
	/**
	 * 11. 읽은 메일함 페이지 이동
	 * @return : 읽은 메일함 페이지
	 */
	@RequestMapping("readMailList.ma")
	public ModelAndView readMailList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);
		
		// 읽은 개수 조회
		int listCount = mService.readListCount(m);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 읽은 메일 조회
		ArrayList<Mail> list = mService.selectReadMailList(pi, m);
				
		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("mail/readMailList");
		
		return mv;
	}
	
	/**
	 * 12. 안읽은 메일함 페이지 이동
	 * @return : 안읽은 메일함 페이지
	 */
	@RequestMapping("unReadMailList.ma")
	public ModelAndView unReadMailList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);
		
		// 안읽은 개수 조회
		int listCount = mService.unReadListCount(m);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 안읽은 메일 조회
		ArrayList<Mail> list = mService.selectUnReadMailList(pi, m);

		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.setViewName("mail/unReadMailList");
		
		return mv;
	}
	
	/**
	 * 13. 스팸 메일함 페이지 이동
	 * @return : 스팸 메일함 페이지
	 */
	@RequestMapping("spamMailList.ma")
	public ModelAndView spamMailList(@RequestParam(value="page", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		Mail m = new Mail();
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);
		
		// 스펨 메일 개수 조회
		int listCount = mService.spamMailListCount(m);
		
		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
		
		// 스팸 메일 조회
		ArrayList<Mail> list = mService.selectSpamMailList(pi, m);
		
		// 안읽은 메일 개수 조회
		int unreadList = mService.spamUnReadCount(m);

		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("unread", unreadList);
		mv.setViewName("mail/spamMailList");
		
		return mv;
	}
	
	/**
	 * 14_1. 메일 삭제 처리 
	 * @param ms : 로그인한 회원 사번, 이메일, 메일 구분(보낸/받은/참조), 메일 번호
	 * @return : 삭제 성공여부 (성공 : success | 실패 : fail)
	 */
	@ResponseBody
	@RequestMapping("deleteMail.ma")
	public String ajaxDeleteMail(MailStatus ms) {

		// 삭제하는 메일 목록을 담을 ArrayList
		ArrayList<MailStatus> list = new ArrayList<>();	

		// 결과값
		int result = 0;
		
		String[] mailNo = ms.getMailNo().split(",");
		for(String m : mailNo) {
			
			// =========== 보낸 메일 ===========
			if(ms.getReceiveMail() == null) {
				
				MailStatus ms2 = new MailStatus();
				
				ms2.setSendMail(ms.getSendMail());
				ms2.setMailNo(m);

				list.add(ms2);
				
				result = mService.deleteSendMail(list);
				
			// =========== 받은/참조 메일 ===========
			} else if (ms.getSendMail() == null){
				
				MailStatus ms3 = new MailStatus();
				
				ms3.setReceiveMail(ms.getReceiveMail());
				ms3.setMailNo(m);
				ms3.setMailFolder(ms.getMailFolder());
				
				list.add(ms3);

				result = mService.deleteReceiveMail(list);
			
			// ============= 나에게 쓴 메일 =============
			} else {
				
				MailStatus ms4 = new MailStatus();
				
				ms4.setSendMail(ms.getSendMail());
				ms4.setReceiveMail(ms.getReceiveMail());
				ms4.setMailNo(m);
				ms4.setMailFolder(ms.getMailFolder());
				
				list.add(ms4);

				result = mService.deleteSendToMeMail(list);
			}
			
		}

		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 14_2. 메일 전체 삭제(메일함 비우기)
	 * @param ms : 로그인한 회원 이메일
	 * @return : 메일함 비우기 성공여부
	 */
	@ResponseBody
	@RequestMapping("deleteAllMail.ma")
	public String deleteAllMail(MailStatus ms) {
		
		int result = mService.deleteAllMail(ms);
		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 15. 메일 상세 조회
	 * @param ms : 메일 번호, 메일 폴더(보낸/받은/참조), 로그인한 회원 사번 및 이메일
	 * @return : 메일 상세 조회 페이지	
	 */
	@RequestMapping("mailDetail.ma")
	public ModelAndView mailDetail(MailStatus ms, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		String memEmail = ( (Member)session.getAttribute("loginUser") ).getMemEmail();
		
		String flag = ms.getFlag();
		String text ="";
		String color ="";
		
		Mail detail = new Mail(); // 메일 상세조회
		
		// 메일 읽음 표시로 변경
		ms.setSendMail(memEmail);
		ms.setReceiveMail(memEmail);
		
		int update = 0;
		
		// ======== 보낸 / 받은메일 수량 조회 ========
		Mail m = new Mail();
		
		m.setMemNo(memNo);
		m.setReceiverMem(memEmail);
		
		int count = 0;
		int unread = 0;
		
		// ========= 태그 처리된 메일 이름/색상 조회 =========
		Tag t = new Tag();
		t.setMemNo(memNo);
		t.setTagNo(ms.getTagNo());
		
		// 태그 이름 조회
		Tag tInfo = mService.selectTagInfo(t);
		
		// ========= 첨부파일 목록 조회 ===========
		ArrayList<Attachment> atList = mService.selectAttachment(ms);
		
		switch(flag) {
		case "A" : text = "보낸 메일함";
				   detail = mService.selectMailDetail(ms);
				   update = mService.updateReadMail(ms);
				   count = mService.sendListCount(m); break;
		case "B" : text = "받은 메일함";
				   detail = mService.selectMailDetail(ms);
				   update = mService.updateReadMail(ms);
				   count = mService.receiveListCount(m);
				   unread = mService.receiveUnReadCount(m); break;
		case "C" : text = "내게쓴 메일함";
				   detail = mService.selectMailDetail(ms);
				   update = mService.updateReadMail(ms);
				   count = mService.sendToMeListCount(m);
				   unread = mService.sendMeUnReadCount(m); break;
		case "D" : text = "읽은 메일함";
				   detail = mService.selectMailDetail(ms);
				   update = mService.updateReadMail(ms);
				   count = mService.readListCount(m); break;
		case "E" : text = "안읽은 메일함";
				   detail = mService.selectMailDetail(ms);
				   update = mService.updateReadMail(ms);
				   count = mService.unReadListCount(m);
				   unread = mService.unReadListCount(m); break;
		case "F" : text = tInfo.getTagName();
				   color = tInfo.getTagColor();
				   detail = mService.selectMailDetail(ms);	
				   update = mService.updateReadMail(ms);
				   count = mService.readListCount(m);
				   unread = mService.tagUnReadCount(ms); break;
		case "G" : text = "중요 메일함";
				   detail = mService.selectMailDetail(ms);	
				   update = mService.updateReadMail(ms);
				   count = mService.importantListCount(m);
				   unread = mService.importantUnReadCount(m); break;
		case "H" : text = "휴지통";
				   detail = mService.selectMailDetail(ms);	
				   update = mService.updateReadMail(ms);
				   count = mService.deleteListCount(m);
				   unread = mService.deleteUnReadCount(m); break;
		}

		// 메일 조회 성공시
		if(update > 0) {
			
		mv.addObject("flag", flag);
		mv.addObject("text", text);
		mv.addObject("color", color);
		mv.addObject("count", count);
		mv.addObject("unread", unread);
		mv.addObject("m", detail);
		mv.addObject("at", atList);
		mv.setViewName("mail/mailDetailView");	

		}

		return mv;
		
	}
	
	/**
	 * 16_1. 태그 추가
	 * @param t : 로그인한 회원 사번, 태그명, 태그 색상
	 * @return : 태그 추가 성공여부 (성공 : "success" | 실패 : "fail")
	 */
	@ResponseBody
	@RequestMapping("insertTag.ma")
	public String ajaxInsertMailTag(Tag t) {

		int result = mService.insertTag(t);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 16_2. 태그 목록 조회
	 * @param memNo : 로그인한 회원 사번
	 * @return : 조회된 태그 목록
	 */
	@ResponseBody
	@RequestMapping(value="selectTagList.ma", produces="application/json; charset=UTF-8")
	public String ajaxSelectTagList(String memNo) {
		
		ArrayList<Tag> tList = mService.selectTagList(memNo);
		
		return new Gson().toJson(tList);
		
	}
	
	/**
	 * 16_3. 태그 수정
	 * @param t : 수정하고자하는 태그 이름, 태그 색상, 태그 번호
	 * @return : 태그 수정 성공여부 (성공 : "success" | 실패 : "fail")
	 */
	@ResponseBody
	@RequestMapping("updateTag.ma")
	public String ajaxUpdateTag(Tag t) {
		
		int result = mService.updateTag(t);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	/**
	 * 16_4. 태그 삭제
	 * @param t : 로그인한 회원 사번, 삭제하고자하는 태그 번호
	 * @return : 태그 삭제 성공여부 (성공 : "success" | 실패 : "fail")
	 */
	@ResponseBody
	@RequestMapping("deleteTag.ma")
	public String ajaxDeleteTag(Tag t) {
		
		int updateTag = mService.updateTagNull(t);
		int delete = 0;
		
		if(updateTag > 0) {
			delete = mService.deleteTag(t);			
		}
		
		int result = updateTag * delete;
		
		return result > 0 ? "success" : "fail";
	}
	
	/**
	 * 17. 선택한 메일에 태그 추가
	 * @param ms : 추가할 태그 번호, 선택한 메일 번호, 로그인한 회원 이메일
	 * @return : 선택한 메일에 태그 추가 성공여부 (성공 : "success" | 실패 : "fail")
	 */
	@ResponseBody
	@RequestMapping("insertMailTag.ma")
	public String ajaxInsertMailTag(MailStatus ms) {
		
		String[] mailNo = ms.getMailNo().split(",");
		int result = 0;
		
		ArrayList<MailStatus> list = new ArrayList<>();	
		System.out.println(list);
		
		for(String m : mailNo) {
			
			// =========== 보낸 메일 ===========
			if(ms.getReceiveMail() == null) {
				
				MailStatus ms2 = new MailStatus();
				
				ms2.setSendMail(ms.getSendMail());
				ms2.setTagNo(ms.getTagNo());
				ms2.setMailNo(m);
				ms2.setMailFolder(ms.getMailFolder());

				list.add(ms2);
				
				result = mService.insertMailTag(list);
				
			// =========== 받은/참조 메일 ===========
			} else if (ms.getSendMail() == null){
				
				MailStatus ms3 = new MailStatus();
				
				ms3.setReceiveMail(ms.getReceiveMail());
				ms3.setTagNo(ms.getTagNo());
				ms3.setMailNo(m);
				ms3.setMailFolder(ms.getMailFolder());
				
				list.add(ms3);

				result = mService.insertMailTag(list);
			
			// ============= 나에게 쓴 메일 =============
			} else {
				
				MailStatus ms4 = new MailStatus();
				
				ms4.setSendMail(ms.getSendMail());
				ms4.setReceiveMail(ms.getReceiveMail());
				ms4.setTagNo(ms.getTagNo());
				ms4.setMailNo(m);
				ms4.setMailFolder(ms.getMailFolder());
				
				list.add(ms4);

				result = mService.insertMailTag(list);
			}
			
		}
		
		System.out.println(result);
	
		return result > 0 ? "success" : "fail";
	}
	
	/**
	 * 18. 해당 태그가 첨부된 메일 목록 페이지 이동
	 * @param currentPage
	 * @param ms : 첨부된 태그 번호, 로그인한 회원 이메일
	 * @return : 해당 태그가 첨부된 메일 목록 페이지
	 */
	@RequestMapping("tagMailList.ma")
	public ModelAndView selectTagMailList(@RequestParam(value="page", defaultValue="1") int currentPage, MailStatus ms, ModelAndView mv, HttpSession session) {
		
		String memNo = ( (Member)session.getAttribute("loginUser") ).getMemNo();
		
		Tag t = new Tag();
		t.setMemNo(memNo);
		t.setTagNo(ms.getTagNo());
		
		// 태그 이름 조회
		Tag tInfo = mService.selectTagInfo(t);
		
		// 태그 메일 개수 조회
		int listCount = mService.tagListCount(ms);

		// 페이징
		PageInfo pi = Pagination.getInfo(listCount, currentPage, 10, 10);
				
		// 태그 메일 목록 조회
		ArrayList<Mail> list = mService.selectTagMailList(pi, ms);
				
		// 안읽은 메일 조회
		int unread = mService.tagUnReadCount(ms);

		System.out.println(t);
		System.out.println(tInfo);
		System.out.println(listCount);
		System.out.println(list);
		System.out.println(unread);

		mv.addObject("t", tInfo);
		mv.addObject("count", listCount);
		mv.addObject("list", list);
		mv.addObject("pi", pi);
		mv.addObject("unread", unread);
		mv.setViewName("mail/tagMailList");
				
		return mv;	
		
	}
	
	/**
	 * 19. 메일 답장 페이지로 이동
	 * @param mailNo : 답장할 메일 번호
	 * @return : 메일 답장 페이지
	 */
	@RequestMapping("replyMail.ma")
	public ModelAndView replayMail(String mailNo, ModelAndView mv) {
		
		Mail m = mService.replyMailForm(mailNo);
		
		mv.addObject("text", "R");
		mv.addObject("m", m);
		mv.setViewName("mail/replyMailForm");
		
		return mv;
		
	}

	
}
