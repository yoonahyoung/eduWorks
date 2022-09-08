package com.finalProject.eduWorks.promotion.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;

@Repository
public class PromotionDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession, String keyword, String no) {
		// 동적 sql
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("no", no);
		
		return sqlSession.selectOne("promotionMapper.selectListCount", map);
	}
	
	public ArrayList<Promotion> selectPromoList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword, String no){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("no", no);
		
		return (ArrayList) sqlSession.selectList("promotionMapper.selectPromoList", map, rowBounds);
	}
	
	public ArrayList<Attachment> selectAtList(SqlSessionTemplate sqlSession, String checkCnt){
		String[] aArr = checkCnt.split(",");
		return (ArrayList) sqlSession.selectList("promotionMapper.selectAtList", aArr);
	}
	
	public int deletePromoAt(SqlSessionTemplate sqlSession, String checkCnt) {
		String[] aArr = checkCnt.split(",");
		return sqlSession.delete("promotionMapper.deletePromoAt", aArr);
	}
	
	public int deletePromo(SqlSessionTemplate sqlSession, String checkCnt) {
		
		String[] cArr = checkCnt.split(",");	// ["3", "4"]
		
		return sqlSession.update("promotionMapper.deletePromo", cArr);
	}

}
