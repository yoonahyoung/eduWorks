package com.finalProject.eduWorks.mail.model.service;

import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;

public interface MailService {

	// 1. 메일 작성 (임시 보관 포함)
	int insertMail(Mail m);
	int insertMailStatus(MailStatus ms);
	
	// 1_2. 메일 답장
//	int replyMail(Mail m);
	
	// 2. 메일 작성 (나에게)
//	int insertMailMe(Mail m);
	
	// 3. 보낸 메일 조회
	
	// 3_2. 보낸 메일글 상세조회
		
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
