package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.board.model.dao.NoticeDao;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 페이징처리
	@Override
	public int selectListCount(String keyword) {
		return nDao.selectListCount(sqlSession, keyword);
	}

	// 전사공지 리스트 조회
	@Override
	public ArrayList<Board> selectList(PageInfo pi, String keyword) {
		return nDao.selectList(sqlSession, pi, keyword);
	}
	
	// 조회수 증가
	@Override
	public int increaseCount(int noticeNo) {
		return nDao.increaseCount(sqlSession, noticeNo);
	}
	
	// 전사공지 상세 조회
	@Override
	public Board selectNotice(int noticeNo) {
		return nDao.selectNotice(sqlSession, noticeNo);
	}
	
	// 해당 게시글 첨부파일 조회
	@Override
	public Attachment selectAttachment(int noticeNo) {
		return nDao.selectAttachment(sqlSession, noticeNo);
	}
	
	// 전사공지 상세 조회 시 댓글 리스트 조회
	@Override
	public ArrayList<Reply> selectReplyList(int noticeNo) {
		return nDao.selectReplyList(sqlSession, noticeNo);
	}
	
	// 댓글 등록
	@Override
	public int insertReply(Reply r) {
		return nDao.insertReply(sqlSession, r);
	}
	
	// 댓글 조회
	@Override
	public Reply selectReply(int replyNo) {
		return nDao.selectReply(sqlSession, replyNo);
	}
	
	// 댓글 수정
	@Override
	public int updateReply(Reply r) {
		return nDao.updateReply(sqlSession, r);
	}
	
	// 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return nDao.deleteReply(sqlSession, replyNo);
	}
	
	// 게시글 등록
	@Override
	public int insertNotice(Board b) {
		return nDao.insertNotice(sqlSession, b);
	}
	
	// 첨부파일 등록
	@Override
	public int insertAttachment(Attachment at) {
		return nDao.insertAttachment(sqlSession, at);
	}
	
	// 게시글 수정
	@Override
	public int updateNotice(Board b) {
		return nDao.updateNotice(sqlSession, b);
	}
	
	// 첨부파일 수정
	@Override
	public int updateAttachment(Attachment at) {
		return nDao.updateAttachment(sqlSession, at);
	}
	
	
	// 게시글 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		return nDao.deleteNotice(sqlSession, noticeNo);
	}

	// 공지 등록/해제
	@Override
	public int goTop(String checkList, int isYN) {
		return nDao.goTop(sqlSession, checkList, isYN);
	}
	

}
