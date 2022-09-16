package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.board.model.dao.BlindDao;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Like;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

@Service
public class BlindServiceImpl implements BlindService{
	
	@Autowired
	private BlindDao bDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 페이징처리
	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}

	// 익명 게시판 리스트 조회
	@Override
	public ArrayList<Board> selectBlindList(PageInfo pi) {
		return bDao.selectBlindList(sqlSession, pi);
	}

	// 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return bDao.increaseCount(sqlSession, boardNo);
	}

	// 익명 게시판 상세 조회
	@Override
	public Board selectBlind(int boardNo) {
		return bDao.selectBlind(sqlSession, boardNo);
	}
	
	// 댓글 수 조회
	@Override
	public ArrayList<Reply> replyCount() {
		return bDao.replyCount(sqlSession);
	}
		
	// 추천 수 조회
	@Override
	public ArrayList<Like> likeCount() {
		return bDao.likeCount(sqlSession);
	}
	
	// 추천 조회
	@Override
	public ArrayList<Like> selectLike(Like l) {
		return bDao.selectLike(sqlSession, l);
	}
	
	// 추천 등록
	@Override
	public int insertLike(Like l) {
		return bDao.insertLike(sqlSession, l);
	}
	
	// 추천 해제
	@Override
	public int deleteLike(Like l) {
		return bDao.deleteLike(sqlSession, l);
	}

	// 댓글 리스트 조회
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return bDao.selectReplyList(sqlSession, boardNo);
	}

	// 댓글 조회 (한개)
	@Override
	public Reply selectReply(int replyNo) {
		return bDao.selectReply(sqlSession, replyNo);
	}
	
	// 익명 아이디 중복 여부
	@Override
	public int checkReplyId(Reply r) {
		return bDao.checkReplyId(sqlSession, r);
	}
	
	// 댓글 등록
	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(sqlSession, r);
	}
	
	// 댓글 수정
	@Override
	public int updateReply(Reply r) {
		return bDao.updateReply(sqlSession, r);
	}
	
	// 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return bDao.deleteReply(sqlSession, replyNo);
	}
	
	// 게시글 등록
	@Override
	public int insertBlind(Board b) {
		return bDao.insertBlind(sqlSession, b);
	}

	// 게시글 수정
	@Override
	public int updateBlind(Board b) {
		return bDao.updateBlind(sqlSession, b);
	}
	
	// 게시글 삭제
	@Override
	public int deleteBlind(int boardNo) {
		return bDao.deleteBlind(sqlSession, boardNo);
	}

	// 신고 등록
	@Override
	public int insertReport(Report r) {
		return bDao.insertReport(sqlSession, r);
	}

}
