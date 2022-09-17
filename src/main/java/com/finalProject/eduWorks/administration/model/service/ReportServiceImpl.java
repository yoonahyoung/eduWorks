package com.finalProject.eduWorks.administration.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.administration.model.dao.ReportDao;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 페이징 처리
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}

	// 신고 리스트 조회
	@Override
	public ArrayList<Report> selectReportList(PageInfo pi) {
		return rDao.selectReportList(sqlSession, pi);
	}
	
	// 댓글이 등록된 게시글 번호 조회
	@Override
	public int checkReBoardNo(int no) {
		return rDao.checkReBoardNo(sqlSession, no);
	}

	// 게시글 블라인드 처리
	@Override
	public int goBoBlind(int boardNo) {
		return rDao.goBoBlind(sqlSession, boardNo);
	}

	// 게시글 블라인드 해제
	@Override
	public int clearBoBlind(int boardNo) {
		return rDao.clearBoBlind(sqlSession, boardNo);
	}
	
	// 신고 처리 여부 변경
	@Override
	public int reportStatus(int no, int rptRefCat) {
		return rDao.reportStatus(sqlSession, no, rptRefCat);
	}

	// 댓글 블라인드 처리
	@Override
	public int goReBlind(int replyNo) {
		return rDao.goReBlind(sqlSession, replyNo);
	}

	

}
