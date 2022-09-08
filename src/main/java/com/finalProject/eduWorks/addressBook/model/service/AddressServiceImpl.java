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

	@Override
	public int basicAddressNum(String memNo) {
		return aDao.basicAddressNum(sqlSession, memNo);
	}

	@Override
	public int selectAddBasicCount(String memNo, String addNo) {
		return aDao.selectAddBasicCount(sqlSession, memNo, addNo);
	}

	@Override
	public ArrayList<Address> selectAddIndivList(PageInfo pi, String memNo, String addNo) {
		return aDao.selectAddIndivList(sqlSession, pi, memNo, addNo);
	}

	@Override
	public ArrayList<AddressOut> selectAddCategory(String memNo) {
		return aDao.selectAddCategory(sqlSession, memNo);
	}

}
