package com.finalProject.eduWorks.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 
 * @author ahyoungyoon
 * 
 * @param boardNo 글 번호
 * @param boardTitle 글 제목
 * @param boardContent 글 내용
 * @param boardWriter 작성자 사원번호
 * @param boWriter 작성자명
 * @param deptCode 작성자 부서코드
 * @param jobName 작성자 직급명
 * @param boardCount 조회수
 * @param boardCategory 게시판 카테고리(1:전사공지, 2: 부서게시판, 3:익명게시판)
 * @param boardEnDate 게시판 작성일
 * @param boardMoDate 게시판 수정일
 * @param boardStatus 게시판 상태 (Y/N/B)
 * @param boardTop 공지여부(Y/N)
 *
 */
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Board {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int boardWriter;
	private String boWriter;
	private String deptCode;
	private String jobName;
	private int boardCount;
	private int boardCateory;
	private String boardEnDate;
	private String boardMoDate;
	private String boardStatus;
	private String boardTop;
}
