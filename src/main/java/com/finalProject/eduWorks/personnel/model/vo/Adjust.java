package com.finalProject.eduWorks.personnel.model.vo;

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
public class Adjust {
	private String adjNo;
	private String attNo;
	private String adjIn;
	private String adjOut;
	private String adjReason;
	private String adjDate;
	private String adjFile;
	private String adjStatus;
}
