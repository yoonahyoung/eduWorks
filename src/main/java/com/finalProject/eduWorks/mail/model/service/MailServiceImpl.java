package com.finalProject.eduWorks.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.mail.model.dao.MailDao;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 5_1. 메일 전송 (TB_MAIL)
	 * @param m : 보낸 메일 정보
	 * @return : 메일 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int insertMail(Mail m) {
		return mDao.insertMail(sqlSession, m);
	}
	
	/**
	 * 5_2. 메일 상태 전송 (TB_MAIL_STATUS)
	 * @param list : 메일 상태 목록이 담긴 ArrayList<MailStatus>  
	 * @return : 메일 상태 정보 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int insertMailStatus(ArrayList<MailStatus> list) {
		return mDao.insertMailStatus(sqlSession, list);
	}

	/**
	 * 5_3. 첨부파일 전송 (TB_ATTACHMENT)
	 * @param atList : 전송할 파일 목록이 담긴 ArrayList<Attachment>
	 * @return : 첨부파일 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	@Override
	public int insertAttachment(ArrayList<Attachment> atList) {
		return mDao.insertAttachment(sqlSession, atList);
	}



}
