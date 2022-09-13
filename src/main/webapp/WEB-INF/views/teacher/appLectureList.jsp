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
			    			location.href = 'appEnrollForm.cl';
			    		})
			    	})
			    </script>
			   
			    <div class="filterHead">
			        <div class="searchbar">
			            <b>검색</b>　
			            <input type="text" placeholder="텍스트 검색" style="height:25px;">
			            <i class="fas fa-search fa-fw"></i>
			        </div>
			     <br>   
			    </div>
			    
			</div>
			
			<div class="main_width" style="width: 100%;">
			    <table class="board-content table" align="center">
			        <thead>
			            <tr class="table_thead_border">
			                <th width="5%">번호</th>
			                <th width="5%">상태</th>
			                <th width="23%">과정명</th>
			                <th width="7%">강사명</th>
			                <th width="7%">과정기간</th>
			                <th width="7%">신청일</th>
			            </tr>
			        </thead>
			        <tbody class="board-tbody">
			            <!-- 값은 다 DB와 연결될 것 -->
			            <!-- 공지는 배경색 변경 -->
			            <tr>
			                <td>2</td>
			                <td>대기중</td>
			                <td>JAVA의 이해</td>
			                <td>삽자루</td>
			                <td>2021-09-22 / 2022-03-21</td>
			                <td>2021-08-20</td>
			
			            </tr>
			            <tr>
			                <td>1</td>
			                <td>승인</td>
			                <td>파이썬 심화과정</td>
			                <td>임요환</td>
			                <td>2021-09-22 / 2022-03-21</td>
			                <td>2021-07-30</td>
			
			            </tr>
			        </tbody>
			    </table>
			    
			    <br><br>
			    
			    
			    
			</div>
			
			<div style="margin:30px 0 30px 0">
			    <nav aria-label="Page navigation example">
			        <ul class="pagination justify-content-center">
			        <li class="page-item">
			            <a class="page-link" href="#" aria-label="Previous">
			            <span aria-hidden="true">&laquo;</span>
			            </a>
			        </li>
			        <li class="page-item"><a class="page-link" href="#">1</a></li>
			        <li class="page-item"><a class="page-link" href="#">2</a></li>
			        <li class="page-item"><a class="page-link" href="#">3</a></li>
			        <li class="page-item">
			            <a class="page-link" href="#" aria-label="Next">
			            <span aria-hidden="true">&raquo;</span>
			            </a>
			        </li>
			        </ul>
			    </nav>
			</div>
                
		</div>

	
	
	
	
	
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>