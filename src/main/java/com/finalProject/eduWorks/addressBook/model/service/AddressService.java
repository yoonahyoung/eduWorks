package com.finalProject.eduWorks.addressBook.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface AddressService {
	
	// 1. 전사 주소록 조회 (페이징)
	int selectListCount(); // 재직중인 사원수 조회
	ArrayList<Member> selectAddressList(PageInfo pi);
	
	// 2. 개인 주소록 조회
	
	// 3. 개인 주소록 등록
	
	// 4. 개인 주소록 추가
	
	// 5. 개인 주소록 삭제
	
	// 6. 연락처 삭제

}
