package com.finalProject.eduWorks.common.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Alarm {
	
	private String alNo;
	private String targetMno;
	private String category;
	private String alBoardNo;
	private String alContent;
	private Date alDate;
	private Date alReadDate;

}
