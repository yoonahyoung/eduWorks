package com.finalProject.eduWorks.promotion.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;

@Service
public interface PromotionService {
	
	// 리스트 페이지 조회 서비스 (페이징)
	int selectListCount(String keyword, String no);
	ArrayList<Promotion> selectPromoList(PageInfo pi, String keyword, String no);
	
	// 작성 서비스
	int insertPromo(Promotion p);
	int selectLastNo();
	int insertAt(Attachment at);
	
	// 상세 조회 서비스
	int increaseCount(int promoNo);
	Promotion selectPromo(int promoNo);
	int selectReplyCount(int promoNo);
	ArrayList<Reply> selectReplyList(int promoNo);
	ArrayList<Reply> selectRReplyList(int promoNo);
	Attachment selectAt(int promoNo);
	
	// 수정 서비스
	int updatePromo(Promotion p);
	int updateAt(Attachment at);
	
	// 삭제 서비스
	
	// 선택 삭제 서비스 (AJAX)
	ArrayList<Attachment> selectAtList(String checkCnt);
	int deletePromoAt(String checkCnt);
	int deletePromo(String checkCnt);
	
	// 댓글 리스트 조회용 서비스 (AJAX)
	
	// 댓글 작성 서비스 (ajax)
	
	// 댓글 수정 서비스 (ajax)
	
	// 댓글 삭제 서비스 (ajax)

}
