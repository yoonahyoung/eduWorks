package com.finalProject.eduWorks.addressBook.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface AddressService {
	
	// 1. 전사 주소록 조회 (페이징)
	int selectListCount(); // 재직중인 사원수 조회
	ArrayList<Member> selectAddressList(PageInfo pi);
	
	// 2. 개인 주소록 조회 (기본페이지 - '개인주소록')
	
	// 개인 주소록 기본('개인주소록') 번호 조회
	int basicAddressNum(String memNo);
	
	// 개인 기본 주소록에 들어가는 사람 수 조회
	int selectAddBasicCount(String memNo, String addNo); // 회원 번호, 기본 주소록 번호 필요
		
	// 개인 주소록 기본 목록 조회
	ArrayList<Address> selectAddIndivList(PageInfo pi, String memNo, String addNo);

	// 개인 주소록 카테고리 목록 조회
	ArrayList<AddressOut> selectAddCategory(String memNo);
	
	
	
	// 3. 개인 주소록 등록
	
	// 4. 개인 주소록 추가
	
	// 5. 개인 주소록 삭제
	
	// 6. 연락처 삭제

}
