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
	String memNo;
	String memId;
	String memPwd;
	String memName;
	String deptCode;
	String jobCode;
	String memPhone;
	String memBusinessnum;
	String memEmail;
	String memBirth;
	int memPostalCode;
	String memPostalAd;
	String memPostalDetail;
	String memPostalRefer;
	String memEnrollDate;
	String memResignDate;
	String memResignStatus;
	String memProfile;
}
