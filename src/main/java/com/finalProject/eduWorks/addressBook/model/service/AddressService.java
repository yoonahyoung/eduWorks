package com.finalProject.eduWorks.addressBook.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface AddressService {
	
	// 1. 전사 주소록 조회 (페이징)
	int selectListCount(); // 재직중인 사원수 조회
	ArrayList<Member> selectAddressList(PageInfo pi, String range);
	
	// 2. 개인 주소록 조회 (기본페이지 - '개인주소록')
	
	// 개인 주소록 기본('개인주소록') 번호 조회
	int basicAddressNum(String memNo);
	
	// 개인 기본 주소록에 들어가는 사람 수 조회
	int selectIndivNumCount(Address a); // 회원 번호, 기본 주소록 번호 필요
		
	// 개인 주소록 기본 목록 조회
	ArrayList<Address> selectAddIndivList(PageInfo pi, Address a, String range);

	// 개인 주소록 카테고리 목록 조회
	ArrayList<AddressOut> selectAddCategory(Address a);

	// 3. 개인 주소록 그룹 추가
	int ajaxInsertAddIndiv(AddressOut ado);

	// 4. 개인 주소록 연락처 추가
	int insertAddIndivNum(Address a);

	// 5. 개인 주소록 그룹 삭제
	
	// 주소록 그룹에 해당된 연락처들 전체 삭제
	int deleteAllIndivAddNum(Address a);
	
	// 주소록 그룹 삭제
	int deleteIndivAddressBook(Address a);

	// 6. 선택한 연락처 삭제
	int deleteIndivAddNum(String addPerNo);
	
	// 7. 선택한 연락처 수정
	
	// 선택한 연락처 정보 조회
	Address ajaxSelectAddInfo(String addPerNo);
	
	// 선택한 연락처 정보 수정
	int updateIndivAddress(Address a);
	
	// 8_1. 연락처 검색 리스트 조회 (개인 주소록)
	
	// 검색시 나오는 연락처 수 조회
	int searchIndivCount(String keyword, Address a);
	
	// 검색 목록 조회
	ArrayList<Address> searchIndivAdd(PageInfo pi, String keyword, Address a, String range);
	
	// 8_2. 연락처 검색 리스트 조회 (전사 주소록)
	
	// 검색시 나오는 연락처 수 조회
	int searchPublicCount(String keyword);
	
	// 검색 목록 조회
	ArrayList<Member> searchPublicAdd(PageInfo pi, String keyword, String range);
	
	// 9. 개인 주소록 그룹명 수정
	int updateIndivAddGroup(AddressOut ad);
}
