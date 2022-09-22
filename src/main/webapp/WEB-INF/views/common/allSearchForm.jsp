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
	
	<div class="wrapSearch" style="margin:20px">

		<h1>검색 결과</h1>
		<br><br>
		

		<div class="searchResult">

			<div class="mailResult">
					<h3>메일</h3><br>
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
			
			

			<div class="companyNoticeResult">
					<h3>전사 공지</h3><br>
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
						<h3>부서 게시판</h3><br>
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
					<h3>캘린더</h3><br>
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
				<hr>
			</div>

		</div>
		<div>
			<h4>다음 메뉴에 대해 일치하는 검색 결과가 없습니다.</h4>
			<div>
				<c:if test="${ empty mail }">
					<span><i class="fa-solid fa-envelope"></i> 메일</span>&nbsp;&nbsp;
				</c:if>
				<c:if test="${ empty notice }">
					<span><i class="fa-sharp fa-solid fa-clipboard-list"></i> 전사 공지</span>&nbsp;&nbsp;
				</c:if>
				<c:if test="${ empty board }">
					<span><i class="fa-solid fa-rectangle-list"></i> 부서 게시판</span>&nbsp;&nbsp;
				</c:if>
				<c:if test="${ empty schedule }">
					<span><i class="fa-solid fa-calendar-check"></i> 캘린더</span>
				</c:if>
			</div>
			<br><br>
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
			if(${empty notice}){
				$(".companyNoticeResult").css("display", "none");
			}
		})
		
		$(function(){
			if(${empty schedule}){
				$(".calendarResult").css("display", "none");
			}
		})
	</script>
</body>
</html>