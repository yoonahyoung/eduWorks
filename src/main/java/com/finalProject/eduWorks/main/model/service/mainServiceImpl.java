package com.finalProject.eduWorks.main.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.main.model.dao.mainDao;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

@Service
public class mainServiceImpl implements mainService{

	@Autowired
	private mainDao mDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectListCount() {
		return mDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectMainList(PageInfo pi) {
		return mDao.selectMainList(sqlSession, pi);
	}
	
	// 메인페이지 부서게시판 페이징
	@Override
	public int selectDeptListCount() {
		return mDao.selectDeptListCount(sqlSession);
	}
	
	// 메인페이지 부서게시판 리스트 조회
	@Override
	public ArrayList<Board> selectMainDeptList(PageInfo pi, String deptCode) {
		return mDao.selectMainDeptList(sqlSession, pi, deptCode);
	}

	/**
	 * 2_1. 받은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 개수
	 */
	@Override
	public int receiveMainListCount(Mail m) {
		return mDao.receiveMainListCount(sqlSession, m);
	}

	/**
	 * 2_2. 받은 메일 목록 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 목록
	 */
	@Override
	public ArrayList<Mail> selectReceiveMainMailList(PageInfo pi, Mail m) {
		return mDao.selectReceiveMainMailList(sqlSession, pi, m);
	}

	/**
	 * 2_3. 받은 메일 중 안읽은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 중 안읽은 메일 개수
	 */
	@Override
	public int receiveMainUnReadCount(Mail ml) {
		return mDao.receiveMainUnReadCount(sqlSession, ml);
	}

	@Override
	public int selectAddressListCount() {
		return mDao.selectAddressListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectMainAddressList(PageInfo pi) {
		return mDao.selectMainAddressList(sqlSession, pi);
	}

	@Override
	public ArrayList<Mail> searchMail(HashMap map) {
		return mDao.searchMail(sqlSession, map);
	}

	@Override
	public ArrayList<Board> searchBoard(HashMap bMap) {
		return mDao.searchBoard(sqlSession, bMap);
	}

	@Override
	public ArrayList<Board> searchNotice(String key) {
		return mDao.searchNotice(sqlSession, key);
	}

	@Override
	public ArrayList<Schedule> searchSchedule(HashMap map) {
		return mDao.searchSchedule(sqlSession, map);
	}
}
