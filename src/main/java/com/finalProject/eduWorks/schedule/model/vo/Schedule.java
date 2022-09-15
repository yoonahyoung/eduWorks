package com.finalProject.eduWorks.schedule.model.vo;

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
public class Schedule {
	
	private int scheNo;
	private String scheTitle;
	private String scheWriter;
	private String scheStartDate;
	private String scheEndDate;
	private String scheAll;
	private String scheCmpy;
	private String scheOpen;
	private String mycalNo;
	private String scheAtndNo;
	private String scheAtndList;
	private String schePlace;
	private String scheContent;
	private String scheCreateDate;
	private String scheModifyDate;
	private String scheStatus;
	
	private Mycal Mycal;

}
