package com.finalProject.eduWorks.addressBook.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 * @author 은영
 * 
 * @param addPerNo : 개인 주소록 번호
 * @param memNo : 주소록 추가한 회원 번호
 * @param addNo : 주소록 그룹 번호
 * @param addName : 주소록 그룹 명
 * @param addDept : 부서이름
 * @param addJob : 직급이름
 * @param addPhone : 전화번호
 * @param addEmail : 이메일
 * @param addMemo : 메모
 * @param addEnrollDate : 연락처 등록일
 *
 */

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Address {
	
	// 은영
	
	private int addPerNo;
	private String memNo;
	private String addNo;
	private String addName;
	private String addDept;
	private String addJob;
	private String addPhone;
	private String addEmail;
	private String addMemo;
	private String addEnrollDate;

}
