package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.board.model.dao.DeptBoardDao;
import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;

@Service
public class DeptBoardServiceImpl implements DeptBoardService{
	
	@Autowired
	private DeptBoardDao dDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 페이징처리
	@Override
	public int selectListCount() {
		return dDao.selectListCount(sqlSession);
	}

	// 전사공지 리스트 조회
	@Override
	public HashMap<String,ArrayList<Board>> selectList(PageInfo pi) {
		return dDao.selectList(sqlSession, pi);
	}
	
	// 조회수 증가
	@Override
	public int increaseCount(int boardNo) {
		return dDao.increaseCount(sqlSession, boardNo);
	}
	
	// 전사공지 상세 조회
	@Override
	public Board selectDeptBoard(int boardNo) {
		return dDao.selectDeptBoard(sqlSession, boardNo);
	}
	
	// 해당 게시글 첨부파일 조회
	@Override
	public Attachment selectAttachment(int boardNo) {
		return dDao.selectAttachment(sqlSession, boardNo);
	}
	
	// 전사공지 상세 조회 시 댓글 리스트 조회
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		return dDao.selectReplyList(sqlSession, boardNo);
	}
	
	// 댓글 등록
	@Override
	public int insertReply(Reply r) {
		return dDao.insertReply(sqlSession, r);
	}
	
	// 댓글 조회
	@Override
	public Reply selectReply(int replyNo) {
		return dDao.selectReply(sqlSession, replyNo);
	}
	
	// 댓글 수정
	@Override
	public int updateReply(Reply r) {
		return dDao.updateReply(sqlSession, r);
	}
	
	// 댓글 삭제
	@Override
	public int deleteReply(int replyNo) {
		return dDao.deleteReply(sqlSession, replyNo);
	}
	
	// 게시글 등록
	@Override
	public int insertDeptBoard(Board b) {
		return dDao.insertDeptBoard(sqlSession, b);
	}
	
	// 첨부파일 등록
	@Override
	public int insertAttachment(Attachment at) {
		return dDao.insertAttachment(sqlSession, at);
	}
	
	// 게시글 수정
	@Override
	public int updateDeptBoard(Board b) {
		return dDao.updateDeptBoard(sqlSession, b);
	}
	
	// 첨부파일 수정
	@Override
	public int updateAttachment(Attachment at) {
		return dDao.updateAttachment(sqlSession, at);
	}
	
	
	// 게시글 삭제
	@Override
	public int deleteDeptBoard(int boardNo) {
		return dDao.deleteDeptBoard(sqlSession, boardNo);
	}
}
