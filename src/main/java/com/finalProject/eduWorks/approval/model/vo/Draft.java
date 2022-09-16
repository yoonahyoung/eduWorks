package com.finalProject.eduWorks.approval.model.vo;

import java.util.ArrayList;
import java.util.Date;

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
public class Draft {
	//기안신청서
 private String aprvNo; //문서고유번호
 private String memNo; //사원번호
 private Date draftDate; //기안내용 시행일자
 private String draftContent; //기안내용
 private String deptCode; //협조부서
}
