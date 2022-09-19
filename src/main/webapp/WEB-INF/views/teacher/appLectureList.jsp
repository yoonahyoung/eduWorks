<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/lecture.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
		<div class="col-12" style="padding:0; width: 100%;">
			<!-- Page Heading -->
			<div class="d-sm-flex align-items-center mb-4" id="boardHeader">
			    <h2 style="color:black">강의 목록</h2>
			</div>
			
			<br>
			
			
			<div class="tableOption" style="display:flex; justify-content: space-between;">
			    <div class="btn_two_spacing">
			        <button id="submit">등록</button>
			    </div>
			    
			    <script>
			    	$(function(){
			    		$("#submit").click(function(){
			    			location.href = 'appEnroll.cl';
			    		})
			    	})
			    </script>
			   
			    <div class="filterHead">
			        <form action="appSearchForm.cl">
	                    <div class="searchbar">
	                        <b>검색</b>　
	                   
	                        <select class="selectOption" name="condition">
		                        <option value="classTitle">과정명</option>
		                        <option value="memName">강사명</option>
		                    </select>
	                        <input type="text" name="keyword" value="${ keyword }" placeholder="텍스트 검색" style="height:25px;">
	                        <button type="submit" style="border:none; background-color:white"><i class="fas fa-search fa-fw"></i></button>
	                    </div>
	                </form>
			     <br>   
			    </div>
			</div>
			
			 <c:if test="${ not empty condition }">
				<script>
					$(function(){
						$("option[value=${condition}]").attr("selected", true);
					})
				</script>
			</c:if>
			
			<div class="main_width" style="width: 100%;">
			    <table class="board-content table" align="center">
			        <thead>
			            <tr class="table_thead_border">
			                <th width="5%">번호</th>
			                <th width="5%">상태</th>
			                <th width="23%">과정명</th>
			                <th width="7%">강사명</th>
			                <th width="15%">과정기간</th>
			                <th width="7%">신청일</th>
			            </tr>
			        </thead>
			        
			        <tbody class="board-tbody">
						<c:choose>
							<c:when test="${ empty list }">
								<tr>
									<td colspan="6">현재 강의가 없습니다.</td>
								</tr>
							</c:when>
						
						<c:otherwise>
							<c:forEach var="t" items="${ list }">
					            <tr>
					                <td class="no">${ t.classNo }</td>
					                <c:choose>
						                <c:when test="${ t.classApproval eq 1 }">
						               		<td>대기중</td>
						                </c:when>
						                <c:when test="${ t.classApproval eq 2 }">
						             		<td>승인</td>
						                </c:when>
						                <c:otherwise>
						                	<td>반려</td>
						                </c:otherwise>
					                </c:choose>
					                <td>${ t.classTitle }</td>
					                <td>${ t.memName }</td>
					                <td>${ t.classStartDate } / ${ t.classEndDate }</td>
					                <td>${ t.classSignupDate }</td>
					            </tr>
					        </c:forEach>
					     </c:otherwise>
				     </c:choose>
			        </tbody>
			    </table>
			    
			    <br><br>
			    
			    
			    
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
						    <c:when test="${ not empty condition }">
						    	<li class="page-item">
						            <a class="page-link" style="color:slategray" href="appAllList.cl?cpage=${ pi.currentPage-1 }&condition=${condition}&keyword=${keyword}" aria-label="Previous">
						            <span aria-hidden="true">&laquo;</span>
						            </a>
						        </li>
						    </c:when>
						    <c:otherwise>
						    	<li class="page-item">
						            <a class="page-link" style="color:slategray" href="appAllList.cl?cpage=${ pi.currentPage-1 }" aria-label="Previous">
						            <span aria-hidden="true">&laquo;</span>
						            </a>
						        </li>
						    </c:otherwise>
						</c:choose>
					        
					        
					        
				        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					        <c:choose>
							     <c:when test="${ not empty condition }">
							        	<li class="page-item"><a class="page-link" style="color:slategray" href="appSearchForm.cl?cpage=${ p }&condition=${condition}&keyword=${keyword}">${ p }</a></li>
							    </c:when>
							    <c:otherwise>
							        	<li class="page-item"><a class="page-link" style="color:slategray" href="appAllList.cl?cpage=${ p }">${ p }</a></li>
							        
							    </c:otherwise>
							</c:choose> 
					    </c:forEach>    
					        
					        
					    <c:choose>
			        		<c:when test="${ pi.currentPage eq pi.maxPage }">
					        	<li class="page-item disabled">
						            <a class="page-link disabled" style="color:lightgray" aria-label="Next">
						            <span aria-hidden="true">&raquo;</span>
						            </a>
						        </li>
						    </c:when>
						     <c:when test="${ not empty condition }">
						    	<li class="page-item">
						            <a class="page-link" style="color:slategray" href="appAllList.cl?cpage=${ pi.currentPage+1 }&condition=${condition}&keyword=${keyword}" aria-label="Next">
						            <span aria-hidden="true">&raquo;</span>
						            </a>
						        </li>
						    </c:when>
						    <c:otherwise>
						    	<li class="page-item">
						            <a class="page-link" style="color:slategray" href="appAllList.cl?cpage=${ pi.currentPage+1 }" aria-label="Next">
						            <span aria-hidden="true">&raquo;</span>
						            </a>
						        </li>
						    </c:otherwise>
						</c:choose> 
                    </ul>
                </nav>
            </div>
                
		</div>

	
	
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>