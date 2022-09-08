package com.finalProject.eduWorks.promotion.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
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
		return pDao.insertPromo(sqlSession, p);
	}
	
	@Override
	public int selectLastNo() {
		return pDao.selectLastNo(sqlSession);
	}
	
	@Override
	public int insertAt(Attachment at) {
		return pDao.insertAt(sqlSession, at);
	}

	@Override
	public int increaseCount(int promoNo) {
		return pDao.increaseCount(sqlSession, promoNo);
	}

	@Override
	public Promotion selectPromo(int promoNo) {
		return pDao.selectPromo(sqlSession, promoNo);
	}

	@Override
	public int selectReplyCount(int promoNo) {
		return pDao.selectReplyCount(sqlSession, promoNo);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int promoNo) {
		return pDao.selectReplyList(sqlSession, promoNo);
	}
	
	@Override
	public ArrayList<Reply> selectRReplyList(int promoNo) {
		return pDao.selectRReplyList(sqlSession, promoNo);
	}
	
	@Override
	public Attachment selectAt(int promoNo) {
		return pDao.selectAt(sqlSession, promoNo);
	}

	@Override
	public int updatePromo(Promotion p) {
		return pDao.updatePromo(sqlSession, p);
	}
	
	@Override
	public int updateAt(Attachment at) {
		return pDao.updateAt(sqlSession, at);
	}

	@Override
	public ArrayList<Attachment> selectAtList(String checkCnt) {
		return pDao.selectAtList(sqlSession, checkCnt);
	}
	
	@Override
	public int deletePromoAt(String checkCnt) {
		return pDao.deletePromoAt(sqlSession, checkCnt);
	}
	
	@Override
	public int deletePromo(String checkCnt) {
		return pDao.deletePromo(sqlSession, checkCnt);
	}



}
