package com.finalProject.eduWorks.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 * @author 은영
 * 
 * @param mailNo : 메일번호
 * @param memNo : 메일보낸사람
 * @param tagNo : 태그번호
 * @param memTemporary : 임시메일 여부 (전송완료 : Y, 임시저장 : T)
 * @param receiverMem : 받은 사람 메일
 * @param ccMem : 참조 메일 
 * @param mailTitle : 메일 제목
 * @param mailContent : 메일 내용
 * @param sendDate : 보낸/받은 시간
 *
 */
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Mail {
	
	private int mailNo;
	private String memNo;
	private int tagNo;
	private String memTemporary;
	private String receiverMem;
	private String ccMem;
	private String mailTitle;
	private String mailContent;
	private String mailType;
	private String sendDate;
	
	

}
