package com.finalProject.eduWorks.addressBook.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.addressBook.model.dao.AddressDao;
import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1_1. 공용 주소록에 들어가는 사원 수 조회
	 * @return : 재직중인 사원 수
	 */
	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}

	/**
	 * 1_2. 공용 주소록에 들어갈 재직중인 사원 목록
	 * @param pi : 페이징 처리
	 * @return : 재직중인 사원 목록이 들어간 ArrayList<Member>
	 */
	@Override
	public ArrayList<Member> selectAddressList(PageInfo pi, String range) {
		return aDao.selectAddressList(sqlSession, pi, range);
	}

	/**
	 * 2_1. 개인 주소록 '개인주소록' 번호 조회 (기본페이지)
	 * @param memNo : 개인 주소록 조회할 회원 번호
	 * @return : '개인주소록' 번호
	 */
	@Override
	public int basicAddressNum(String memNo) {
		return aDao.basicAddressNum(sqlSession, memNo);
	}

	/**
	 * 2_2. 개인 주소록 그룹 중 등록된 연락처 갯수 조회
	 * @param a : 로그인한 회원 아이디, 개인 주소록 번호
	 * @return : 선택한 개인 주소록 그룹 중 등록된 연락처 갯수
	 */
	@Override
	public int selectIndivNumCount(Address a) {
		return aDao.selectIndivNumCount(sqlSession, a);
	}

	/**
	 * 2_3. 개인 주소록 '개인주소록'에 저장된 연락처 목록 조회
	 * @param memNo : 로그인한 회원 번호
	 * @param addNo : 로그인한 회원의 개인 주소록 번호
	 * @return : 조회된 연락처 목록이 담긴 ArrayList<Address>
	 */
	@Override
	public ArrayList<Address> selectAddIndivList(PageInfo pi, Address a, String range) {
		return aDao.selectAddIndivList(sqlSession, pi, a, range);
	}

	/**
	 * 2_4. 개인 주소록 카테고리 목록 조회
	 * @param memNo : 로그인한 회원 번호
	 * @return : 등록한 카테고리 목록이 담긴 ArrayList<AddressOut>
	 */
	@Override
	public ArrayList<AddressOut> selectAddCategory(Address a) {
		return aDao.selectAddCategory(sqlSession, a);
	}

	/**
	 * 3. 개인 주소록 그룹 추가
	 * @param ado : 로그인한 회원 번호, 추가하고자하는 그룹 명
	 * @return : 그룹 추가 성공 여부가 담긴 int형 변수 (성공 : 1 : 실패 : 0)
	 */
	@Override
	public int ajaxInsertAddIndiv(AddressOut ado) {
		return aDao.ajaxInsertAddIndiv(sqlSession, ado);
	}
	
	/**
	 * 4. 개인 주소록 그룹 중 선택한 그룹에 연락처 등록
	 * @param a : 연락처 정보
	 * @return : 등록 성공 여부 (성공 : success | 실패 : fail)
	 */
	@Override
	public int insertAddIndivNum(Address a) {
		return aDao.insertAddIndivNum(sqlSession, a);
	}

	/**
	 * 5_1. 개인 주소록 그룹 중 선택한 그룹의 연락처 삭제
	 * @param a : 로그인한 회원, 주소록 그룹 번호
	 * @return : 삭제 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int deleteAllIndivAddNum(Address a) {
		return aDao.deleteAllIndivAddNum(sqlSession, a);
	}
	
	/**
	 * 5_2. 개인 주소록 그룹 중 선택한 그룹 삭제
	 * @param a : 로그인한 회원, 주소록 그룹 번호
	 * @return : 삭제 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int deleteIndivAddressBook(Address a) {
		return aDao.deleteIndivAddressBook(sqlSession, a);
	}

	/**
	 * 6. 선택한 연락처 삭제 
	 * @param addPerNo : 선택한 연락처 번호
	 * @return : 삭제 성공 여부 (성공 : sucess | 실패 : fail)
	 */
	@Override
	public int deleteIndivAddNum(String addPerNo) {
		return aDao.deleteIndivAddNum(sqlSession, addPerNo);
	}

	/**
	 * 7_1. 선택한 연락처 정보 조회
	 * @param addPerNo : 선택한 연락처 번호
	 * @return : 선택한 연락처 정보
	 */
	@Override
	public Address ajaxSelectAddInfo(String addPerNo) {
		return aDao.ajaxSelectAddInfo(sqlSession, addPerNo);
	}

	/**
	 * 7_2. 선택한 연락처 정보 수정
	 * @param a : 수정된 연락처 정보
	 * @return : 수정 성공 여부 (성공 : success | 실패 : fail)
	 */
	@Override
	public int updateIndivAddress(Address a) {
		return aDao.updateIndivAddress(sqlSession, a);
	}

	/**
	 * 8_1. 연락처 검색시 나오는 연락처 수 조회 (개인 주소록)
	 * @param keyword : 검색어
	 * @param a : 로그인한 회원, 주소록 그룹 번호
	 * @return : 검색시 나오는 연락처 수
	 */
	@Override
	public int searchIndivCount(String keyword,  Address a) {
		return aDao.searchIndivCount(sqlSession, keyword, a);
	}

	/**
	 * 8_2. 연락처 검색시 나오는 연락처 목록 조회 (개인 주소록)
	 * @param keyword : 검색어
	 * @param a : 로그인한 회원, 주소록 그룹 번호
	 * @return : 검색시 나오는 연락처 목록
	 */
	@Override
	public ArrayList<Address> searchIndivAdd(PageInfo pi, String keyword,  Address a, String range) {
		return aDao.searchIndivAdd(sqlSession, pi, keyword, a, range);
	}
	
	/**
	 * 8_3. 연락처 검색시 나오는 연락처 수 조회 (전사 주소록)
	 * @param keyword : 검색어
	 * @return : 검색시 나오는 연락처 수
	 */
	@Override
	public int searchPublicCount(String keyword) {
		return aDao.searchPublicCount(sqlSession, keyword);
	}

	/**
	 * 8_4. 연락처 검색시 나오는 연락처 목록 조회 (전사 주소록)
	 * @param pi : 페이징
	 * @param keyword : 검색어
	 * @return : 검색시 나오는 연락처 목록
	 */
	@Override
	public ArrayList<Member> searchPublicAdd(PageInfo pi, String keyword, String range) {
		return aDao.searchPublicAdd(sqlSession, pi, keyword, range);
	}
	
	/**
	 * 9. 개인 연락처 그룹명 수정
	 * @param ad : 수정하고자하는 그룹명, 로그인한 회원 사번, 수정하고자하는 그룹 번호
	 * @return : 그룹명 수정 성공여부
	 */
	@Override
	public int updateIndivAddGroup(AddressOut ad) {
		return aDao.updateIndivAddGroup(sqlSession, ad);
	}
	
}
