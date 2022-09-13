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

public class Mycal {
	
	private int mycalNo;
	private String memNo;
	private String mycalName;
	private String mycalColor;
	private String mycalCreateDate;
	private String mycalModifyDate;
	private String mycalStatus;

}
