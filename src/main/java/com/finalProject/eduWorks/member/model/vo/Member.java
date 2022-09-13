package com.finalProject.eduWorks.member.model.vo;

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
public class Member {
	private String memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String deptCode;
	private String jobCode;
	private String memPhone;
	private String memBusinessnum;
	private String memEmail;
	private String memBirth;
	private int memPostalCode;
	private String memPostalAd;
	private String memPostalDetail;
	private String memPostalRefer;
	private String memEnrollDate;
	private String memResignDate;
	private String memResignStatus;
	private String memProfile;
	private String jobName;
}
