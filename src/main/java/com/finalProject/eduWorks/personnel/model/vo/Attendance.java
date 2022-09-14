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
public class Attendance {
	private String attNo;
	private String memNo;
	private String attDate;
	private String attFixedin;
	private String attFixedout;
	private String attIn;
	private String attOut;
	private String attWorkoff;
	private String attWorktime;
	private String attStatus;
	private String attHstatus;
}
