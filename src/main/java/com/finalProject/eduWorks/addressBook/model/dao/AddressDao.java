package com.finalProject.eduWorks.addressBook.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.member.model.vo.Member;

@Repository
public class AddressDao {
	
	/**
	 * 1. 공용 주소록에 들어가는 사원 수 조회
	 * @return : 재직중인 사원 수
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.selectListCount");
	}
	
	/**
	 * 1_1. 공용 주소록에 들어갈 재직중인 사원 목록
	 * @param pi : 페이징 처리
	 * @return : 재직중인 사원 목록이 들어간 ArrayList<Member>
	 */
	public ArrayList<Member> selectAddressList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressList",null, rowBounds);

	}

}
