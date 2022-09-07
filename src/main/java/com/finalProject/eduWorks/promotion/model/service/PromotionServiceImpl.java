package com.finalProject.eduWorks.promotion.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.promotion.model.dao.PromotionDao;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;

@Service
public class PromotionServiceImpl implements PromotionService {
	
	@Autowired
	private PromotionDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount(String keyword, String no) {
		return pDao.selectListCount(sqlSession, keyword, no);
	}

	@Override
	public ArrayList<Promotion> selectPromoList(PageInfo pi, String keyword, String no) {
		return pDao.selectPromoList(sqlSession, pi, keyword, no);
	}

	@Override
	public int insertPromo(Promotion p) {
		return 0;
	}

	@Override
	public int increaseCount(int promoNo) {
		return 0;
	}

	@Override
	public Promotion selectPromo(int promoNo) {
		return null;
	}

	@Override
	public int updatePromo(Promotion p) {
		return 0;
	}

	@Override
	public int deletePromo(String checkCnt) {
		return pDao.deletePromo(sqlSession, checkCnt);
	}

}
