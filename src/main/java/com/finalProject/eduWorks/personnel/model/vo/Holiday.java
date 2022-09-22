package com.finalProject.eduWorks.personnel.model.vo;

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
public class Holiday {
	private String memNo;
	private String hoDate;
	private double hoNum;
	private String hoComment;
	private String memName;
	private String jobName;
	private String deptName;
}
