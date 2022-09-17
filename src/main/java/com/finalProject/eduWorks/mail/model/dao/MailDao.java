package com.finalProject.eduWorks.mail.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;

@Repository
public class MailDao {
	
	// 은영 
	
	/**
	 * 1_1. 보낸 메일 개수 조회
	 * @param memNo : 로그인한 회원 번호
	 * @return : 보낸 메일 개수
	 */
	public int sendListCount(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.selectOne("mailMapper.sendListCount", memNo);
	}
	
	/**
	 * 1_2. 보낸 메일 목록 조회
	 * @param pi : 페이지
	 * @param memNo : 로그인한 회원 번호
	 * @return : 보낸 메일 목록
	 */
	public ArrayList<Mail> selectSendMailList(SqlSessionTemplate sqlSession, PageInfo pi, String memNo){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", memNo, rowBounds);
	}
	
	/**
	 * 2_1. 받은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 개수
	 */
	public int receiveListCount(SqlSessionTemplate sqlSession, String memEmail) {
		return sqlSession.selectOne("mailMapper.receiveListCount", memEmail);
	}
	
	/**
	 * 2_2. 받은 메일 목록 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 목록
	 */
	public ArrayList<Mail> selectReceiveMailList(SqlSessionTemplate sqlSession, PageInfo pi, String memEmail){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList", memEmail, rowBounds);
	}
	
	/**
	 * 2_3. 받은 메일 중 안읽은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 중 안읽은 메일 개수
	 */
	public int receiveUnReadCount(SqlSessionTemplate sqlSession, String memEmail) {
		return sqlSession.selectOne("mailMapper.receiveUnReadCount", memEmail);
	}
	
	/**
	 * 6_1. 메일 전송 (TB_MAIL)
	 * @param m : 보낸 메일 정보
	 * @return : 메일 전송 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	public int insertMail(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.insert("mailMapper.insertMail", m);
	}
	
	/**
	 * 6_2. 메일 상태 전송 (TB_MAIL_STATUS)
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
	 * 6_3. 첨부파일 전송 (TB_ATTACHMENT)
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
	
	/**
	 * 7. 중요 메일 설정
	 * @param ms : 중요메일 표시한 메일의 정보 
	 * @return : 중요 메일 설정 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	public int updateImportant(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.update("mailMapper.updateImportant", ms);
	}


}
