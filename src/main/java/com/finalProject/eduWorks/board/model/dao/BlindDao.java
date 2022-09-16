package com.finalProject.eduWorks.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.board.model.vo.Like;
import com.finalProject.eduWorks.board.model.vo.Report;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

@Repository
public class BlindDao {
	// 페이징처리
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("blindMapper.selectListCountB");
	}

	// 익명 게시판 리스트 조회
	public ArrayList<Board> selectBlindList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("blindMapper.selectBlindList", null, rowBounds);
	}
	
	// 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("blindMapper.increaseCountB", boardNo);
	}
	
	// 게시글 상세 조회
	public Board selectBlind(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("blindMapper.selectBlind", boardNo);
	}
	
	// 댓글 수 조회
	public ArrayList<Reply> replyCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("blindMapper.replyCount");
	}
	
	// 추천 수 조회
	public ArrayList<Like> likeCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("blindMapper.likeCount");
	}
	
	// 추천 조회
	public ArrayList<Like> selectLike(SqlSessionTemplate sqlSession, Like l) {
		return (ArrayList)sqlSession.selectList("blindMapper.selectLike", l);
	}
	
	// 추천 등록
	public int insertLike(SqlSessionTemplate sqlSession, Like l) {
		return sqlSession.insert("blindMapper.insertLike", l);
	}
	
	// 추천 삭제
	public int deleteLike(SqlSessionTemplate sqlSession, Like l) {
		return sqlSession.delete("blindMapper.deleteLike", l);
	}
	
	// 게시글 댓글리스트 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("blindMapper.selectReplyListB", boardNo);
	}
	
	// 익명 아이디 중복 여부
	public int checkReplyId(SqlSessionTemplate sqlSession, Reply r) {
		int result = sqlSession.selectOne("blindMapper.checkReplyId", r);
		return sqlSession.selectOne("blindMapper.checkReplyId", r);
	}

	// 댓글 등록
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("blindMapper.insertReplyB", r);
	}
	
	// 댓글 조회
	public Reply selectReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.selectOne("blindMapper.selectReplyB", replyNo);
	}
	
	// 댓글 수정 
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("blindMapper.updateReplyB", r);
	}

	// 댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("blindMapper.deleteReplyB", replyNo);
	}

	// 게시글 등록
	public int insertBlind(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("blindMapper.insertBlind", b);
	}
	
	// 게시글 삭제
	public int deleteBlind(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("blindMapper.deleteBlind", boardNo);
	}


	// 게시글 수정
	public int updateBlind(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("blindMapper.updateBlind", b);
	}

	// 신고 등록
	public int insertReport(SqlSessionTemplate sqlSession, Report r) {
		return sqlSession.insert("blindMapper.insertReport", r);
	}
}
