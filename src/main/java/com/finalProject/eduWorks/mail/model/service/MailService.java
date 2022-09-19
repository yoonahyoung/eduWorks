package com.finalProject.eduWorks.mail.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface MailService {

	// 1. 메일 작성 (임시 보관 포함)
	int insertMail(Mail m); // 메일 보내기
	int insertMailStatus(ArrayList<MailStatus> list); // 메일 상태 보내기
	int insertAttachment(ArrayList<Attachment> atList); // 첨부파일 보내기
	
	// 2. 임시저장
	// int insertTemporaryMail(Mail m); // 임시저장 보내기
	
	// 3. 보낸 메일 조회
	int sendListCount(String memNo); // 보낸 메일 개수 조회
	ArrayList<Mail> selectSendMailList(PageInfo pi, String memNo); // 메일 목록 조회
	
	// 3_2. 보낸 메일글 상세조회
	
	// 4. 받은 메일 조회
	int receiveListCount(String memEmail); // 받은 메일 개수 조회
	int receiveUnReadCount(String memEmail); // 받은 메일 중 안읽은 메일 개수 조회
	ArrayList<Mail> selectReceiveMailList(PageInfo pi, String memEmail); // 받은 메일 목록
	
	// 5. 중요메일 설정
	int updateImportant(MailStatus ms);
	
	// 6. 메일 작성시 '주소록에서 찾기'
	ArrayList<Member> selectPublicAddress(); // 전사 주소록
	int selectIndivBasicNum(String memNo); // 개인 주소록 기본번호 찾기
	ArrayList<Address> selectIndivAddress(Address a); // 해당 개인주소록에 등록된 연락처 목록 조회
	ArrayList<AddressOut> selectIndivCategory(Address a); // 개인 주소록 카테고리 목록 조회
	
	
	
	
	
	
	
	
	
	
	// 1_2. 메일 답장
//	int replyMail(Mail m);
	
	// 2. 메일 작성 (나에게)
//	int insertMailMe(Mail m);
	
		
	// 4. 받은 메일 조회
	
	// 4_2. 받은 메일글 상세조회
	
	// 5. 내게 쓴 메일 조회
	
	// 5_2. 내가 쓴 메일글 상세조회
	
	// 6. 임시 보관함 조회
	
	// 6_2. 임시 보관함 메일글 상세조회
	
	// 6_3. 임시 보관함 메일 작성
	
	// 7. 메일 삭제
	
	// 8. 휴지통 조회
	
	// 8_2. 휴지통 비우기
	
	// 9. 태그 추가
	
	// 10. 메일에 태그 설정하기
	
	// 11. 중요 메일 설정
	
	// 12. 중요 메일함 조회
	
	// 13. 읽은 메일함 조회
	
	// 14. 각 태그가 붙여진 메일 조회
	
	// 15. 안읽은 메일함 조회
	
	// 16. 메일 스팸 신고
	
	// 17. 스팸 메일함 조회
	
}
