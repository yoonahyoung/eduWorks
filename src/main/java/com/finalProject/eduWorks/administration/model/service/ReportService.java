package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

public interface ReportService {
	// 1. 신고 목록 페이지 조회 서비스 (페이징)
	int selectListCount();
	ArrayList<Report> selectReportList(PageInfo pi);
	// 댓글이 등록된 게시글 번호 조회
	int checkReBoardNo(int no);
	
	// 게시글 블라인드 처리
	int goBoBlind(int boardNo);
	
	// 게시글 블라인드 해제
	int clearBoBlind(int boardNo);
	
	// 신고 처리 여부 변경
	int reportStatus(String rptNoStr);
	
	// 댓글 블라인드 처리
	int goReBlind(int replyNo);
	
	// (신고알람용) 신고자 리스트
	ArrayList<Report> selectTargets(String rptNoStr, int rptRefCat);
	
}
