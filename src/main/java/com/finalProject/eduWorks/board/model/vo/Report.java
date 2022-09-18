package com.finalProject.eduWorks.board.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Report {
	private int rptNo;
	private String rptRefCat;
	private int rptBoardNo;
	private String boardTitle;
	private String rptMemNo;
	private int rptReasonNo;
	private Date rptDate;
	private String rptStatus;
	private Date rptStDate;
	private String rptReason;
	private int rptCount;
}
