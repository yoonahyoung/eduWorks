package com.finalProject.eduWorks.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.dao.MailDao;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Member;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1_1. 보낸 메일 개수 조회
	 * @param memNo : 로그인한 회원 번호
	 * @return : 보낸 메일 개수
	 */
	@Override
	public int sendListCount(String memNo) {
		return mDao.sendListCount(sqlSession, memNo);
	}

	/**
	 * 1_2. 보낸 메일 목록 조회
	 * @param pi : 페이지
	 * @param memNo : 로그인한 회원 번호
	 * @return : 보낸 메일 목록
	 */
	@Override
	public ArrayList<Mail> selectSendMailList(PageInfo pi, String memNo) {
		return mDao.selectSendMailList(sqlSession, pi, memNo);
	}
	
	/**
	 * 2_1. 받은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 개수
	 */
	@Override
	public int receiveListCount(String memEmail) {
		return mDao.receiveListCount(sqlSession, memEmail);
	}
	
	/**
	 * 2_2. 받은 메일 목록 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 목록
	 */
	@Override
	public ArrayList<Mail> selectReceiveMailList(PageInfo pi, String memEmail) {
		return mDao.selectReceiveMailList(sqlSession, pi, memEmail);
	}
	
	/**
	 * 2_3. 받은 메일 중 안읽은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 중 안읽은 메일 개수
	 */
	@Override
	public int receiveUnReadCount(String memEmail) {
		return mDao.receiveUnReadCount(sqlSession, memEmail);
	}
	
	@Override
	public ArrayList<Member> selectPublicAddress() {
		return mDao.selectPublicAddress(sqlSession);
	}

	@Override
	public int selectIndivBasicNum(String memNo) {
		return mDao.selectIndivBasicNum(sqlSession, memNo);
	}

	@Override
	public ArrayList<Address> selectIndivAddress(Address a) {
		return mDao.selectIndivAddress(sqlSession, a);
	}

	@Override
	public ArrayList<AddressOut> selectIndivCategory(Address a) {
		return mDao.selectIndivCategory(sqlSession, a);
	}

	
	/**
	 * 6_1. 메일 전송 (TB_MAIL)
	 * @param m : 보낸 메일 정보
	 * @return : 메일 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int insertMail(Mail m) {
		return mDao.insertMail(sqlSession, m);
	}
	
	/**
	 * 6_2. 메일 상태 전송 (TB_MAIL_STATUS)
	 * @param list : 메일 상태 목록이 담긴 ArrayList<MailStatus>  
	 * @return : 메일 상태 정보 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int insertMailStatus(ArrayList<MailStatus> list) {
		return mDao.insertMailStatus(sqlSession, list);
	}

	/**
	 * 6_3. 첨부파일 전송 (TB_ATTACHMENT)
	 * @param atList : 전송할 파일 목록이 담긴 ArrayList<Attachment>
	 * @return : 첨부파일 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int insertAttachment(ArrayList<Attachment> atList) {
		return mDao.insertAttachment(sqlSession, atList);
	}

	/**
	 * 7. 중요 메일 설정
	 * @param ms : 중요메일 표시한 메일의 정보 
	 * @return : 중요 메일 설정 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int updateImportant(MailStatus ms) {
		return mDao.updateImportant(sqlSession, ms);
	}



}
