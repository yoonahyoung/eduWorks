package com.finalProject.eduWorks.approval.model.service;

import java.util.ArrayList;

import com.finalProject.eduWorks.approval.model.vo.Draft;
import com.finalProject.eduWorks.approval.model.vo.Expd;
import com.finalProject.eduWorks.approval.model.vo.Leave;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

public interface ApprovalService {
	
	//기안신청서 작성(insert)
	int insertDraft(Draft d);
	
	//기안신청서 수정(결재 이루어지지 않았을 경우에만) (update)
	int updateDraft(Draft d);
	//기안신청서 삭제(결재 이루어지지 않았을 경우에만)(delete)
	int deleteDraft(int aprvNo);
	
	//기안신청서 임시저장(update)
	int updateTempDraft(Draft d);
	/*
	 * //댓글 리스트 조회용 서비스(ajax) ArrayList<Reply> selectReplyList(int aprvNo);
	 * 
	 * //댓글 작성 서비스(ajax) int insertReply(Reply r);
	 */
	
	
	//==========================================
	
	//연차신청서 작성(insert)
	int insertLeave(Leave l);
	
	
	
	//연차신청서 수정(결재 이루어지지 않았을 경우에만) (update)
	int updateLeave(Leave l);
		
	//연차신청서 삭제(결재 이루어지지 않았을 경우에만)(delete)
	int deleteLeave(int aprvNo);
	
	//연차신청서 임시저장(update)
	int updateTempLeave(Leave l);
	
	//==========================================
	
	
	//지출결의서 작성(insert)
	int insertExpd(Expd e);
	
	//지출결의서 수정(결재 이루어지지 않았을 경우에만) (update)
	int updateExpd(Expd e);
	//지출결의서 삭제(결재 이루어지지 않았을 경우에만)(delete)
	int deleteExpd(Expd e);
	//지출결의서 임시저장(update)
	int updateTempExpd(Expd e);
	//==========================================
	
	
	
	
	
	//페이지 조회(페이징)
			int selectLeaveListCount();
			ArrayList<Leave> selectLeaveList(PageInfo pi);
	//결재예정문서 조회(select)
	
	//결재대기문서 조회(select)
	
	//결재완료문서 조회(select)
	
	//기안서 결재(update)

}
