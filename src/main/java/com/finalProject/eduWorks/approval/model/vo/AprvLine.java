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
public class AprvLine {
	//결재선
	
	private int lineNo;
	private String aprvNo;
	private String memNo;
	private String level;
	private String status;
	private Date acceptDate;
	private String rejectReason;
}
