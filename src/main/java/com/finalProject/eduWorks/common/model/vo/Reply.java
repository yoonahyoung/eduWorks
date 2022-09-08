package com.finalProject.eduWorks.common.model.vo;

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
public class Reply {
	
	private int replyNo;
	private int replyType;
	private int reBoardNo;
	private int replyDepth;
	private int replyParent;
	private String replyContent;
	private String replyWriter;
	private String replyBlind;
	private String replyDate;
	private String replyNoDate;
	private String replyStatus;
	
}
