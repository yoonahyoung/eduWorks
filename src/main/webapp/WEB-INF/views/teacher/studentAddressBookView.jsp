<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강사 학생 주소록</title>

<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/addressBook.css" rel="stylesheet" type="text/css">

</head>
<body>
	<jsp:include page="../common/header.jsp" />
	
	<!-- Begin Page Content -->
    <!--Begin of Main Content -->
    <div>
        
        <!-- 게시판 영역 -->
        <div class="main-content">
            <!-- Page Heading -->
            <div class="second-title">
                <h2>학생 주소록</h2>
            </div>

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
                            <th width="5%">번호</th>
                            <th width="10%">이름</th>
                            <th width="10%">아이디</th>
                            <th width="15%">연락처</th>
                            <th width="20%">신청강의</th>
                            <th width="15%">이메일</th>
                            <th width="10%">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 값은 다 DB와 연결될 것 -->
                        <tr>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>user02</td>
                            <td>010-1111-2222</td>
                            <td>JAVA의 기초</td>
                            <td>user02@naver.com</td>
                            <td>2021-09-22</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>홍길동</td>
                            <td>user02</td>
                            <td>010-1111-2222</td>
                            <td>JAVA의 기초</td>
                            <td>user02@naver.com</td>
                            <td>2021-09-22</td>
                        </tr>

                    </tbody>
                </table>
                <br><br>
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
    <!-- /.container-fluid -->
    
    <jsp:include page="../common/footer.jsp" />
</body>
</html>