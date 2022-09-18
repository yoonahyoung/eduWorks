<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link
	href="${pageContext.request.contextPath}/resources/css/addressBook.css"
	rel="stylesheet" type="text/css">

<title>학생 주소록(전체)</title>
</head>
<body>

	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid" style="display: flex;">

		<!-- 게시판 영역 -->
		<div class="main-content">
			<!-- Page Heading -->
			<div class="second-title">
				<h2 class="su_sub_menu_name">학생 주소록</h2>
			</div>
			
			<br><br>
			
			<div class="tableOption">
				<!-- ==================== 연락처 검색 =================== -->
				<form action="searchStudentAdd.te" method="post">
					<div class="searchbar" align="center">
						<input type="text" name="keyword" placeholder="검색">
						<button type="submit" class="address-search">
							<i class="fas fa-search fa-lg"></i>
						</button>
					</div>
				</form>
				
			<c:choose>
				<c:when test="${empty keyword }">
					<div class="selectOption" style="margin-bottom: 10px">
					<!-- =============== 주소록 정렬 ================== -->
					<form action="publicAddress.ad" id="rangeForm" method="post">
						<select name="range">
							<option value="oldest">오래된순</option>
							<option value="newest">최신순</option>
						</select>
					</form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="selectOption" style="margin-bottom: 10px">
					<!-- =============== 주소록 정렬 ================== -->
					<form action="searchPublicAdd.ad" id="rangeSearchForm" method="post">
						<input type="hidden" name="keyword" value="${keyword }">
						<select name="range">
							<option value="oldest">오래된순</option>
							<option value="newest">최신순</option>
						</select>
					</form>
					</div>
				</c:otherwise>
			</c:choose>
			</div>

			<script>
				
				// 주소록 정렬시 실행하는 함수
				$(function(){
					$("select[name=range]").change(function(){
						$("#rangeForm").submit(); // 검색하지 않은 경우
						$("#rangeSearchForm").submit(); // 검색한 경우
					})
					
				})
				
			</script>
			
			<div class="main-list">
				<table class="board-content table" align="center">
					<thead>
						<tr class="table_thead_border">
							<th width="3%">번호</th>
							<th width="10%">이름</th>
							<th width="10%">아이디</th>
							<th width="10%">전화번호</th>
							<th width="18%">이메일</th>
							<th width="10%">등록일</th>
						</tr>
					</thead>
					<tbody>
						<!-- 값은 다 DB와 연결될 것 -->
						<!-- 반복문 시작 -->
						<c:choose>
							<c:when test="${empty list }">
								<td colspan="6">현재 주소록이 없습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="a" items="${list}">
									<tr>
										<td class="no">${a.studentNo}</td>
										<td>${a.studentName}</td>
										<td>${a.studentId}</td>
										<td>${a.studentPhone}</td>
										<td>${a.studentEmail}</td>
										<td>${a.studentEnDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<br> <br>
			</div>

			<!-- ============== 페이지 이동 ================== -->
			<div style="margin: 30px 0 30px 0">
				<c:choose>
					<c:when test="${empty list }">
						<!-- 연락처 목록 없는 경우 -->
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
							</ul>
						</nav>
					</c:when>
					<c:otherwise>
					<!-- 연락처 목록 있는 경우 -->
					<div id="n-pagingBar">
	                <nav aria-label="Page navigation example">
	                    <ul class="pagination justify-content-center"> 
	                    	<c:choose>
	                    		<c:when test="${ pi.currentPage eq 1 }">
	                    			<li class="page-item">
				                        <a class="page-link disabled" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
			                    	</li>
	                    		</c:when>
	                    		<c:otherwise>
				                    <li class="page-item">
				                        <a class="page-link" href="listSt.ad?cpage=${ pi.currentPage-1 }" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
			            	
			            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            		<li class="page-item"><a class="page-link" href="listSt.ad?cpage=${ p }">${ p }</a></li>
			            	</c:forEach>
			            	
			            	<c:choose>
	                    		<c:when test="${ pi.currentPage eq maxPage }">
	                    			<li class="page-item">
				                        <a class="page-link disabled" aria-label="Next">
				                        	<span aria-hidden="true">&raquo;</span>
				                        </a>
			                    	</li>
	                    		</c:when>
	                    		<c:otherwise>
				                    <li class="page-item">
				                        <a class="page-link" href="listSt.ad?cpage=${ pi.currentPage+1 }" aria-label="Next">
				                        	<span aria-hidden="true">&raquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
	                    </ul>
	                </nav>
	            	</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
	<!-- ================== 페이지 이동 ====================== -->
	<form id="moveForm" action="" method="post">
		<input type="hidden" name="page" id="page">
		<input type="hidden" name="keyword" id="keyword">
		<input type="hidden" name="range" id="pRange">
	</form>

	<script>
		$(function(){
			$(".board-content>tbody>tr").click(function(){
       			// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
       			location.href = "detailSt.ad?no=" + $(this).children(".no").text(); 
       		})
		})
		
		<!--================== 해당 페이지로 이동처리하는 함수 ================== -->
		function movePage(url, page, keyword, range){
			$("#moveForm").children("#page").val(page);
			$("#moveForm").children("#keyword").val(keyword);
			$("#moveForm").children("#pRange").val(range);
			$("#moveForm").attr("action", url).submit();
		}
	</script>
	
	<!-- /.container-fluid -->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>