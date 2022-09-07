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
                                        <th width="7%">번호</th>
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
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td>홍길동</td>
                                        <td>마케팅팀</td>
                                        <td>사원</td>
                                        <td>053-1111-2222</td>
                                        <td>user02@naver.com</td>
                                        <td>010-1234-5678</td>
                                    </tr>
                                    <!-- 반복문 끝 -->
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2</td>
                                        <td>홍길동</td>
                                        <td>마케팅팀</td>
                                        <td>사원</td>
                                        <td>053-1111-2222</td>
                                        <td>user02@naver.com</td>
                                        <td>010-1234-5678</td>
                                    </tr>
    
                                </tbody>
                            </table>
                            <br><br>
                        </div>

                        <Script>

                            // 더블클릭시 해당 선택자에게 메일 보내는 함수 실행
                            $(function() {
                                $(".board-content>tbody>tr").dblclick(function() {
                                    location.href="sendMail.ma?mail=" + $(this).children().eq(6).text();
                                })
                            })

                        </Script>

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
                <!-- /.container-fluid -->
                
           <jsp:include page="../common/footer.jsp" />
</body>
</html>