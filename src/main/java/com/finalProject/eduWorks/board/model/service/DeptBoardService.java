package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

public interface DeptBoardService {
		// 1. 부서 게시판 목록 페이지 조회 서비스 (페이징)
		int selectListCount(String keyword, String deptCode);
		ArrayList<Board> selectList(PageInfo pi, String keyword, String deptCode); 
		
		// 2. 부서 게시판 등록 서비스
		int insertDeptBoard(Board n);
		// 게시글 마지막 번호 구하기
		int lastBoNo();
		
		// 3. 부서 게시판 상세 페이지 조회 서비스
		// 조회수 증가
		int increaseCount(int deptNo);
		// 해당 게시글 상세 조회
		Board selectDeptBoard(int deptNo);
		
		// 3-1) 댓글 조회 서비스
		ArrayList<Reply> selectReplyList(int boardNo);
		Reply selectReply(int replyNo);
		
		// 3-2) 댓글 작성 서비스
		int insertReply(Reply r);
		
		// 3-3) 댓글 수정 서비스
		int updateReply(Reply r);
		
		// 3-4) 댓글 삭제 서비스
		int deleteReply(int replyNo);
		
		// 3-5) 해당 게시글 첨부파일 조회
		Attachment selectAttachment(int boardNo);
		
		// 3-6) 첨부파일 등록
		int insertAttachment(Attachment at);
		
		// 4. 공지사항 수정 서비스
		int updateDeptBoard(Board b);
		
		// 4-1) 첨부파일 수정 서비스
		int updateAttachment(Attachment at);
		
		// 5. 부서 게시판 삭제 서비스
		int deleteDeptBoard(int deptNo);
}
