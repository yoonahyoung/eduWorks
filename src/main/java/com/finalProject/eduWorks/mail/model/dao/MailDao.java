package com.finalProject.eduWorks.mail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;

@Repository
public class MailDao {
	
	// 은영 
	
	/**
	 * 5_1. 메일 전송 (TB_MAIL)
	 * @param m : 보낸 메일 정보
	 * @return : 메일 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	/**
	 * 5_2. 메일 상태 전송 (TB_MAIL_STATUS)
	 * @param list : 메일 상태 목록이 담긴 ArrayList<MailStatus>  
	 * @return : 메일 상태 정보 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	public int insertMailStatus(SqlSessionTemplate sqlSession, ArrayList<MailStatus> list) {

		int result = 0;
		for(MailStatus ms : list) {
			result += sqlSession.insert("mailMapper.insertMailStatus", ms);
		}
		
		return result;
	}
	
	/**
	 * 5_3. 첨부파일 전송 (TB_ATTACHMENT)
	 * @param atList : 전송할 파일 목록이 담긴 ArrayList<Attachment>
	 * @return : 첨부파일 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	public int insertAttachment(SqlSessionTemplate sqlSession, ArrayList<Attachment> atList) {
	
		int result = 0;
		for(Attachment at : atList) {
			result += sqlSession.insert("mailMapper.insertAttachment", at);
		}
		return result;
	}

}
