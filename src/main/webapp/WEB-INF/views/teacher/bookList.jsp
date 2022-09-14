<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/book.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
		
		        <!-- 게시판 영역 -->
		<div class="col-12" style="padding:0; width: 100%;">
			<!-- Page Heading -->
			<div class="d-sm-flex align-items-center mb-4" id="boardHeader">
			    <h2 style="color:black">교재 목록</h2>
			</div>
			
			<br>
			
		
			<div class="tableOption" style="display:flex; justify-content: space-between;">
				<div class="btn_two_spacing">
				       <button id="submit">등록</button>
				</div>
				
				<script>
					$(function(){
						$("#submit").click(function(){
							location.href = 'bookEnrollForm.bk';
						})
					})
				</script>
			
			<div class="filterHead">
			    <div class="searchbar">
			        <b>검색</b>　
			        <input type="text" placeholder="텍스트 검색" style="height:25px;">
			            <a href="" style="color:slategray"><i class="fas fa-search fa-fw"></i></a>
			        </div>
			     <br>   
			    </div>
			    
			</div>
		
			<div class="main_width" style="width: 100%;">
			    <table id="book" class="board-content table" align="center">
			        <thead>
			            <tr class="table_thead_border" style="background-color:white">
			                <th width="5%">번호</th>
			                <th width="30%">신청 교재명</th>
			                <th width="14%">강사명</th>
			            </tr>
			        </thead>
			        
			        <tbody class="board-tbody">
			        <c:choose>
			       		<c:when test="${ empty list }">
				        	<tr>
				        		<td colspan="3">등록된 교재가 없습니다.</td>
				        	</tr>
				        </c:when>
				        <c:otherwise>
					        <c:forEach var="b" items="${ list }">
								<tr>
					                <td class="no">${ b.bookNo }</td>
					                <td>${ b.bkTitle }</td>
					                <td>${ b.memName }</td>
					            </tr>
				            </c:forEach>
			            </c:otherwise>
			        </c:choose>
			        </tbody>
			    </table>
			    
			    <br><br>
			    
			    <script>
			    	$(function(){
			    		$("#book>tbody>tr").click(function(){
			    			location.href = 'bookDetailView.bk';
			    		})
			    		
			    	})
			    </script>
			    
			    
			</div>
		
			<div style="margin:30px 0 30px 0">
			    <nav aria-label="Page navigation example">
			        <ul class="pagination justify-content-center">
			        	
			        	<c:choose>
			        		<c:when test="${ pi.currentPage eq 1 }">
					        	<li class="page-item disabled">
						            <a class="page-link" style="color:lightgray" href="#" aria-label="Previous">
						            <span aria-hidden="true">&laquo;</span>
						            </a>
						        </li>
						    </c:when>
						    <c:otherwise>
						    	<li class="page-item">
						            <a class="page-link" style="color:slategray" href="bookList.bk?cpage=${ pi.currentPage-1 }" aria-label="Previous">
						            <span aria-hidden="true">&laquo;</span>
						            </a>
						        </li>
						    </c:otherwise>
						</c:choose>
					        
				        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				        	<li class="page-item"><a class="page-link" style="color:slategray" href="bookList.bk?cpage=${ p }">${ p }</a></li>
				        </c:forEach>
					        
					    <c:choose>
			        		<c:when test="${ pi.currentPage eq pi.maxPage }">
					        	<li class="page-item disabled">
						            <a class="page-link disabled" style="color:lightgray" aria-label="Next">
						            <span aria-hidden="true">&raquo;</span>
						            </a>
						        </li>
						    </c:when>
						    <c:otherwise>
						    	<li class="page-item">
						            <a class="page-link" style="color:slategray" href="bookList.bk?cpage=${ pi.currentPage+1 }" aria-label="Next">
						            <span aria-hidden="true">&raquo;</span>
						            </a>
						        </li>
						    </c:otherwise>
						</c:choose>    
					        
					        
					       
			        
			        </ul>
			    </nav>
			</div>
		                
		</div>
		

	
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>