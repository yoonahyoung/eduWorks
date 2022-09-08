package com.finalProject.eduWorks.promotion.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.promotion.model.vo.Promotion;

@Repository
public class PromotionDao {
	
	// 게시글 리스트 개수 조회
	public int selectListCount(SqlSessionTemplate sqlSession, String keyword, String no) {
		// 동적 sql
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("no", no);
		
		return sqlSession.selectOne("promotionMapper.selectListCount", map);
	}
	
	// 게시글 리스트 조회
	public ArrayList<Promotion> selectPromoList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword, String no){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("no", no);
		
		return (ArrayList) sqlSession.selectList("promotionMapper.selectPromoList", map, rowBounds);
	}
	
	// 리스트 페이지에서 게시글 삭제시 삭제할 첨부파일 리스트 조회
	public ArrayList<Attachment> selectAtList(SqlSessionTemplate sqlSession, String checkCnt){
		String[] aArr = checkCnt.split(",");
		return (ArrayList) sqlSession.selectList("promotionMapper.selectAtList", aArr);
	}
	
	// 첨부파일 삭제
	public int deletePromoAt(SqlSessionTemplate sqlSession, String checkCnt) {
		String[] aArr = checkCnt.split(",");
		return sqlSession.delete("promotionMapper.deletePromoAt", aArr);
	}
	
	// 게시글 삭제
	public int deletePromo(SqlSessionTemplate sqlSession, String checkCnt) {
		
		String[] cArr = checkCnt.split(",");	// ["3", "4"]
		
		return sqlSession.update("promotionMapper.deletePromo", cArr);
	}
	
	// 게시글 상세조회시 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.update("promotionMapper.increaseCount", no);
	}
	
	// 게시글 상세조회
	public Promotion selectPromo(SqlSessionTemplate sqlSession, int no) {
		return sqlSession.selectOne("promotionMapper.selectPromo", no);
	}
	
	// 게시글의 댓글 개수 조회
	public int selectReplyCount(SqlSessionTemplate sqlSession, int promoNo) {
		return sqlSession.selectOne("promotionMapper.selectReplyCount", promoNo);
	}
	
	// 게시글 댓글 리스트 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int promoNo){
		return (ArrayList) sqlSession.selectList("promotionMapper.selectReplyList", promoNo);
	}
	
	// 게시글 대댓글 리스트 조회
	public ArrayList<Reply> selectRReplyList(SqlSessionTemplate sqlSession, int promoNo){
		return (ArrayList) sqlSession.selectList("promotionMapper.selectRReplyList", promoNo);
	}
	
	// 첨부파일 조회
	public Attachment selectAt(SqlSessionTemplate sqlSession, int promoNo) {
		return sqlSession.selectOne("promotionMapper.selectAt", promoNo);
	}
	
	// 게시글 수정
	public int updatePromo(SqlSessionTemplate sqlSession, Promotion p) {
		return sqlSession.update("promotionMapper.updatePromo", p);
	}
	
	// 게시글 첨부파일 수정
	public int updateAt(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("promotionMapper.updateAt", at);
	}
	
	// 게시글 등록
	public int insertPromo(SqlSessionTemplate sqlSession, Promotion p) {
		return sqlSession.insert("promotionMapper.insertPromo", p);
	}
	
	// 게시글의 마지막 번호 가져오기
	public int selectLastNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("promotionMapper.selectLastNo");
	}
	
	// 게시글 첨부파일 등록
	public int insertAt(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("promotionMapper.insertAt", at);
	}
	
}
