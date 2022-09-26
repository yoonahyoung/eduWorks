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
	                    <select id="rCount" onchange="goCategory(1);">
	                        <option value="desc" selected>신고많은순</option>
	                        <option value="asc">신고적은순</option> 
	                    </select>
	                    <select id="rStatus" onchange="goCategory(1);">
	                    	<option value="" selected>전체</option>
	                        <option value="N">미처리</option>
	                        <option value="Y">처리</option> 
	                    </select>
	                </div>
	            </div>
                            
                <div class="main_width">
                    <table class="board-content table" id="reportList" align="center">
                        <thead>
                            <tr class="table_thead_border">
                                <th width="5%">번호</th>
                                <th width="5%">분류</th>
                                <th width="15%">제목/내용</th>
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
				                            <td>
					                            <c:if test="${ r.rptRefCat eq 1 }">
					                            	게시글
					                            	<input type="hidden" value="1" class="rptRefCat">
					                            </c:if>
					                            <c:if test="${ r.rptRefCat eq 2 }">
					                            	댓글
					                            	<input type="hidden" value="2" class="rptRefCat">
					                            </c:if>
				                            </td>
				                            <td>${ r.boardTitle }</td>
				                            <td>${ r.rptCount }</td>
				                            <td>${ r.rptStatus }</td>
				                            <td onclick="event.stopPropagation()">
				                            	<c:if test="${ r.rptStatus eq 'N' }">
				                            		<button type="button" class="n-btn su_btn_border btn-sm reportStatus" onclick='goStatus("${r.rptNo}", "${ r.rptRefCat }", "${ r.rptBoardNo }");'>처리완료</button>
				                            	</c:if>
				                            </td>
				                            <td class="no${ status.count }"><input type="hidden" class="rptNoStr" value="${ r.rptNo }"></td>
				                        </tr>
				                    </c:forEach>
			                    </c:otherwise>
	                        </c:choose>
                        </tbody>
                    </table>
                    <script>
			           	 // 상세화면
		           		let rptBoardNo = "";
		           		let rptRefCat = "";
		           		let rptNoStr = "";
		           		$(document).on("click", "#reportList>tbody>tr", function(){
		           			rptBoardNo = $(this).children(".no").text();
		           			rptRefCat = $(this).find(".rptRefCat").val();
		           			console.log(rptRefCat);
		           			rptNoStr = $(this).find(".rptNoStr").val() + "";
		           			console.log(rptNoStr);
	           				// 선택된 tr의 자식요소 중에서 no라는 클래스를 가진 자식의 text값
	           				location.href = "reportDetail.bl?no=" + rptBoardNo + "&rptRefCat=" + rptRefCat + "&rptNoStr=" + rptNoStr; 
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
			           	
			           	function goCategory(page){
			           		// 분류 값에 따른 리스트 ajax로 뿌려주기
			           		$.ajax({
			           			url:"option.re",
			           			data:{
			           				rCount:$("#rCount").val(),
					           		rStatus:$("#rStatus").val(),
					           		page:page
			           			},
			           			success(map){
			           				let list = map.list;
			           				let pi = map.pi;
			           				value = "";
			           				pValue ="";
			           				if(list == null){
			           					value += '<tr>'
			           								+ '<td colspan="6">등록된 신고가 없습니다.</td>'
		           							  + '</tr>';
			           				}else{
			           					for(let i=0; i<list.length; i++){
			           						value += '<tr>'
			           									+ '<td class="no">' + list[i].rptBoardNo + '</td>';
				                            if(list[i].rptRefCat == 1){
				                            	value += '<td class="rptRefCat">게시글<input type="hidden" value="1" class="rptRefCat"></td>'
				                            }else{
				                            	value += '<td class="rptRefCat">댓글<input type="hidden" value="2" class="rptRefCat"></td>'
				                            }
						                         value += '<td>' + list[i].boardTitle + '</td>'
			           									+ '<td>' + list[i].rptCount + '</td>'
			           									+ '<td>' + list[i].rptStatus + '</td>'
			           									+ '<td onclick="event.stopPropagation()">';
			           									if(list[i].rptStatus == 'N'){
			           										value += '<button type="button" class="n-btn su_btn_border btn-sm reportStatus" onclick="goStatus(&quot;' + list[i].rptNo + '&quot;, &quot;' + list[i].rptRefCat + '&quot;, &quot;' + list[i].rptBoardNo + '&quot;);">처리완료</button>';
			           									}
	           									value += '</td>';
	           												+ '<td class="no' + i + '"><input type="hidden" class="rptNoStr" value="' + list[i].rptNo + '"></td>';
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
			           					console.log((".rptNoStr").val());
			           					$(".board-tbody").empty();
			           					$(".board-tbody").html(value);
			           					$("#n-pagingBar ul").empty();
			           					$("#n-pagingBar ul").html(pValue);
			           				}
			           				
				                            
			           			},error(){
			           				console.log("ajax통신 실패");
			           			}
			           		})
			           	}
			           	
			        </script>
                    <br><br>
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
				                        <a class="page-link"  onclick="goCategory(${ pi.currentPage-1 })" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
			            	
			            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            		<li class="page-item"><a class="page-link"  onclick="goCategory(${ p })">${ p }</a></li>
			            	</c:forEach>
			            	
			            	<c:choose>
	                    		<c:when test="${ pi.currentPage eq pi.maxPage }">
	                    			<li class="page-item">
				                        <a class="page-link disabled" aria-label="Next">
				                        	<span aria-hidden="true">&raquo;</span>
				                        </a>
			                    	</li>
	                    		</c:when>
	                    		<c:otherwise>
				                    <li class="page-item">
				                        <a class="page-link"  onclick="goCategory(${ pi.currentPage+1 })" aria-label="Next">
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