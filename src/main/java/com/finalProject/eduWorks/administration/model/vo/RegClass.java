package com.finalProject.eduWorks.administration.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class RegClass {

	private int regNo;
	private int classNo;
	private int studentNo;
	private String memName; // 강사명
	private String studentId;
	private String studentName;
	private String classTitle;
	private Date classStartDate;
	private Date classEndDate;
	private String classFee;
	private Date regDate;
	private String regStatus;
	private String regReturn;
}
