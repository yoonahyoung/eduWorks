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

<title>공용 주소록</title>
</head>
<body>

	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid" style="display: flex;">

		<!-- 게시판 영역 -->
		<div class="main-content">
			<!-- Page Heading -->
			<div class="second-title">
				<h2>전사 주소록</h2>
			</div>

			<div>
				<button type="button" class="reply-btn" onclick="writeMail();">
					<i class="fas fa-location-arrow"></i>&nbsp;&nbsp;메일 작성
				</button>
			</div>

			<script>
                        
                function writeMail() {
                   location.href="writeMailForm.ma";
                }
                        
            </script>

			<div class="tableOption">
				<!-- ==================== 연락처 검색 =================== -->
				<form action="searchPublicAdd.ad" method="post">
					<div class="searchbar" align="center">
						<input type="text" name="keyword" placeholder="검색">
						<button type="submit" class="address-search">
							<i class="fas fa-search fa-lg"></i>
						</button>
					</div>
				</form>

				<div class="selectOption" style="margin-bottom: 10px">
					<select>
						<option value="">최신순</option>
						<option value="">오래된순</option>
					</select>
				</div>
			</div>

			<div class="main-list">
				<table class="board-content table" align="center">
					<thead>
						<tr class="table_thead_border">
							<th width="3%"><input type="checkbox" id="allCheck"
								onclick="allCheck(this)"></th>
							<th width="10%">이름</th>
							<th width="10%">부서명</th>
							<th width="10%">직급명</th>
							<th width="15%">내선번호</th>
							<th width="18%">이메일</th>
							<th width="15%">전화번호</th>
						</tr>
					</thead>
					<tbody>
						<!-- 값은 다 DB와 연결될 것 -->
						<!-- 반복문 시작 -->
						<c:choose>
							<c:when test="${empty list }">
								<td colspan="7">현재 주소록이 없습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="a" items="${list }">
									<tr>
										<td><input name="memNo" type="checkbox"
											value="${a.memNo }"></td>
										<td>${a.memName }</td>
										<td>${a.deptCode }</td>
										<td>${a.jobCode }</td>
										<td>${a.memBusinessnum }</td>
										<td>${a.memEmail }</td>
										<td>${a.memPhone }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<br> <br>
			</div>

			<Script>
			
			  // '전체클릭'버튼 클릭시 실행하는 함수
			  function allCheck(allCheck){
				  				  
				  let checkboxes = document.getElementsByName("memNo");
				  
		           checkboxes.forEach((checkbox)=>{
		        	   
		              checkbox.checked = allCheck.checked; // 전체 클릭 클릭시 => 항목 전체 선택 실행
		              
		           });
		        }
			  

              // 더블클릭시 해당 선택자에게 메일 보내는 함수 실행
              $(function() {
                   $(".board-content>tbody>tr").dblclick(function() {
                        location.href="sendMail.ma?mail=" + $(this).children().eq(5).text();
                    })
               })

           </Script>

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
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${pi.currentPage eq 1 }">
										<!-- 현재 페이지가 1인 경우 -->
										<li class="page-item"><a class="page-link disabled"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:when>

									<c:otherwise>
										<c:choose>
											<c:when test="${empty keyword }">
											<!-- 현재 페이지가 1이 아니고, keyword가 입력되지 않은 경우 -->
												<li class="page-item"><a class="page-link"
													href="publicAddress.ad?page=${pi.currentPage -1 }"
													aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
												</a></li>
											</c:when>
											<c:otherwise>
											<!-- 현재 페이지가 1이 아니고, keyword가 입력된 경우 -->
											<li class="page-item"><a class="page-link"
												href="searchPublicAdd.ad?page=${pi.currentPage -1 }&keyword=${keyword}"
												aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
											</a></li>
											</c:otherwise>
										</c:choose>	
									</c:otherwise>
								</c:choose>

								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<c:choose>
										<c:when test="${empty keyword }">
										<!-- 검색 전 페이징 바(keyword 입력 전) -->
											<li class="page-item"><a class="page-link"
												href="publicAddress.ad?page=${p }">${p }</a></li>
										</c:when>
										<c:otherwise>
											<!-- 검색 후 페이징 바(keyword 입력 후) -->
											<li class="page-item"><a class="page-link"
												href="searchPublicAdd.ad?page=${p }&keyword=${keyword}">${p }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:choose>
									<c:when test="${pi.currentPage eq pi.maxPage }">
										<!-- 현재 페이지가 마지막인 경우 -->
										<li class="page-item"><a class="page-link disabled"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<!-- 현재 페이지가 마지막이 아닌 경우 -->
										<c:choose>
											<c:when test="${empty keyword }">
												<!-- 현재 페이지가 마지막이 아니고, keyword가 입력되지 않은 경우 -->
												<li class="page-item"><a class="page-link"
													href="publicAddress.ad?page=${pi.currentPage + 1}"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</c:when>
											<c:otherwise>
												<!-- 현재 페이지가 마지막이 아니고, keyword가 입력된 경우 -->
												<li class="page-item"><a class="page-link"
													href="searchPublicAdd.ad?page=${pi.currentPage + 1}&keyword=${keyword}"
													aria-label="Next"> <span aria-hidden="true">&raquo;</span>
												</a></li>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- /.container-fluid -->

	<jsp:include page="../common/footer.jsp" />
</body>
</html>