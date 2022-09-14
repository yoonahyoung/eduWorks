package com.finalProject.eduWorks.teacher.model.vo;

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
public class Book {
	
	private int bookNo;
	private String memNo;
	private String bkTitle;
	private String bkContent;
	private String memName;
}
