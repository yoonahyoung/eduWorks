<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/board.css" rel="stylesheet" type="text/css">

<title>부서 게시판 조회</title>
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
	                <h2>부서 게시판</h2><!-- 로그인한 유저의 부서 넣기. -->
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
	                    <button id="delNotice">삭제</button><i class="fas fa-trash"></i>
	                </div>
	            </div>
	            
	            <div class="main_width">
	                <table class="board-content table" align="center">
	                    <thead>
	                        <tr class="table_thead_border">
	                            <th width="2%"><input type="checkbox"></th>
	                            <th width="5%">번호</th>
	                            <th width="30%">제목</th>
	                            <th width="7%">작성자</th>
	                            <th width="7%">작성일</th>
	                            <th width="5%">조회수</th>
	                        </tr>
	                    </thead>
	                    <tbody class="board-tbody">
	                        <!-- 값은 다 DB와 연결될 것 -->
	                        <!-- 공지는 배경색 변경 -->
	                        <tr style="background:rgb(250, 232, 232)">
	                            <td><input type="checkbox"></td>
	                            <td>5</td>
	                            <td>필독 공지 사항입니다.</td>
	                            <td>user01</td>
	                            <td>2021-09-22</td>
	                            <td>5</td>
	
	                        </tr>
	                        <tr>
	                            <td><input type="checkbox"></td>
	                            <td>5</td>
	                            <td>부서게시판 입니다!</td>
	                            <td>user01</td>
	                            <td>2021-09-22</td>
	                            <td>5</td>
	
	                        </tr>
	                    </tbody>
	                </table>
	                <br><br>
	                
	            </div>
	            
                <div class="board-write-btn" align="right">
                    <button type="button" class="btn" id="bWrite-btn" onclick="location.href='enrollForm.de'">글작성</button>
                </div>
	            <div id="n-pagingBar">
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
	
	    </div>
	   
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>