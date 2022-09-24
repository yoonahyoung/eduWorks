package com.finalProject.eduWorks.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

@Repository
public class NoticeDao {
	// 페이징처리
	public int selectListCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("noticeMapper.selectListCount", keyword);
	}
	
	// 게시글 리스트 조회
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		
		// 페이징처리
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", keyword, rowBounds);
	}
	
	// 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.increaseCount", boardNo);
	}
	
	// 게시글 상세 조회
	public Board selectNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", boardNo);
	}
	
	// 첨부파일 조회
	public Attachment selectAttachment(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("noticeMapper.selectAtList", boardNo);
	}
	
	// 게시글 댓글리스트 조회
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("noticeMapper.selectReplyList", boardNo);
	}

	// 댓글 등록
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("noticeMapper.insertReply", r);
	}
	
	// 댓글 조회
	public Reply selectReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.selectOne("noticeMapper.selectReply", replyNo);
	}
	
	// 댓글 수정 
	public int updateReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.update("noticeMapper.updateReply", r);
	}

	// 댓글 삭제
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		return sqlSession.update("noticeMapper.deleteReply", replyNo);
	}


	// 게시글 등록
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("noticeMapper.insertNotice", b);
	}

	// 마지막 게시글 번호 구하기
	public int lastBoNo(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.lastBoNo");
	}
	
	// 첨부파일 등록
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("noticeMapper.insertAttachment", at);
	}


	// 게시글 삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("noticeMapper.deleteNotice", boardNo);
	}


	// 게시글 수정
	public int updateNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("noticeMapper.updateNotice", b);
	}


	// 첨부파일 수정
	public int updateAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("noticeMapper.updateAttachment", at);
	}

	// 공지 등록/해제
	public int goTop(SqlSessionTemplate sqlSession, String checkList, int isYN) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("checkList", checkList);
		map.put("isYN", isYN);
		return sqlSession.update("noticeMapper.goTop", map);
	}


}
