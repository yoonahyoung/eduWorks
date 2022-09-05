package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

public interface NoticeService {
	
	// 1. 공지사항 목록 페이지 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Board> selectList(PageInfo pi); 
	
	// 2. 공지사항 등록 서비스
	int insertNotice(Board n);
	
	// 3. 공지사항 상세 페이지 조회 서비스
	Board selectNotice(int noticeNo);
	
	// 4. 공지사항 수정 서비스
	Board udpatetNotice(Board b);
	
	// 5. 공지사항 삭제 서비스
	int deleteNotice(int noticeNo);
	
}
