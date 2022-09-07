<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- css -->
	<link href="${pageContext.request.contextPath}/resources/css/addressBook.css" rel="stylesheet" type="text/css">
	
<title>공용 주소록</title>
</head>
<body>

	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />
	
	                <div class="container-fluid" style="display:flex;">

                    <!-- 게시판 영역 -->
                    <div class="main-content">
                        <!-- Page Heading -->
                        <div class="second-title">
                            <h2>전사 주소록</h2>
                        </div>
                        
                        <div>
                            <span class="mailListCheck"><input type="checkbox"></span>
                            <button type="button" class="reply-btn" onclick="writeMail();"><i class="fas fa-location-arrow"></i>&nbsp;&nbsp;메일 작성</button>
                        </div>
                        
                        <script>
                        
                        		function writeMail() {
                        			location.href="writeMailForm.ma";
                        		}
                        
                        </script>

                        <div class="tableOption">
                            <div class="searchbar" align="center">
                                <input type="text" placeholder="검색">
                                <i class="fas fa-search fa-lg address-search"></i>
                            </div>

                            <div class="selectOption" style="margin-bottom:10px">
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
                                        <th width="3%"><input type="checkbox"></th>
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
			                                        <td><input type="checkbox"></td>
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
                            <br><br>
                        </div>

                        <Script>

                            // 더블클릭시 해당 선택자에게 메일 보내는 함수 실행
                            $(function() {
                                $(".board-content>tbody>tr").dblclick(function() {
                                    location.href="sendMail.ma?mail=" + $(this).children().eq(5).text();
                                })
                            })

                        </Script>

                        <div style="margin:30px 0 30px 0">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                	<c:choose>
                                		<c:when test="${pi.currentPage eq 1 }">
			                                <li class="page-item">
			                                    <a class="page-link disabled" aria-label="Previous">
			                                    <span aria-hidden="true">&laquo;</span>
			                                    </a>
			                                </li>
		                                </c:when>
		                                <c:otherwise>
			                                <li class="page-item">
			                                    <a class="page-link" href="publicAddress.ad?cpage=${pi.currentPage -1 }" aria-label="Previous">
			                                    <span aria-hidden="true">&laquo;</span>
			                                    </a>
			                                </li>
		                                </c:otherwise>
		                            </c:choose>
		                                
				                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				                    	<li class="page-item"><a class="page-link" href="publicAddress.ad?cpage=${p }">${p }</a></li>
				                    </c:forEach>
										
									<c:choose>
										<c:when test="${pi.currentPage eq pi.maxPage }">
											<li class="page-item">
			                                    <a class="page-link disabled" aria-label="Next">
			                                    <span aria-hidden="true">&raquo;</span>
			                                    </a>
			                                </li>
										</c:when>
										<c:otherwise>
			                                <li class="page-item">
			                                    <a class="page-link" href="publicAddress.ad?cpage=${pi.currentPage + 1}" aria-label="Next">
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
                <!-- /.container-fluid -->
                
           <jsp:include page="../common/footer.jsp" />
</body>
</html>