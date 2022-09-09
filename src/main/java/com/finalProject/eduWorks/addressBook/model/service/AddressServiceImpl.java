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
	public ArrayList<Member> selectAddressList(PageInfo pi) {
		return aDao.selectAddressList(sqlSession, pi);
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
	 * 2_2. 개인 주소록 '개인주소록'에 등록된 연락처 수 조회
	 * @param memNo : 로그인한 회원 번호
	 * @param addNo : 로그인한 회원의 개인 주소록 번호
	 * @return : 등록된 연락처 수
	 */
	@Override
	public int selectAddBasicCount(Address a) {
		return aDao.selectAddBasicCount(sqlSession, a);
	}

	/**
	 * 2_3. 개인 주소록 '개인주소록'에 저장된 연락처 목록 조회
	 * @param memNo : 로그인한 회원 번호
	 * @param addNo : 로그인한 회원의 개인 주소록 번호
	 * @return : 조회된 연락처 목록이 담긴 ArrayList<Address>
	 */
	@Override
	public ArrayList<Address> selectAddIndivList(PageInfo pi, Address a) {
		return aDao.selectAddIndivList(sqlSession, pi, a);
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
	 * 4. 개인 주소록 그룹 중 선택한 페이지로 이동
	 * @param a : 로그인한 회원 아이디, 개인 주소록 번호
	 * @return : 선택한 개인 주소록 그룹 페이지 정보
	 */
	@Override
	public int selectIndivNumCount(Address a) {
		return aDao.selectIndivNumCount(sqlSession, a);
	}
	
	
	@Override
	public int insertAddIndivNum(Address a) {
		return aDao.insertAddIndivNum(sqlSession, a);
	}
	


}
