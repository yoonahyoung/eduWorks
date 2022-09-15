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

	<jsp:include page="../common/header.jsp" />

	<div class="container-fluid" style="display: flex;">
        <nav class="menu-sidebar">
            <div class="insider">
                <h4>강의관리</h4>
                <a href="doneList.cl"><h6>강의목록</h6></a>
                <a href="appList.cl"><h6>신청강의</h6></a>
            </div>                        
        </nav>
        <!-- 게시판 영역 -->
        <div style="padding:0; width:85%;">
            <!-- Page Heading -->
            <div class="d-sm-flex align-items-center mb-4" id="boardHeader">
                <h2>신청 강의</h2>
            </div>

            <br>
            
            
            <div class="tableOption" style="display:flex; justify-content: space-between;">
                <div class="selectOption">
                    <select>
                        <option value="">최근순</option>
                        <option value="">오래된순</option>
                        <option value="">이름순</option>
                    </select>
                </div>
               
                <div class="filterHead">
                    <div class="searchbar">
                        <b>검색</b>　
                        <input type="text" placeholder="텍스트 검색" style="height:25px;">
                        <i class="fas fa-search fa-fw"></i>
                    </div>
                 <br>   
                </div>
                
            </div>
            
            <div class="main_width">
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
							<c:forEach var="l" items="${ list }">
					            <tr>
					                <td class="no">${ l.classNo }</td>
					                <td>${ l. classApproval }</td>
					                <td>${ l.classTitle }</td>
					                <td>${ l.memName }</td>
					                <td>${ l.classStartDate } / ${ l.classEndDate }</td>
					                <td>${ l.classSignupDate }</td>
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
						    <c:otherwise>
						    	<li class="page-item">
						            <a class="page-link" style="color:slategray" href="doneList.cl?cpage=${ pi.currentPage-1 }" aria-label="Previous">
						            <span aria-hidden="true">&laquo;</span>
						            </a>
						        </li>
						    </c:otherwise>
						</c:choose>
					        
				        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				        	<li class="page-item"><a class="page-link" style="color:slategray" href="doneList.cl?cpage=${ p }">${ p }</a></li>
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
						            <a class="page-link" style="color:slategray" href="doneList.cl?cpage=${ pi.currentPage+1 }" aria-label="Next">
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

        

	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>