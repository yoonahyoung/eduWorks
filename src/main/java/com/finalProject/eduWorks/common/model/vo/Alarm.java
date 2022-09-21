package com.finalProject.eduWorks.common.model.vo;

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
	private String alTargetMno;
	private String alCategory;
	private String alBoardNo;
	private String alContent;
	private String alDate;
	private String alReadDate;
	private int alCount;
	private int listNo;
	private int boardCategory;
	private String boardStatus;
}
