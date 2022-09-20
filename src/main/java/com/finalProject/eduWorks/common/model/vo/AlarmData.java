package com.finalProject.eduWorks.common.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class AlarmData {
	private String cmd;
	private String boardNo;
	private String boardTitle;
	private String boardWriter;
	private String replyWriter;
	private String currentUser;
	private String alarmContent;
}
