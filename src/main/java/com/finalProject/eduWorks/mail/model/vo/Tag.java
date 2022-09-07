package com.finalProject.eduWorks.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 * @author 은영
 * 
 * @param tagNo : 태그번호
 * @param memNo : 태그 생성한 멤버 번호
 * @param tagName : 태그 이름
 * @param tagColor : 태그 색상
 * @param tagEnrollDate : 태그 등록일
 * @param tagModifyDate : 태그 수정일
 *
 */

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Tag {
	
	private int TagNo;
	private String memNo;
	private String tagName;
	private String tagColor;
	private String tagEnrollDate;
	private String tagModifyDate;

}
