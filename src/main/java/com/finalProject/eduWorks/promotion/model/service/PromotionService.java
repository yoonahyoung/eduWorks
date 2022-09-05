package com.finalProject.eduWorks.promotion.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;

public interface PromotionService {
	
	// 리스트 페이지 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Promotion> selectPromoList(PageInfo pi);
	
	// 작성 서비스
	int insertPromo(Promotion p);
	
	// 상세 조회 서비스
	int increaseCount(int promoNo);
	Promotion selectPromo(int promoNo);
	
	// 수정 서비스
	int updatePromo(Promotion p);
	
	// 삭제 서비스
	int deletePromo(Promotion p);
	
	// 댓글 리스트 조회용 서비스 (AJAX)
	
	// 댓글 작성 서비스 (ajax)
	
	// 댓글 수정 서비스 (ajax)
	
	// 댓글 삭제 서비스 (ajax)

}
