package com.finalProject.eduWorks.schedule.model.vo;

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
public class Likecal {
	
	private int likecalNo;
	private String memNo;
	private String likeMemNo;
	private String likecalStatus;
	
	private Schedule Schedule;
	private Member Member;

}
