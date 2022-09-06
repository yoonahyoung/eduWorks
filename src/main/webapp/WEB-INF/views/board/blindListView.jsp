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

<title>익명 게시판 조회</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<!-- Begin Page Content -->
	<div>
	    <div class="row">
	        <!-- 게시판 영역 -->
	        <div class="col-10" id="col-10">
                <!-- Page Heading -->
                <div class="d-sm-flex align-items-center justify-content-between mb-4" id="boardHeader">
                    <h2 style="margin:25px 15px 25px 15px; color:black">익명게시판</h2>
                </div>
                <div class="filterHead">
                    <div class="searchbar">
                        <b id="searchB">검색</b>　
                        <input type="text" placeholder="텍스트 검색" style="height:25px;">
                        <i class="fas fa-search fa-fw"></i>
                    </div>
                    <div class="board-write-btn">
                        <button type="button" class="btn" id="bWrite-btn">글작성</button>
                    </div>
                </div>
                
                <div>
                    <table class="boardTable">
                        <tbody>
                            <tr>
                                <td id="fContent0">
                                    <p>
                                        <div class="side_side">
                                            <span id="boardTitle">좋은 아침입니다~^^</span>
                                            <div id="likeReply">
                                                <div id="reply">
                                                    &nbsp;&nbsp;<i class="fas fa-comments"></i><br>
                                                    <span>[0]</span>
                                                </div>
                                                <div id="like">
                                                    &nbsp;<i class="fas fa-heart"></i><br>
                                                    <span>0</span>
                                                </div>
                                            </div>
                                        </div> 
                                        <span id="w-day">작성일 </span><span>2022.08.14</span>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td id="fContent0">
                                    <p>
                                        <div class="side_side">
                                            <span id="boardTitle">좋은 아침입니다~^^</span>
                                            <div id="likeReply">
                                                <div id="reply">
                                                    &nbsp;&nbsp;<i class="fas fa-comments"></i><br>
                                                    <span>[0]</span>
                                                </div>
                                                <div id="like">
                                                    &nbsp;<i class="fas fa-heart"></i><br>
                                                    <span>0</span>
                                                </div>
                                            </div>
                                        </div> 
                                        <span id="w-day">작성일 </span><span>2022.08.14</span>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td id="fContent0">
                                    <p>
                                        <div class="side_side">
                                            <span id="boardTitle">좋은 아침입니다~^^</span>
                                            <div id="likeReply">
                                                <div id="reply">
                                                    &nbsp;&nbsp;<i class="fas fa-comments"></i><br>
                                                    <span>[0]</span>
                                                </div>
                                                <div id="like">
                                                    &nbsp;<i class="fas fa-heart"></i><br>
                                                    <span>0</span>
                                                </div>
                                            </div>
                                        </div> 
                                        <span id="w-day">작성일 </span><span>2022.08.14</span>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td id="fContent0">
                                    <p>
                                        <div class="side_side">
                                            <span id="boardTitle">좋은 아침입니다~^^</span>
                                            <div id="likeReply">
                                                <div id="reply">
                                                    &nbsp;&nbsp;<i class="fas fa-comments"></i><br>
                                                    <span>[0]</span>
                                                </div>
                                                <div id="like">
                                                    &nbsp;<i class="fas fa-heart"></i><br>
                                                    <span>0</span>
                                                </div>
                                            </div>
                                        </div> 
                                        <span id="w-day">작성일 </span><span>2022.08.14</span>
                                    </p>
                                </td>
                            </tr>
                        </tbody>
                    </table>
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

            <!-- 오른쪽 content -->
            <div class="col-2" id="col-2">
              <table class="bestTable">
                <thead>
                	<tr><td></td></tr>
                	<tr><td></td></tr>
                    <tr>
                        <th colspan="2">인기게시판</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><a href="">인기 게시글 1</a></td>
                        <td align="right">08-11</td>
                    </tr>
                    <tr>
                        <td><a href="">인기 게시글 1</a></td>
                        <td align="right">08-11</td>
                    </tr>
                    <tr>
                        <td><a href="">인기 게시글 1</a></td>
                        <td align="right">08-11</td>
                    </tr>
                    <tr>
                        <td><a href="">인기 게시글 1</a></td>
                        <td align="right">08-11</td>
                    </tr>
                    <tr>
                        <td><a href="">인기 게시글 1</a></td>
                        <td align="right">08-11</td>
                    </tr>
                </tbody>
              </table>
            </div>
	
	    </div>
	   
	</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>