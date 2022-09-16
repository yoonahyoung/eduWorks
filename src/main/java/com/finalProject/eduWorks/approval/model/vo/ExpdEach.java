package com.finalProject.eduWorks.approval.model.vo;

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
public class ExpdEach {
	private int eachNo;
	private String aprvNo;
	private String date;
	private String type;
	private int eachPrice;
	private String eachContent;
	private String eachNote;
	
}
