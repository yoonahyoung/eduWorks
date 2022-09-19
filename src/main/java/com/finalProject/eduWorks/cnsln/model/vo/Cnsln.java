package com.finalProject.eduWorks.cnsln.model.vo;

import com.finalProject.eduWorks.member.model.vo.Member;

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
public class Cnsln {
	
	private int cnslnNo;
	private String cnslnTitle;
	private String cnslnWriter;
	private String cnslnStartDate;
	private String cnslnEndDate;
	private String cnslnStatus;
	private String cnslnChargeNo;
	private String cnslnChargeList;
	private String cnslnPhone;
	private String cnslnTopic;
	private String cnslnContent;
	private String cnslnReal;
	private String cnslnCreateDate;
	private String cnslnModifyDate;
	private int cnslnCount;
	
	private Member Member;

}
