package com.finalProject.eduWorks.addressBook.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 * @author 은영
 * @param addNo : 주소록 그룹 번호
 * @param memNo : 주소록 추가한 사원번호
 * @param addName : 주소록명
 * @param addEnrollDate : 주소록 생성일
 *
 */
@NoArgsConstructor
@Setter
@Getter
@ToString
public class AddressOut {
	
	// 은영

	private int addNo;
	private String memNo;
	private String addName;
	private String addEnrollDate;

}
