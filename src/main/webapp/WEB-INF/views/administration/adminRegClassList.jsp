<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/administration.css" rel="stylesheet" type="text/css">

<title>수강 신청 관리</title>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>

	    <div class="row">
	    	<!-- 왼쪽 메뉴바 -->
            <div class="col-2" id="col-2">
              	<nav class="menu-sidebar">
	                <h2>학생관리</h2>
	                <div class="insider">
	                    <h4>수강신청 관리</h4>
	                    <a href="list.rc"><h6>대기목록</h6></a>
	                    <a href="list.rc?regStatus=2"><h6>승인목록</h6></a>
	                    <a href="list.rc?regStatus=3"><h6>반려목록</h6></a>
	                </div>
	            </nav>
            </div>
	        <!-- 게시판 영역 -->
	        <div class="col-10" id="col-10">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4" id="boardHeader">
                    <h2 style="margin:25px 15px 25px 15px;">수강 신청 
	                    <c:if test="${ regStatus eq 1 }">
	                    	대기
	                    </c:if>
	                    <c:if test="${ regStatus eq 2 }">
	                    	승인
	                    </c:if>
	                    <c:if test="${ regStatus eq 3 }">
	                    	반려
	                    </c:if>
                    목록</h2>
                </div>
                
                <br><br>
                
                <div>
                    <table class="boardTable">
                        <tbody>
                        	<c:forEach var="r" items="${ list }">
                            <tr>
                                <td class="fContent${ r.regNo }">
                                    <p>
                                        <div class="side_side">
                                            <div class="reg-data-form">
                                                <table class="reg-data">
                                                    <tr>
                                                        <th>신청 강의 : </th>
                                                        <td>${ r.classTitle }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>신청 날짜 : </th>
                                                        <td>${ r.regDate }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>담당 강사 : </th>
                                                        <td>${ r.memName }</td>
                                                    </tr>
                                                    <tr>
                                                        <th>신 청 자 : </th>
                                                        <td> 관리번호 ${ r.studentNo} | ${ r.studentName }</td>
                                                    </tr>
                                                    <c:if test="${ not empty r.regReturn }">
                                                    	<tr>
                                                            <th>반려 사유 : </th>
                                                            <td>${ r.regReturn }</td>
                                                        </tr>
                                                    </c:if>
                                                </table>
                                            </div>
                                            <div id="reg-btn">
	                                            <c:if test="${ regStatus eq 1 }">
	                                                <button class="n-btn bWrite-btn" type="button" onclick="signUp(${ r.regNo });">승인</button>
	                                                <button class="n-btn noBtn" type="button" onclick="regReturn(${ r.regNo });" data-toggle="modal" data-target="#returnModal">반려</button>
	                                            </c:if>
                                            </div>
                                        </div> 
                                    </p>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <!-- 반려 사유 모달창 -->
                <div class="modal" id="returnModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alertB">
                            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
                                <div>
                                    <h5 class="mt-1 mb-2">반려 사유 입력</h5><br>
                                    <div id="radioDiv">
	                                    <input type="text" id="regReturn" name="regReturn"><br>
                                    </div>
                                    <div class="text-center mt-4" style="margin-top: 1.5rem;"> 
                                        <button type="button" id="realReturn" class="n-btn su_btn_all su_btn_medium">반려</button>
                                        <button type="button" id="next" class="n-btn su_btn_border su_btn_medium" data-dismiss="modal">취소</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
			    
			    <!-- 알람용 모달창 -->
                <div class="modal" id="moContent" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered cascading-modal modal-avatar" role="document">
                        <!--Content-->
                        <div class="modal-content modal_alert">
                            
                            <!--Body-->
                            <div class="modal-body text-center modal_alert_child">
                                <div id="req-modal">
                
                                    <h5 class="mt-1 mb-2 req-msg" id="modalContent" style="margin-top: 1.5rem !important;"></h5>
                                    <br>                                
                                    <div class="text-center mt-4" > 
                                        <button type="button" class="n-btn su_btn_all su_btn_medium" data-dismiss="modal" id="resultUrl" onclick="location.reload();">확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div id="n-pagingBar" style="margin: 30px 0 30px 0">
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
				                        <a class="page-link" href="list.rc?cpage=${ pi.currentPage-1 }&regStatus=${regStatus}" aria-label="Previous">
				                        	<span aria-hidden="true">&laquo;</span>
				                        </a>
				                    </li>
			                    </c:otherwise>
			            	</c:choose>
			            	
			            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
			            		<li class="page-item"><a class="page-link" href="list.rc?cpage=${ p }&regStatus=${regStatus}">${ p }</a></li>
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
				                        <a class="page-link" href="list.rc?cpage=${ pi.currentPage+1 }&regStatus=${regStatus}" aria-label="Next">
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
		function signUp(regNo){ // 승인 update
			 $.ajax({
				url:"update.rc",
				data:{regNo:regNo},
				success(result){
					$("#modalContent").html("승인 처리 완료!");
        			$("#moContent").modal("show");
				},error(){
					console.log("ajax통신 실패");
				}
			}) 
		}
		
		function regReturn(regNo){
			$("#returnModal").on("click", "#realReturn", function(){ // 반려 update
				$.ajax({
					url:"return.rc",
					data:{
						regNo:regNo,
						regReturn:$("#regReturn").val()
					},
					success(result){
						alert("반려처리 되었습니다!");
						location.reload();
					},error(){
						console.log("ajax통신 실패");
					}
				})
			})
		}
	</script>
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>