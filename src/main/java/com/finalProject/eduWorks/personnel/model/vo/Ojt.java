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
public class Ojt {
	private String memNo;
	private String memName;
	private String deptName;
	private String jobName;
	private String ojtDate;
	private String ojtStatus;
	private String memEmail;
}
