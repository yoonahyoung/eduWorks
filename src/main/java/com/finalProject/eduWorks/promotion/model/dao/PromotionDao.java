package com.finalProject.eduWorks.promotion.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;

@Repository
public class PromotionDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("promotionMapper.selectListCount");
	}
	
	public ArrayList<Promotion> selectPromoList(SqlSessionTemplate sqlSession, PageInfo pi){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList) sqlSession.selectList("promotionMapper.selectPromoList", null, rowBounds);
	}

}
