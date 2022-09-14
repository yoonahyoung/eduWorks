<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 게시판 조회</title>

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- Begin Page Content -->
	<div>
	    <div class="row">
	        <!-- 게시판 영역 -->
	        <div class="col-12" >
	            <!-- Page Heading -->
	            <div class="d-sm-flex align-items-center mb-4" id="boardHeader">
	                <h2>부서 게시판 | ${ deptName }</h2>  
	            </div>
	
	            <br><br><br><br><br>
	            
	            <div style="text-align: center;">
	                <input type="text" style="width: 300px;" id="promoKeyword" placeholder="제목/작성자 입력">
	                <button type="button" class="su_btn_border btn-sm su_btn_search">검색</button>
	            </div>
				
				<br><br>
				
	            <div class="tableOption">
	                <div class="btn_two_spacing">
	                    <button id="importantNotice">공지등록</button><i class="fas fa-flag"></i>
	                    <button id="importantNotice">공지해제</button><i class="fas fa-font-awesome"></i>
	                </div>
	                
	            </div>
	            
	            <div class="main_width">
	                <table class="board-content table" align="center" id="noticeList"> 
	                    <thead>
	                        <tr class="table_thead_border">
	                            <th width="2%"><input type="checkbox" id="checkAll"></th>
	                            <th width="5%">번호</th>
	                            <th width="30%">제목</th>
	                            <th width="7%">작성자</th>
	                            <th width="7%">작성일</th>
	                            <th width="5%">조회수</th>
	                        </tr>
	                    </thead>
	                    <tbody class="board-tbody">
	                        <c:choose>
	                        	<c:when test="${ empty list }">
	                        		<tr>
	                        			<td colspan="6">등록된 글이 없습니다.</td>
	                        		</tr>
	                        	</c:when>
	                        	<c:when test="${ not empty topList }">
	                        		<c:forEach var="tn" items="${topList}">
				                        <tr style="background:rgb(250, 232, 232)">
				                            <td><input type="checkbox" id="checkNo${tn.boardNo}"></td>
				                            <td class="no">${ tn.boardNo }</td>
				                            <td>${ tn.boardTitle }</td>
				                            <td>${ tn.boWriter }</td>
				                            <td>${ tn.boardEnDate }</td>
				                            <td>${ tn.boardCount }</td>
				                        </tr>
				                    </c:forEach>
	                        	</c:when>
	                        </c:choose>
	                        	<c:if test="${ not empty list }">
	                        		<c:forEach var="n" items="${list}">
	                        			<c:if test="${ n.boardTop eq 'N'}">
					                        <tr>
					                            <td><input type="checkbox" id="checkNo${tn.boardNo}"></td>
					                            <td class="no">${ n.boardNo }</td>
					                            <td>${ n.boardTitle }</td>
					                            <td>${ n.boWriter }</td>
					                            <td>${ n.boardEnDate }</td>
					                            <td>${ n.boardCount }</td>
					                        </tr>
				                        </c:if>
				                    </c:forEach>
			                    </c:if>
	                        <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!리스트 화면 검색기능, 여러개 클릭기능 구현(하다말았음) -->
	                    </tbody>
	                </table>
	                <script>
			           	$(function(){ // 상세화면
			           		$("#noticeList>tbody>tr").click(function(){
			           			// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
			           			location.href = "detail.de?no=" + $(this).children(".no").text(); 
			           		})
			           	})
			        </script>
	                <br><br>
	                
	            </div>
	            <div class="board-write-btn" align="right">
                    <button type="button" class="btn" id="bWrite-btn" onclick="location.href='enrollForm.de';">글작성</button>
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
				                        <a class="page-link" href="list.de?cpage=${ pi.currentPage-1 }" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
			            	
			            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            		<li class="page-item"><a class="page-link" href="list.de?cpage=${ p }">${ p }</a></li>
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
				                        <a class="page-link" href="list.de?cpage=${ pi.currentPage+1 }" aria-label="Next">
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
	   
	</div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>