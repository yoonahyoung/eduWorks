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
public class Like {
	private int memNo;
	private int boardNo;
	private Date likeDate;
	private int likeCount;
}
