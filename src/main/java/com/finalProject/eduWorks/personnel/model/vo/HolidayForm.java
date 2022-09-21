package com.finalProject.eduWorks.personnel.model.vo;

import java.util.ArrayList;

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
public class HolidayForm {
	private String aprvNo;
	private String memNo;
	private String aprvType;
	private String aprvDocStatus;
	private String aprvDocEndate;
	private String aprvStatus;
	private String leaveType;
	private String leaveStartDate;
	private String leaveEndDate;
	private String requestPeriod;
	private String sHalfDayLeave;
	private String fHalfDayLeave;
}
