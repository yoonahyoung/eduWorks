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
	.txt-hlight {
	background:  lightgray;
}
</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	
	<div class="wrapSearch" style="margin:40px">

		<h1>검색 결과</h1>
		<br><br>
		

		<div class="searchResult">

			<div class="mailResult">
					<h3>메일</h3><br>
				<c:forEach var="m" items="${ mail }">
				<div class="searchForm">
					<div id="mailView">
						<span id="target" style="color:black; font-size:large;" class="hara">${ m.sendName }</span>&nbsp;
						<a href="#" class="hara mailGo">${ m.mailTitle }<input type="hidden" value="${m.mailNo }"></a>&nbsp;
						<span>${ m.sendDate }</span>
					</div>
				</div>
				<br>
				</c:forEach>
				<br><hr>
			</div>
			
			

			<div class="companyNoticeResult">
					<h3>전사 공지</h3><br>
				<c:forEach var="n" items="${ notice }">
				<br>
				<div class="searchForm">
					<div id="noticeView">
						<div style="color:black; font-size:large; margin-bottom:10px;" class="hara">${ n.boardTitle }</div>
						<a href="detail.no?no=${ n.boardNo }" class="hara">${ n.boardContent }</a>
					</div>
				</div>
				<br>
				</c:forEach>
				<br><hr>
			</div>

			<div class="deptBoardResult">
						<h3>부서 게시판</h3><br>
				<c:forEach var="b" items="${ board }">
					<div class="searchForm">
						<div id="BoardView">
							<div style="color:black; font-size:large; margin-bottom:10px;" class="hara">${ b.boardTitle }</div>
							<a href="detail.de?no=${ b.boardNo }" class="hara">${ b.boardContent }</a>
						</div>
					</div>
					<br>
				</c:forEach>
				<br><hr>
			</div>
				
			<div class="calendarResult">
					<h3>캘린더</h3><br>
				<c:forEach var="s" items="${ schedule }">
				<br>
				<div class="searchForm">
					<div id="calendarView">
						<span style="color:black; font-size:large;">${ s.scheStartDate } / ${ s.scheEndDate }</span>
						<a href="detail.ca?sNo=${ s.scheNo }&memNo=${loginUser.memNo}" class="hara">${ s.scheTitle }</a>
						<br>
						<span>참석자 </span>&nbsp;
						<span> | </span>&nbsp;
						<span style="color:black;" class="hara"> ${ s.scheAtndList } </span>
					</div>
				</div>
				</c:forEach>
				<br><hr>
			</div>

		</div>
		<div>
			<h4>다음 메뉴에 대해 일치하는 검색 결과가 없습니다.</h4>
			<br>
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
		<form id="postMailDetail" action="mailDetail.ma" method="post">
			<input type="hidden" name="mailFolder" value="2">
			<input type="hidden" name="mailNo" id="detailNo">
			<input type="hidden" name="flag" value="B">
		</form>
	</div>
	<jsp:include page="footer.jsp" />


	<script type="text/javascript">   
		$(function(){
			$(".mailGo").click(function(){
				
				let mailNo = $(this).children('input[type=hidden]').val();
				console.log(mailNo);
				$("#detailNo").val(mailNo);
				$("#postMailDetail").submit();
	
			})
		})
	
	
	
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
	
	
	<div class="hara">이</div>
 
	<script>
		$(function () {
		    var search = $('#searchI').val();
		    $(".hara:contains('"+search+"')").each(function () {
		        var regex = new RegExp(search,'gi');
		        $(this).html( $(this).text().replace(regex, "<span class='txt-hlight'>"+search+"</span>") );
		    });
		});
	</script>


</body>
</html>