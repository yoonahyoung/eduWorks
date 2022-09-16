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
public class Expd {
 private String aprvNo;
 private String expdDate;
 private int memNo;
 private int totalAmount;
 private String expdReason;
 private ApprovalForm approvalForm;
 private Member member;
 //결재선
 private ArrayList<AprvLine>aLine;
 //추가 영역
 private ArrayList<ExpdEach>eachList;
 
 
	
}
