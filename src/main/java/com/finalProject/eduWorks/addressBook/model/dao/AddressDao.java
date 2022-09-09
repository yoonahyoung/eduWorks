package com.finalProject.eduWorks.addressBook.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

@Repository
public class AddressDao {
	
	/**
	 * 1_1. 공용 주소록에 들어가는 사원 수 조회
	 * @return : 재직중인 사원 수
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.selectListCount");
	}
	
	/**
	 * 1_2. 공용 주소록에 들어갈 재직중인 사원 목록
	 * @param pi : 페이징 처리
	 * @return : 재직중인 사원 목록이 들어간 ArrayList<Member>
	 */
	public ArrayList<Member> selectAddressList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressList",null, rowBounds);

	}
	
	/**
	 * 2_1. 개인 주소록 '개인주소록' 번호 조회 (기본페이지)
	 * @param memNo : 로그인한 회원 번호
	 * @return : '개인주소록' 번호
	 */
	public int basicAddressNum(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.selectOne("addressMapper.basicAddressNum", memNo);
	}
	
	/**
	 * 2_2. 개인 주소록 '개인주소록'에 등록된 연락처 수 조회
	 * @param memNo : 로그인한 회원 번호
	 * @param addNo : 로그인한 회원의 개인 주소록 번호
	 * @return : 등록된 연락처 수
	 */
	public int selectAddBasicCount(SqlSessionTemplate sqlSession, Address a) {
	
		return sqlSession.selectOne("addressMapper.selectAddBasicCount", a);
	
	}
	
	/**
	 * 2_3. 개인 주소록 '개인주소록'에 저장된 연락처 목록 조회
	 * @param memNo : 로그인한 회원 번호
	 * @param addNo : 로그인한 회원의 개인 주소록 번호
	 * @return : 조회된 연락처 목록이 담긴 ArrayList<Address>
	 */
	public ArrayList<Address> selectAddIndivList(SqlSessionTemplate sqlSession, PageInfo pi, Address a){
				
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddIndivList", a, rowBounds);
		
	}
	
	/**
	 * 2_4. 개인 주소록 카테고리 목록 조회
	 * @param memNo : 로그인한 회원 번호
	 * @return : 등록한 카테고리 목록이 담긴 ArrayList<AddressOut>
	 */
	public ArrayList<AddressOut> selectAddCategory(SqlSessionTemplate sqlSession, Address a){
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddCategory", a);		
	}
	
	/**
	 * 3. 개인 주소록 그룹 추가
	 * @param ado : 로그인한 회원 번호, 추가하고자하는 그룹 명
	 * @return : 그룹 추가 성공 여부가 담긴 int형 변수 (성공 : 1 : 실패 : 0)
	 */
	public int ajaxInsertAddIndiv(SqlSessionTemplate sqlSession, AddressOut ado) {
		return sqlSession.insert("addressMapper.insertAddIndiv", ado);
	}
	
	/**
	 * 4. 개인 주소록 그룹 중 선택한 페이지로 이동
	 * @param a : 로그인한 회원 아이디, 개인 주소록 번호
	 * @return : 선택한 개인 주소록 그룹 페이지 정보
	 */
	public int selectIndivNumCount(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.selectOne("addressMapper.selectIndivNumCount", a);
	}
	
	public int insertAddIndivNum(SqlSessionTemplate sqlSession, Address a) {
		return sqlSession.insert("addressMapper.insertAddIndivNum", a);
	}


}
