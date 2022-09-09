package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.board.model.dao.NoticeDao;
import com.finalProject.eduWorks.board.model.vo.Board;
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
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	// 전사공지 리스트 조회
	@Override
	public HashMap<String,ArrayList<Board>> selectList(PageInfo pi) {
		return nDao.selectList(sqlSession, pi);
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
	@Override
	public Board udpatetNotice(Board b) {
		return null;
	}
	
	@Override
	public int insertNotice(Board n) {
		return 0;
	}
	
	@Override
	public int deleteNotice(int noticeNo) {
		return 0;
	}

	

	

	
	
	

}
