package com.finalProject.eduWorks.cnsln.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.administration.model.vo.Student;
import com.finalProject.eduWorks.cnsln.model.vo.Cnsln;
import com.finalProject.eduWorks.common.model.vo.PageInfo;
import com.finalProject.eduWorks.common.model.vo.Reply;
import com.finalProject.eduWorks.member.model.vo.Member;

public interface CnslnService {
	
	// 상담 일정 조회
	ArrayList<Cnsln> selectCnslnList(String memNo);
	
	// 상담 일정 등록
	ArrayList<Member> selectMemberList(String keyword, String memNo);
	ArrayList<Student> selectStudentList(String key);
	int insertCnsln(Cnsln c);
	Member selectMember(String memNo);
	
	// 상담 일정 조회
	int increaseCount(int cNo);
	Cnsln selectCnsln(int cNo);
	
	// 상담 일정 수정
	int updateCnsln(Cnsln c);
	
	// 상담 일정 삭제
	int deleteCnsln(int cNo);
	
	// ajax 댓글 리스트 조회
	ArrayList<Reply> selectReplyList(int cNo);
	
	// 댓글 작성 서비스 (ajax)
	int insertReply(Reply r);
	
	// 댓글 수정 서비스 (ajax)
	int updateReply(Reply r);
	Reply selectReply(int replyNo);
	
	// 댓글 삭제 서비스 (ajax)
	int deleteReply(int replyNo);
	
	// 상담 내역 조회
	int selectListCount(String keyword, int cate);
	ArrayList<Cnsln> selectCnslnList(PageInfo pi, String keyword, int cate);
	
	// 상담 내역 삭제
	int deleteReCnsln(int cNo);
	
	// 학생 조회
	Student selectStudent(int sNo);
	
	// 학생 등록
	int insertStudent(Student s);
	
	// 학생 수정
	int updateStudent(Student s);

}
