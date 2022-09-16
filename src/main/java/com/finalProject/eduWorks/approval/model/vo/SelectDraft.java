package com.finalProject.eduWorks.approval.model.vo;

import java.util.ArrayList;
import java.util.Date;

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
public class SelectDraft {

	
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
	 private Date draftDate; //기안내용 시행일자
	 private String draftContent; //기안내용
	 private String deptCode; //협조부서
}
