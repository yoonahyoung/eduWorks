package com.finalProject.eduWorks.teacher.model.vo;

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
public class Teacher {
	
	private int classNo;
	private String classTitle;
	private String classContent;
	private String classObjective;
	private String classSubject;
	private String classStudent;
	private String classStartDate;
	private String classEndDate;
	private String memNo;
	private String classApproval;
	private String classStatus;
	private String classFee;
	private String classSignupDate;
	private String memName;

}
