package com.finalProject.eduWorks.board.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Override
	public int selectListCount() {
		return 0;
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return null;
	}

	@Override
	public int insertNotice(Board n) {
		return 0;
	}

	@Override
	public Board selectNotice(int noticeNo) {
		return null;
	}

	@Override
	public Board udpatetNotice(Board b) {
		return null;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return 0;
	}
	
	

}
