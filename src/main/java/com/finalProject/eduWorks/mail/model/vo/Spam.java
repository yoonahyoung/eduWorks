package com.finalProject.eduWorks.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 * @author 은영
 * 
 * @param memAddress : 스팸처리한 회원 이메일
 * @param spamMem : 스팸처리된 회원 이메일
 * @param spamDate : 스팸처리한 날짜
 *
 */

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Spam {
	
	private String memAddress;
	private String spamMem;
	private String spamDate;

}
