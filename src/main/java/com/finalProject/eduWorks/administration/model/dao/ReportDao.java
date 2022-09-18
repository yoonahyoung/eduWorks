package com.finalProject.eduWorks.administration.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Repository
public class ReportDao {
	// 신고는 blind-mapper.xml로 처리
	
	// 페이징처리
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("blindMapper.selectListCountR");
	}
	
	// 신고 게시판 리스트 조회
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("blindMapper.selectReportList", null, rowBounds);
	}
	
	// 댓글이 등록된 게시글 번호 조회
	public int checkReBoardNo(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.selectOne("blindMapper.checkReBoardNo", replyNo);
	}


	// 게시글 블라인드 처리
	public int goBoBlind(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("blindMapper.goBoBlind", boardNo);
	}

	// 게시글 블라인드 해제
	public int clearBoBlind(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("blindMapper.clearBoBlind", boardNo);
	}

	// 댓글 블라인드 처리
	public int goReBlind(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("blindMapper.goReBlind", replyNo);
	}
	
	// 신고 처리 여부 변경
	public int reportStatus(SqlSessionTemplate sqlSession, int rptBoardNo, int rptRefCat) {
		HashMap<String, Integer> map = new HashMap<>();
		map.put("rptBoardNo", rptBoardNo);
		map.put("rptRefCat", rptRefCat);
		return sqlSession.update("blindMapper.reportStatus", map);
		
	}
	// 댓글 블라인드 해제
	public int clearReBlind(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("blindMapper.clearReBlind", replyNo);
	}

	

	

}
