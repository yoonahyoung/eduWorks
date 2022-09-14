package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

public interface NoticeService {
	
	// 1. 공지사항 목록 페이지 조회 서비스 (페이징)
	int selectListCount();
	HashMap<String,ArrayList<Board>> selectList(PageInfo pi); 
	
	// 2. 공지사항 등록 서비스
	int insertNotice(Board n);
	
	// 3. 공지사항 상세 페이지 조회 서비스
	// 조회수 증가
	int increaseCount(int noticeNo);
	// 해당 게시글 상세 조회
	Board selectNotice(int noticeNo);
	
	// 3-1) 댓글 조회 서비스
	ArrayList<Reply> selectReplyList(int noticeNo);
	Reply selectReply(int replyNo);
	
	// 3-2) 댓글 작성 서비스
	int insertReply(Reply r);
	
	// 3-3) 댓글 수정 서비스
	int updateReply(Reply r);
	
	// 3-4) 댓글 삭제 서비스
	int deleteReply(int replyNo);
	
	// 3-) 해당 게시글 첨부파일 조회
	Attachment selectAttachment(int noticeNo);
	
	// 3- ) 첨부파일 등록
	int insertAttachment(Attachment at);
	
	// 4. 공지사항 수정 서비스
	int updateNotice(Board b);
	
	// 4-1. 첨부파일 수정 서비스
	int updateAttachment(Attachment at);
	
	// 5. 공지사항 삭제 서비스
	int deleteNotice(int noticeNo);
	
}
