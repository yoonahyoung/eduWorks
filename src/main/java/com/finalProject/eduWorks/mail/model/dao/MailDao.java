package com.finalProject.eduWorks.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.addressBook.model.vo.Address;
import com.finalProject.eduWorks.addressBook.model.vo.AddressOut;
import com.finalProject.eduWorks.common.model.vo.Attachment;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.mail.model.vo.MailStatus;
import com.finalProject.eduWorks.member.model.vo.Member;

@Repository
public class MailDao {
	
	// 은영 
	
	/**
	 * 1_1. 보낸 메일 개수 조회
	 * @param memNo : 로그인한 회원 번호
	 * @return : 보낸 메일 개수
	 */
	public int sendListCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.sendListCount", m);
	}
	
	/**
	 * 1_2. 보낸 메일 목록 조회
	 * @param pi : 페이지
	 * @param memNo : 로그인한 회원 번호
	 * @return : 보낸 메일 목록
	 */
	public ArrayList<Mail> selectSendMailList(SqlSessionTemplate sqlSession, PageInfo pi, Mail m){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("mailMapper.selectSendMailList", m, rowBounds);
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
	 * 5_1. 중요 메일함 개수 조회
	 * @param m : 로그인한 회원 이메일
	 * @return : 중요 메일함 개수
	 */
	public int importantListCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.importantListCount",m);
	}
	
	/**
	 * 5_2. 중요 메일함 중 안읽은 메일 조회
	 * @param m : 로그인한 회원 이메일
	 * @return : 중요 메일함 중 안읽은 메일
	 */
	public int importantUnReadCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.importantUnReadCount", m);
	}
	
	/**
	 * 5_3. 중요 메일함 목록 조회
	 * @param m : 로그인한 회원 이메일
	 * @return : 중요 메일함 목록
	 */
	public ArrayList<Mail> selectImportantMailList(SqlSessionTemplate sqlSession, PageInfo pi, Mail m){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectImportantMailList", m, rowBounds);
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
	 * 6_4. 주소록에서 찾기 (전사주소록 연락처 목록)
	 * @return : 전사 주소록 목록
	 */
	public ArrayList<Member> selectPublicAddress(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mailMapper.selectPublicAddress");
	}
	
	/**
	 * 6_5. 주소록에서 찾기 (개인주소록-기본)
	 * @param memNo : 로그인한 회원 사번
	 * @return : 개인주소록 기본 그룹 번호
	 */
	public int selectIndivBasicNum(SqlSessionTemplate sqlSession, String memNo) {
		return sqlSession.selectOne("mailMapper.selectIndivBasicNum", memNo);
	}
	
	/**
	 * 6_6. 주소록에서 찾기 (개인주소록 연락처 목록)
	 * @param a : 로그인한 회원 사번, 개인주소록 그룹 번호
	 * @return : 개인 주소록 연락처 목록
	 */
	public ArrayList<Address> selectIndivAddress(SqlSessionTemplate sqlSession, Address a){
		return (ArrayList)sqlSession.selectList("mailMapper.selectIndivAddress", a);
	}
	
	/**
	 * 6_7. 주소록에서 찾기 (개인주소록 연락처 그룹 목록)
	 * @param a : 로그인한 회원 사번, 개인주소록 그룹 번호
	 * @return : 개인 주소록 그룹 목록
	 */
	public ArrayList<AddressOut> selectIndivCategory(SqlSessionTemplate sqlSession, Address a){
		return (ArrayList)sqlSession.selectList("mailMapper.selectIndivCategory", a);
	}
	
	/**
	 * 8. 중요 메일 설정
	 * @param ms : 중요메일 표시한 메일의 정보 
	 * @return : 중요 메일 설정 성공 여부가 담긴 int형 변수 (성공 : 1 | 실패 : 0)
	 */
	public int updateImportant(SqlSessionTemplate sqlSession, MailStatus ms) {
		return sqlSession.update("mailMapper.updateImportant", ms);
	}

	/**
	 * 9_1. 나에게 쓴 메일 개수 조회
	 * @param m : 로그인한 회원 사번, 이메일
	 * @return : 나에게 쓴 메일 개수 
	 */
	public int sendToMeListCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.sendToMeListCount", m);
	}
	
	/**
	 * 9_2. 나에게 쓴 메일 목록
	 * @param m : 로그인한 회원 사번, 이메일
	 * @return : 나에게 쓴 메일 목록
	 */
	public ArrayList<Mail> selectSendToMeMailList(SqlSessionTemplate sqlSession, PageInfo pi, Mail m){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSendToMeMailList", m, rowBounds);
	}
	
	/**
	 * 10_1. 휴지통 메일 개수 조회
	 * @param m : 로그인한 회원 사번, 이메일
	 * @return : 휴지통 메일 개수
	 */
	public int deleteListCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.deleteListCount", m);
	}
	
	/**
	 * 10_2. 휴지통 메일 중 안읽은 메일 개수 조회
	 * @param m : 로그인한 회원 사번, 이메일
	 * @return : 휴지통 메일 중 안읽은 메일 개수
	 */
	public int deleteUnReadCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.deleteUnReadCount", m);
	}
	
	/**
	 * 10_3. 휴지통 메일 목록 조회
	 * @param m : 로그인한 회원 사번, 이메일
	 * @return : 휴지통 메일 중 안읽은 메일 목록
	 */
	public ArrayList<Mail> selectDeleteMailList(SqlSessionTemplate sqlSession, PageInfo pi, Mail m){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectDeleteMailList", m, rowBounds);
	}
	
	/**
	 * 11_1. 읽은 메일함 개수 조회
	 * @param m : 로그인한 회원 이메일
	 * @return : 읽은 메일함 개수
	 */
	public int readListCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.readListCount", m);
	}
	
	/**
	 * 11_2. 읽은 메일함 목록 조회
	 * @param m : 로그인한 회원 이메일
	 * @return : 읽은 메일함 목록
	 */
	public ArrayList<Mail> selectReadMailList(SqlSessionTemplate sqlSession, PageInfo pi, Mail m){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectReadMailList", m, rowBounds);
	}
	
	/**
	 * 12_1. 안읽은 메일함 개수 조회
	 * @param m : 로그인한 회원 이메일
	 * @return : 안읽은 메일함 개수
	 */
	public int unReadListCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.unReadListCount", m);
	}
	
	/**
	 * 12_1. 안읽은 메일함 목록 조회
	 * @param m : 로그인한 회원 이메일
	 * @return : 안읽은 메일함 목록
	 */
	public ArrayList<Mail> selectUnReadMailList(SqlSessionTemplate sqlSession, PageInfo pi, Mail m){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectUnReadMailList", m, rowBounds);
	}

}
