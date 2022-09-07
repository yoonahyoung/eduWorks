<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />
	
	<!-- 공통요소 모달 -->
	<jsp:include page="commonMailModal.jsp" />
	
	 <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- 사이드바 메뉴 -->
                    <nav class="menu-sidebar">
                        <div class="insider">
                            <h2>메일</h2>
                            <div class="mailForm-btn">
                                <button type="button" class="writeForm btn-lg">메일 작성</button>
                                <button type="button" class="writeForm btn-lg">나에게 작성</button>
                            </div>
                        </div>
                        
                        <div class="insider">
                            <h4>태그</h4>
                             <!-- 태그 추가시 생성 -->

                             <!-- 반복문 사용 -->
                             <div class="tag-title">
                                <a href=""><h6><i class="fas fa-bookmark" style="color:red;"></i>&nbsp;&nbsp;중요자료</h6> </a>
                                    <a class="tag-modify" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                    aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
                                    <!-- 작성자에게만 보임 -->
                                    <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#updateTags">
                                        <span class="font-weight-bold">수정하기</span>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" onclick="deleteTags();">
                                        <span class="font-weight-bold">삭제하기</span>
                                    </a>
                                </div>
                            </div>
                            
                             <!-- 반복문 사용 -->
                             <div class="tag-title">
                                <a href=""><h6><i class="fas fa-bookmark" style="color:gold;"></i>&nbsp;&nbsp;회의자료</h6> </a>
                                    <a class="tag-modify" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                    aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
                                    <!-- 작성자에게만 보임 -->
                                    <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#updateTags">
                                        <span class="font-weight-bold">수정하기</span>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" onclick="deleteTags();">
                                        <span class="font-weight-bold">삭제하기</span>
                                    </a>
                                </div>
                            </div>
                            
                            <div id="plus-tag" data-toggle="modal" data-target="#addTags">+ 태그추가</div>
                        </div>

                        <div class="insider">
                            <h4>메일함</h4>
                            <a href=""><h6>보낸메일</h6></a>
                            <a href=""><h6>받은메일</h6></a>
                            <a href=""><h6>내게쓴메일</h6></a>
                            <a href=""><h6>임시보관함</h6></a>
                            <a href=""><h6 style="display:inline-block;">휴지통</h6></a>
                            <button type="button" id="empty" onclick="emptyMail();">비우기</button>
                        </div>
                        
                        <div class="insider">
                            <h4>빠른 검색</h4>
                            <a href=""><h6>중요메일함</h6></a>
                            <a href=""><h6>읽은메일함</h6></a>
                            <a href=""><h6>안읽은메일함</h6></a>
                            <a href=""><h6>스팸메일함</h6></a>
                        </div> 
                        
                        <div class="insider">
                            <a class="setup"><i class="fas fa-cog" style="color:gray; margin-right:10px"></i>메일 환경설정</a> 
                        </div>
                    </nav>

                                        
                    <script>

                        // '태그 삭제'클릭시 실행하는 함수
                        function deleteTags(){
                            confirm("태그를 삭제하시겠습니까?");
                        }

                        // '비우기' 클릭시 실행하는 함수
                        function emptyMail(){
                            confirm("휴지통을 비우시면 지워진 메일(중요메일 포함)들은 복구할 수 없습니다.\n\n휴지통을 비우시겠습니까?");
                        }

                    </script>
                     

                    <!-- 메인 콘텐츠 영역 -->
                    <div class="main-content">
                        <div class="second-title">
                            <div>
                                <div>중요 메일함
                                    <span class="mail-count">전체메일 102 / 안읽은 메일 22</span>
                                </div>
                            </div>

                            <ul class="navbar-nav ml-auto moDelte">
                                <li class="nav-item dropdown no-arrow">
                                    <span class="mailListCheck"><input type="checkbox"></span>
                                    <button type="button" class="sub-btn"><i class="fas fa-trash-alt"></i>&nbsp;&nbsp;삭제</button>
                                    <button class="nav-link dropdown-toggle sub-btn tag-btn" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                        aria-expanded="false">
                                        <i class="fas fa-bookmark"></i>&nbsp;&nbsp;태그
                                    </button>
                                    <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-top: -10px;">

                                         <!-- 태그없으면 안보임  -->
                                        <a class="dropdown-item d-flex align-items-center" href="#">
                                            <span class="font-weight-bold">태그색성 + 태그명</span>
                                        </a>
                                        <a class="dropdown-item d-flex align-items-center" href="#" data-toggle="modal" data-target="#delete">
                                            <span class="font-weight-bold">태그색성 + 태그명</span>
                                        </a>

                                        <!-- 태그 생성유무 상관없이 보임-->
                                        <a class="dropdown-item d-flex align-items-center" data-toggle="modal" data-target="#addTags" href="#">
                                           <span class="font-weight-bold">+ 태그 추가</span>
                                        </a>
                                                                                
                                        
                                    </div>
                                </li>
                            </ul>

                            <!-- <span class="mailListCheck"><input type="checkbox"></span>
                            <button type="button" class="mailBtn">삭제</button>
                            <button type="button" class="dropdown mailBtn">태그</button>
                            <a class="nav-link dropdown-toggle mailBtn" href="#" id="searchDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">태그</a> 
                            <button type="button" class="mailBtn">읽음</button> -->
                        </div>
                        <hr style="margin:20px 0px 10px 0px;">
                        <div class="mail-list">


                            <table class="mail">
                                <!-- 반복문 사용 시작 -->
                                <tr>
                                    <td><input type="checkbox" class="mail-select"></td>
                                    <td>
                                        <!-- 중요메일함에는 찜하기된 상태의 이미지만 표시 -->
                                        <i class="icon fas fa-star" style="color:gold;"></i>
                                    </td> 
                                    <td>
                                        <!-- 안읽은 메일 -->
                                        <i class="icon fas fa-envelope"></i>
                                        <!-- 읽은 메일 -->
                                        <!-- <i class="icon far fa-envelope-open"></i> -->
                                    </td>
                                    <td>
                                        <!-- 첨부파일 있는 경우 생성 
                                        <i class="icon fas fa-paperclip"></i>
                                        -->
                                    </td>                   
                                    <td class="mail-person" width="15%"><div class="person">이나라</div></td>
                                    <td class="mail-title">[결재완료] '사전 마케팅을 위한 카페 제휴&운영 건'이(가) 결재가 완료되었습니다.</td>
                                    <td class="mail-sendtime">2022-08-10 10:23:22</td>
                                </tr>
                                <!-- 반복문 끝 -->
                                <tr>
                                    <td><input type="checkbox" class="mail-select"></td>
                                    <td>
                                        <!-- 중요메일함에는 찜하기된 상태의 이미지만 표시 -->
                                        <i class="icon fas fa-star" style="color:gold;"></i>
                                    </td> 
                                    <td>
                                        <!-- 안읽은 메일 -->
                                        <!-- <i class="icon fas fa-envelope"></i> -->
                                        <!-- 읽은 메일 -->
                                        <i class="icon far fa-envelope-open"></i>
                                    </td>
                                    <td>
                                        <!-- 첨부파일 있는 경우 생성 
                                        <i class="icon fas fa-paperclip"></i>
                                        -->
                                    </td>               
                                    <td class="mail-person" width="15%"><div class="person">김민수</div></td>
                                    <td class="mail-title">[결재완료] '사전 마케팅을 위한 카페 제휴&운영 건'이(가) 결재가 완료되었습니다.</td>
                                    <td class="mail-sendtime">2022-08-10 10:23:22</td>
                                </tr>
                                <tr>
                                    <td><input type="checkbox" class="mail-select"></td>
                                    <td>
                                        <!-- 중요메일함에는 찜하기된 상태의 이미지만 표시 -->
                                        <i class="icon fas fa-star" style="color:gold;"></i>
                                    </td> 
                                    <td>
                                        <!-- 안읽은 메일 -->
                                        <!-- <i class="icon fas fa-envelope"></i> -->
                                        <!-- 읽은 메일 -->
                                        <i class="icon far fa-envelope-open"></i>
                                    </td>
                                    <td>
                                        <!-- 첨부파일 있는 경우 생성 -->
                                        <i class="icon fas fa-paperclip"></i>
                                        
                                    </td>                  
                                    <td class="mail-person" width="15%"><div class="person">홍재희</div></td>
                                    <td class="mail-title">[결재완료] '사전 마케팅을 위한 카페 제휴&운영 건'이(가) 결재가 완료되었습니다.</td>
                                    <td class="mail-sendtime">2022-08-10 10:23:22</td>
                                </tr>

                            </table>

                        </div>

                        <!-- 페이지 바 -->
                        <div class="page-nav" style="margin:30px 0 30px 0">
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