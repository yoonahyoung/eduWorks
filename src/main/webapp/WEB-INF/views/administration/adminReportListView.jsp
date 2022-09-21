<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 목록 조회</title>

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
	                <h2>신고 목록</h2>
	            </div>
	
	            <br><br>
				
	            <div class="tableOption" style="display:flex; flex-direction: row-reverse; margin-right:10px">
	                <div class="selectOption" style="margin-bottom:10px">
	                    <select>
	                        <option value="">신고많은순</option>
	                        <option value="">신고적은순</option> 
	                    </select>
	                    <select>
	                        <option value="">미처리</option>
	                        <option value="">처리</option> 
	                    </select>
	                </div>
	            </div>
                            
                <div class="main_width">
                    <table class="board-content table" id="reportList" align="center">
                        <thead>
                            <tr class="table_thead_border">
                                <th width="5%">번호</th>
                                <th width="5%">분류</th>
                                <th width="5%">신고수</th>
                                <th width="5%">처리 여부</th>
                                <th width="5%">상태 변경</th>
                                <th width="1%"></th>
                            </tr>
                        </thead>
                        <tbody class="board-tbody">
                        	<c:choose>
	                        	<c:when test="${ empty list }">
	                        		<tr>
	                        			<td colspan="6">등록된 신고가 없습니다.</td>
	                        		</tr>
	                        	</c:when>
	                        	<c:otherwise>
	                        		<c:forEach var="r" items="${list}" varStatus="status">
				                        <tr>
	                        			
				                            <td class="no">${ r.rptBoardNo }</td>
				                            <td class="rptRefCat">${ r.rptRefCat }</td>
				                            <td>${ r.rptCount }</td>
				                            <td>${ r.rptStatus }</td>
				                            <td onclick="event.stopPropagation()">
				                            	<c:if test="${ r.rptStatus eq 'N' }">
				                            		<button type="button" class="n-btn su_btn_border btn-sm reportStatus" onclick='goStatus("${r.rptNo}", "${ r.rptRefCat }", "${ r.rptBoardNo }");'>Y 처리</button>
				                            	</c:if>
				                            </td>
				                            <td class="no${ status.count }"><div id="rptNoStr" style="display:none;">${ r.rptNo }</div></td>
				                        </tr>
				                    </c:forEach>
			                    </c:otherwise>
	                        </c:choose>
                        </tbody>
                    </table>
                    <script>
			           	$(function(){ // 상세화면
			           		let rptBoardNo = "";
			           		let rptRefCat = "";
			           		let rptNoStr = "";
			           		$("#reportList>tbody>tr").click(function(){
			           			rptBoardNo = $(this).children(".no").text();
			           			rptRefCat = $(this).children(".rptRefCat").text();
			           			console.log(rptRefCat);
			           			rptNoStr = $(this).find("div").html();
			           			console.log(rptNoStr);
		           				// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
		           				location.href = "reportDetail.bl?no=" + rptBoardNo + "&rptRefCat=" + rptRefCat + "&rptNoStr=" + rptNoStr; 
			           		})
			          	})
			          	
			          	function goStatus(rptNo, rptRefCat, rptBoardNo){ // 블라인드 처리가 필요 없다고 느낄시 처리 완료 버튼
			           		
			           		console.log(rptNo + "댓글/게시글여부:" + rptRefCat + "참조번호" + rptBoardNo);
			           		
		           			$.ajax({
	                   			url:"reportStatus.ad",
	                   			data:{
	                   				rptNoStr:rptNo+"",
	                   				rptBoardNo:rptBoardNo,
	                   				rptRefCat:rptRefCat
	                   			},
	                   			success(result){
	                   				alert("처리되었습니다");
	                   				location.reload();
	                   			},
	                   			error(){
	                   				console.log("ajax통신 실패");
	                   			}
	                   		})
			           		 
			           	}
			           	
			          	
			           	
			        </script>
                    <br><br>
                </div>
                
	             <!-- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!리스트 화면 검색기능, 여러개 클릭기능 구현(하다말았음) -->
	            
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
				                        <a class="page-link" href="reportList.ad?cpage=${ pi.currentPage-1 }" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
			            	
			            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            		<li class="page-item"><a class="page-link" href="reportList.ad?cpage=${ p }">${ p }</a></li>
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
				                        <a class="page-link" href="list.no?cpage=${ pi.currentPage+1 }" aria-label="Next">
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