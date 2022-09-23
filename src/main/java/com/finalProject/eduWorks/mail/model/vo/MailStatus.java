package com.finalProject.eduWorks.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 * @author 은영
 * 
 * @param mailNo : 메일 번호(mail클래스와 조인)
 * @param tagNo : 태그 번호 (tag클래스와 조인)
 * @param sendMail : 보낸 이메일
 * @param receiveMail : 받은 이메일
 * @param mailFolder : 메일 상태 (보낸 메일 : 1, 받은 메일 : 2, 참조 메일 : 3)
 * @param mailRead : 메일 읽음 유무 (읽음 : Y, 안읽음 : N)
 * @param mailDelete : 메일 삭제 유무 (삭제 : Y, 삭제안함 : N)
 * @param mailSpam : 메일 스팸 유무 (스팸 : Y, 스팸아님 : N)
 * @param mailImportant : 메일 중요표시 유무 (중요함 : Y, 안중요 : N)
 * @param mailChangeDate : 매일 상태 변경 날짜
 *
 */
@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailStatus {
	
	private String mailNo;
	private int tagNo;
	private String sendMail;
	private String receiveMail;
	private int mailFolder;
	private String mailRead;
	private String mailDelete;
	private String mailSpam;
	private String mailImportant;
	private String mailChangeDate;
	
	// ========== 추가 ==========
	private String flag;

}
