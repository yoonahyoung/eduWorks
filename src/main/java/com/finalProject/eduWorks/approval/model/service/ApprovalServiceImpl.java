package com.finalProject.eduWorks.approval.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.finalProject.eduWorks.approval.model.vo.Draft;
import com.finalProject.eduWorks.approval.model.vo.Expd;
import com.finalProject.eduWorks.approval.model.vo.Leave;
import com.finalProject.eduWorks.common.model.vo.PageInfo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	@Override
	public int insertDraft(Draft d) {
		return 0;
	}

	@Override
	public int updateDraft(Draft d) {
		return 0;
	}

	@Override
	public int deleteDraft(int aprvNo) {
		return 0;
	}

	@Override
	public int updateTempDraft(Draft d) {
		return 0;
	}

	@Override
	public int insertLeave(Leave l) {
		return 0;
	}

	@Override
	public int updateLeave(Leave l) {
		return 0;
	}

	@Override
	public int deleteLeave(int aprvNo) {
		return 0;
	}

	@Override
	public int updateTempLeave(Leave l) {
		return 0;
	}

	@Override
	public int insertExpd(Expd e) {
		return 0;
	}

	@Override
	public int updateExpd(Expd e) {
		return 0;
	}

	@Override
	public int deleteExpd(Expd e) {
		return 0;
	}

	@Override
	public int updateTempExpd(Expd e) {
		return 0;
	}

	@Override
	public int selectLeaveListCount() {
		return 0;
	}

	@Override
	public ArrayList<Leave> selectLeaveList(PageInfo pi) {
		return null;
	}
 
 
  }