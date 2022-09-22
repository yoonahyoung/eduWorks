<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/lecture.css" rel="stylesheet" type="text/css">
<style>
	.wrapSearch h1, .wrapSearch h3{
		color:black;
	}
</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<div class="wrapSearch" style="margin:10px">

		<h1>검색 결과</h1>
		<br><br>
		

		<div class="searchResult">

			<div class="mailResult">
					<h3>메일</h3><br><br>
				<c:forEach var="m" items="${ mail }">
				<div class="searchForm">
					<div id="mailView">
							<span id="target" style="color:black;">${ m.sendName }</span>
							<a href="#">${ m.mailContent }</a>
							<span>${ m.sendDate }</span>
					</div>
				</div>
				<br><br>
				</c:forEach>
				<hr>
			</div>
			
			<script>
			  let target = document.getElementById('target');

			  let src = target.innerHTML;
			  console.log( src );
			  /**
			   * ->
			   * <h1>This Content is target</h1>
			   * <span>to replace</span>
			   * .
			   */
			  let extractedText = src.replace(extractTextPattern, '');
			  console.log( extractedText );
			  /**
			   * ->
			   * This Content is target
			   * to replace
			   * .
			   */
			</script>

			<div class="companyNoticeResult">
					<h3>전사 공지</h3><br><br>
				<c:forEach var="n" items="${ notice }">
				<div class="searchForm">
					<div id="noticeView">
						<div style="color:black;">${ n.boardTitle }</div>
						<a href="">${ n.boardContent }</a>
					</div>
				</div>
				<br><br>
				</c:forEach>
					<hr>
			</div>

			<div class="deptBoardResult">
						<h3>부서 게시판</h3><br><br>
				<c:forEach var="b" items="${ board }">
					<div class="searchForm">
						<div id="BoardView">
							<div style="color:black;">${ b.boardTitle }</div>
							<br>
							<a href="">${ b.boardContent }</a>
						</div>
					</div>
					<br><br>
				</c:forEach>
						<hr>
			</div>
				
			<div class="calendarResult">
					<h3>캘린더</h3><br><br>
				<c:forEach var="s" items="${ schedule }">
				<div class="searchForm">
					<div id="calendarView">
						<span style="color:black;">${ s.scheStartDate } / ${ s.scheEndDate }</span>
						<a href="">${ s.scheTitle }</a>
						<br>
						<span>참석자 </span>&nbsp;
						<span> | </span>&nbsp;
						<span style="color:black;"> ${ s.scheAtndList } </span>
					</div>
				</div>
				</c:forEach>
			</div>

		</div>
	</div>
	<jsp:include page="footer.jsp" />


	<script type="text/javascript">   
		$(function(){
			if(${empty mail}){
				$(".mailResult").css("display", "none");
			}
		})
		
		$(function(){
			if(${empty board}){
				$(".deptBoardResult").css("display", "none");
			}
		})
		
		$(function(){
			if(${empty mail}){
				$(".noticeResult").css("display", "none");
			}
		})
		
		$(function(){
			if(${empty mail}){
				$(".calendarResult").css("display", "none");
			}
		})
	</script>
</body>
</html>