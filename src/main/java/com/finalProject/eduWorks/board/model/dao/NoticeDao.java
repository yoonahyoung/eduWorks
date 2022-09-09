package com.finalProject.eduWorks.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

@Repository
public class NoticeDao {
	// 페이징처리
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	
	
	// 게시글 리스트 조회
	public HashMap<String, ArrayList<Board>> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		
		
		HashMap<String, ArrayList<Board>> map = new HashMap<>();

		// 1. 공지글 조회
		ArrayList<Board> topList = (ArrayList)sqlSession.selectList("noticeMapper.selectTopList");
		map.put("topList", topList);
		
		// 2. 일반글 페이징처리
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// 3. 일반글 조회
		ArrayList<Board> list = (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
		map.put("list", list);
		
		return map;
	}
	
	// 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.increaseCount", boardNo);
	}
	
	// 게시글 상세 조회
	public Board selectNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", boardNo);
	}
	
	// 게시글 댓글 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", boardNo);
	}

}
