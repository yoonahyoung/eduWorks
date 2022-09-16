package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Like;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

public interface BlindService {
	// 1. 익명 게시판 목록 페이지 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectBlindList(PageInfo pi); 
	
	// 2. 익명 게시판 등록 서비스
	int insertBlind(Board n);
	
	// 3. 익명 게시판 상세 페이지 조회 서비스
	// 조회수 증가
	int increaseCount(int boardNo);
	// 해당 게시글 상세 조회
	Board selectBlind(int boardNo);
	
	// 댓글 수 조회
	ArrayList<Reply> replyCount();
	
	// 추천 수 조회
	ArrayList<Like> likeCount();
	
	// 추천 조회
	ArrayList<Like> selectLike(Like l);
	
	// 추천 등록
	int insertLike(Like l);
	
	// 추천 삭제
	int deleteLike(Like l);
	
	// 3-1) 댓글 조회 서비스
	ArrayList<Reply> selectReplyList(int boardNo);
	Reply selectReply(int replyNo);
	
	// 3- ) 익명 아이디 중복 여부 확인 서비스
	int checkReplyId(Reply r);
	
	// 3-2) 댓글 작성 서비스
	int insertReply(Reply r);
	
	// 3-3) 댓글 수정 서비스
	int updateReply(Reply r);
	
	// 3-4) 댓글 삭제 서비스
	int deleteReply(int replyNo);
	
	// 4. 익명 게시판 수정 서비스
	int updateBlind(Board b);
	
	// 5. 익명 게시판 삭제 서비스
	int deleteBlind(int boardNo);
	
	// 신고 등록
	int insertReport(Report r);
}
