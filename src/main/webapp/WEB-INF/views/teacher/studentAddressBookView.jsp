<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/addressBook.css" rel="stylesheet" type="text/css">

<title>강사 학생 주소록</title>
</head>
<body>

	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid" style="display: flex;">

		<!-- 게시판 영역 -->
		<div class="main-content">
			<!-- Page Heading -->
			<div class="second-title">
				<h2 class="su_sub_menu_name"> 학생 주소록 <span style="font-size:18px"> ${ loginUser.memName } ${ loginUser.jobName }님</span></h2>
			</div>
			
			<br><br>
			
			<div class="tableOption">
				<div class="searchbar" align="center">
					<input type="text" id="teAdKeyword" placeholder="검색">
					<button type="submit" class="address-search" onclick="goCategory(1)">
						<i class="fas fa-search fa-lg"></i>
					</button>
				</div>
				
				<div class="selectOption" style="margin-bottom: 10px">
					<select id="teAdDate" onchange="goCategory(1)">
						<option value="desc">최신순</option>
						<option value="asc" selected>오래된순</option>
					</select>
				</div>
			</div>
			
			<div class="main-list">
				<table class="board-content table" align="center">
					<thead>
						<tr class="table_thead_border">
							<th width="3%">번호</th>
							<th width="10%">이름</th>
							<th width="18%">신청 강의</th>
							<th width="18%">이메일</th>
						</tr>
					</thead>
					<tbody class="board-tbody">
						<c:choose>
							<c:when test="${empty list }">
								<td colspan="6">현재 주소록이 없습니다.</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="a" items="${list}">
									<tr>
										<td class="no">${a.studentNo}</td>
										<td>${a.studentName}</td>
										<td>${a.classTitle}</td>
										<td>${a.studentEmail}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<br> <br>
			</div>

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
			                        <a class="page-link" onclick="goCategory(${ pi.currentPage-1 })" aria-label="Previous">
			                        	<span aria-hidden="true">&laquo;</span>
			                        </a>
			                    </li>
		                    </c:otherwise>
		            	</c:choose>
		            	
		            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
		            		<li class="page-item"><a class="page-link" onclick="goCategory(${ p })">${ p }</a></li>
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
			                        <a class="page-link" onclick="goCategory(${ pi.currentPage+1 })" aria-label="Next">
			                        	<span aria-hidden="true">&raquo;</span>
			                        </a>
			                    </li>
		                    </c:otherwise>
		            	</c:choose>
                    </ul>
                </nav>
            </div>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".main-list").on("click", ".board-content>tbody>tr", function(){
       			// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
       			location.href = "detailSt.ad?no=" + $(this).children(".no").text(); 
       		})
		})
		
		function goCategory(page){
			// 분류 및 검색에 따른 리스트 ajax로 뿌려주기
			$.ajax({
				url:"option.st",
				data:{
					keyword:$("#teAdKeyword").val(),
					chkDate:$("#teAdDate").val(),
					page:page,
					memNo:${loginUser.memNo},
					isTeacher:1
				},
				success(map){
					let list = map.list;
					let pi = map.pi;
					value = "";
					pValue ="";
					
					if(list == null){
						value += '<tr>'
								+ '<td colspan="6">검색된 결과가 없습니다.</td>'
						  	  + '</tr>';
					}else{
						for(let i=0; i<list.length; i++){
							value += '<tr>'
										+ '<td class="no">' + list[i].studentNo + '</td>'
										+ '<td>' + list[i].studentName + '</td>'
										+ '<td>' + list[i].classTitle + '</td>'
										+ '<td>' + list[i].studentEmail + '</td>'
								   + '</tr>';
						}
						
						// 페이징바 처리
       					if(pi.currentPage == 1){
       						pValue += '<li class="page-item">'
       									+ '<a class="page-link disabled" aria-label="Previous">'
       										+ '<span aria-hidden="true">&laquo;</span>'
       									+ '</a>'
       								+ '</li>';
       					}else{
       						pValue += '<li class="page-item">'
       									+ '<a class="page-link" onclick="goCategory(' + (pi.currentPage-1) + ')" aria-label="Previous">'
       										+ '<span aria-hidden="true">&laquo;</span>'
       									+ '</a>'
       								+ '</li>';
       					}
       					
       					for(let p=pi.startPage; p<= pi.endPage; p++){
       						pValue += '<li class="page-item"><a class="page-link" onclick="goCategory(' +  p  + ')">' +  p + '</a></li>';
       					}
          	
       					if(pi.currentPage == pi.maxPage){
       						pValue += '<li class="page-item">'
       									+ '<a class="page-link disabled"  aria-label="Next">'
       										+ '<span aria-hidden="true">&raquo;</span>'
       									+ '</a>'
       								+ '</li>';
       					}else{
       						pValue += '<li class="page-item">'
       									+ '<a class="page-link" onclick="goCategory(' + (pi.currentPage+1) + ')" aria-label="Next">'
       										+ '<span aria-hidden="true">&raquo;</span>'
       									+ '</a>'
       								+ '</li>';
       					}
       					
       					$(".board-tbody").empty();
       					$(".board-tbody").html(value);
       					$("#n-pagingBar ul").empty();
       					$("#n-pagingBar ul").html(pValue);
					}
				},
				error(){
					console.log("ajax통신 실패");
				}
			})
		}
	</script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>