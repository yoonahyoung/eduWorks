package com.finalProject.eduWorks.promotion.model.vo;

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
public class Promotion {
	
	private int promoNo;
	private String promoTitle;
	private String promoCateNo;
	private String promoWriter;
	private String promoContent;
	private int promoCount;
	private String promoCreateDate;
	private String promoModifyDate;
	private String promoStatus;

}
