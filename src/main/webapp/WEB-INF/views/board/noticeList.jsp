<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전사 공지 조회</title>

	<!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.css" rel="stylesheet">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/brands.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">


    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

    <!-- suit 글꼴 -->
    <link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/static/woff2/SUIT.css" rel="stylesheet">

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<!-- Begin Page Content -->
	<div class="container-fluid">
	    <div class="row">
	        <!-- 게시판 영역 -->
	        <div class="col-12" style="padding:0;">
	            <!-- Page Heading -->
	            <div class="d-sm-flex align-items-center mb-4" id="boardHeader">
	                <h2>전사 공지</h2>
	            </div>
	
	            <br>
	
	            <div class="tableOption" style="display:flex; justify-content: space-between;">
	                <div class="btn_two_spacing">
	                    <button id="importantNotice">공지등록</button><i class="fas fa-flag"></i>
	                    <button id="delNotice">삭제</button><i class="fas fa-trash"></i>
	                </div>
	                <div class="filterHead">
	                    <div class="searchbar">
	                        <b>검색</b>　
	                        <input type="text" placeholder="텍스트 검색" style="height:25px;">
	                        <i class="fas fa-search fa-fw"></i>
	                    </div>
	                </div>
	                <div class="board-write-btn">
	                    <button type="button" class="btn bWrite-btn">글작성</button>
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
	                            <td>상품 품질이 별로네요. 교환신청합니다.</td>
	                            <td>user01</td>
	                            <td>2021-09-22</td>
	                            <td>5</td>
	
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
	
	    </div>
	   
	</div>
	<!-- /.container-fluid -->

</body>
</html>