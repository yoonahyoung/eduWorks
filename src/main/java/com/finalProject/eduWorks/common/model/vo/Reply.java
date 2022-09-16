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
	private String replyJob;
	private String replyBlind;
	private String replyDate;
	private String replyNoDate;
	private String replyStatus;
	private int replyCount; // 게시판 listView에서 boardNo에 따른 댓글 갯수 뿌려주기 위한 용도
}
