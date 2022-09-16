package com.finalProject.eduWorks.approval.model.vo;

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

public class ApprovalForm {

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
	//첨부파일
	private String originName;
	private String changeName;
	
	
	//댓글
	
	
}
