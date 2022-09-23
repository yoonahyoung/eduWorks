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
	public int selectListCount(SqlSessionTemplate sqlSession, String rCount, String rStatus) {
		HashMap<String, String> map = new HashMap<>();
		map.put("rCount", rCount);
		map.put("rStatus", rStatus);
		return sqlSession.selectOne("blindMapper.selectListCountR", map);
	}
	
	// 신고 게시판 리스트 조회
	public ArrayList<Report> selectReportList(SqlSessionTemplate sqlSession, PageInfo pi, String rCount, String rStatus) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		HashMap<String, String> map = new HashMap<>();
		map.put("rCount", rCount);
		map.put("rStatus", rStatus);
		return (ArrayList)sqlSession.selectList("blindMapper.selectReportList", map, rowBounds);
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
	public int reportStatus(SqlSessionTemplate sqlSession, String rptNoStr) {
		return sqlSession.update("blindMapper.reportStatus", rptNoStr);
		
	}
	// 댓글 블라인드 해제
	public int clearReBlind(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("blindMapper.clearReBlind", replyNo);
	}

	// (신고알람용) 신고자 목록 구하기
	public ArrayList<Report> selectTargets(SqlSessionTemplate sqlSession, String rptNoStr, int rptRefCat) {
		if(rptRefCat == 1) {// 게시글 신고
			return (ArrayList)sqlSession.selectList("blindMapper.selectTargetsB", rptNoStr);
		}else { // 댓글 신고
			return (ArrayList)sqlSession.selectList("blindMapper.selectTargetsR", rptNoStr);
		}
	}

	

	

}
