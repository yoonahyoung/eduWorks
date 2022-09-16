package com.finalProject.eduWorks.approval.model.vo;

import java.util.ArrayList;

import com.finalProject.eduWorks.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class SelectExpd {
	private String aprvNo;
	private String memNo;
	private String shelfLife;
	private String secLevel;
	private String type;
	private String docStatus;
	private String docType;
	private String docEndDate;
	private String tmpSaveStatus;
	private String aprvStatus;
	private Member member;
	
	 private String expdDate;
	 private int exMemNo;
	 private int totalAmount;
	 private String expdReason;
	 private ApprovalForm approvalForm;
	 //결재선
	 private ArrayList<AprvLine>aLine;
	 //추가 영역
	 private ArrayList<ExpdEach>eachList;

}
