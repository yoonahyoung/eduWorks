package com.finalProject.eduWorks.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.finalProject.eduWorks.board.model.vo.Board;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.mail.model.vo.Mail;
import com.finalProject.eduWorks.member.model.vo.Member;
import com.finalProject.eduWorks.schedule.model.vo.Schedule;

@Repository
public class mainDao {
	
	// 메인페이지 공지사항 페이징
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("noticeMapper.selectListCount");
	}
	
	// 메인페이지 공지사항 리스트 조회
	public ArrayList<Board> selectMainList(SqlSession sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}
	
	// 메인페이지 부서게시판 페이징
	public int selectDeptListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("deptBoardMapper.selectListCountD");
	}
	
	// 메인페이지 부서게시판 리스트 조회
	public ArrayList<Board> selectMainDeptList(SqlSession sqlSession, PageInfo pi, String deptCode){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("deptBoardMapper.searchBoard", deptCode, rowBounds);
	}
	
	/**
	 * 2_1. 받은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 개수
	 */
	public int receiveMainListCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.receiveListCount", m);
	}
	
	/**
	 * 2_2. 받은 메일 목록 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 목록
	 */
	public ArrayList<Mail> selectReceiveMainMailList(SqlSessionTemplate sqlSession, PageInfo pi, Mail m){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("mailMapper.selectReceiveMailList", m, rowBounds);
	}
	
	/**
	 * 2_3. 받은 메일 중 안읽은 메일 개수 조회
	 * @param memEmail : 로그인한 회원 이메일
	 * @return : 받은 메일 중 안읽은 메일 개수
	 */
	public int receiveMainUnReadCount(SqlSessionTemplate sqlSession, Mail m) {
		return sqlSession.selectOne("mailMapper.receiveUnReadCount", m);
	}
	
	/**
	 * 1_1. 공용 주소록에 들어가는 사원 수 조회
	 * @return : 재직중인 사원 수
	 */
	public int selectAddressListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.selectListCount");
	}
	
	/**
	 * 1_2. 공용 주소록에 들어갈 재직중인 사원 목록
	 * @param pi : 페이징 처리
	 * @return : 재직중인 사원 목록이 들어간 ArrayList<Member>
	 */
	public ArrayList<Member> selectMainAddressList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit(); // 조회해야되는 게시글 갯수
		int offset = (pi.getCurrentPage() - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectAddressList", null, rowBounds);

	}
	
	public ArrayList<Mail> searchMail(SqlSessionTemplate sqlSession, HashMap map){
		return (ArrayList)sqlSession.selectList("mailMapper.searchMail", map);
	}
	
	public ArrayList<Board> searchBoard(SqlSessionTemplate sqlSession, HashMap bMap){
		System.out.println(bMap.get("deptCode"));
		
		return (ArrayList)sqlSession.selectList("deptBoardMapper.searchBoard", bMap);
	}
	
	public ArrayList<Board> searchNotice(SqlSessionTemplate sqlSession, String key){
		return (ArrayList)sqlSession.selectList("noticeMapper.searchNotice", key);
	}
	
	public ArrayList<Schedule> searchSchedule(SqlSessionTemplate sqlSession, String key){
		return (ArrayList)sqlSession.selectList("scheduleMapper.searchSchedule", key);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
