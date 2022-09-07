<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<!-- css -->
	<link href="${pageContext.request.contextPath}/resources/css/addressBook.css" rel="stylesheet" type="text/css">

<title>개인 주소록</title>
</head>
<body>

	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />

	             <!-- Begin Page Content -->
                <!--Begin of Main Content -->
                <div class="container-fluid" style="display:flex;">
                    <nav class="menu-sidebar">

                        <div class="insider">
                            <h2>주소록</h2>
                            <div class="address-btn">
                                <button type="button" class="writeForm btn-lg">주소록 추가</button>
                            </div>
                        </div>

                        <div class="insider">
                            <h4>공용 주소록</h4>
                            <a href=""><h6>전사 주소록</h6></a>
                        </div>

                        <div class="insider">
                            <h4>개인 주소록</h4>
                            <a href=""><h6>개인 주소록</h6></a>

                            <!--반복문 시작 -->
                            <div class="address-title">
                                <a href=""><h6>거래처</h6></a>

                                <!-- 주소록 클릭시 수정,삭제 처리하는 dropdown 생성-->
                                    <a class="tag-modify" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
                                    aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                    </a>
                                <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown" style="margin-left:-180px; margin-top: -10px;">
                                    <!-- 작성자에게만 보임 -->
                                    <a class="dropdown-item d-flex align-items-center" onclick="updateAddBook(/*해당 주소록 번호*/);">
                                        <span class="font-weight-bold">수정하기</span>
                                    </a>
                                    <a class="dropdown-item d-flex align-items-center" onclick="deleteAddBook();">
                                        <span class="font-weight-bold">삭제하기</span>
                                    </a>
                                </div>
                                
                            </div>

                            <!-- 주소록 그룹명 수정 처리하는 함수 -->
                            <div class="insider updateAddBook">
                                <div class="updateAddress">
                                    <span>
                                        <input type="text" name="" value="거래처">
                                    </span>
                                    <div class="update-addBtn">
                                        <a href=""><i class="fas fa-check"></i></a>
                                        <span onclick="dismissUpdateAdd();"><i class="fas fa-times"></i></span>`
                                    </div>
                                </div>
                            </div>
                            <!-- 반복문 끝 -->


                            <!-- 주소록 그룹 추가하는 함수 -->
                            <div class="insider insertAddBook">
                                <div class="insertAddress">
                                    <span>
                                        <input type="text" name="">
                                    </span>
                                    <div class="update-addBtn">
                                        <a href=""><i class="fas fa-check"></i></a>
                                        <span onclick="dismissInsertAdd();"><i class="fas fa-times"></i></span>`
                                    </div>
                                </div>
                            </div>
                            
                            <div id="plus-tag" onclick="insertAddBook();">+ 주소록 추가</div>
                        </div>

                        <script>

                            // 개인 주소록 수정 처리하는 함수
                            function updateAddBook(){
                                // 해당 주소록 번호만 들어간 요소 hide, show 이벤트 부여
                                $(".address-title").hide();
                                $(".updateAddBook").show();
                            }

                            // 개인 주소록 삭제 처리하는 함수
                            function deleteAddBook(){
                                confirm("주소록을 삭제하면 안에 있는 연락처 모두 삭제됩니다.\n주소록을 삭제하시겠습니까?");

                                // if(확인버튼 클릭){
                                //     주소록 삭제
                                // }
                            }

                            // 주소록 그룹명 수정 '취소'시 처리하는 함수
                            function dismissUpdateAdd(){
                                $(".updateAddBook").hide();
                                $(".address-title").show();
                            }

                            // 주소록 추가 클릭시 처리하는 함수
                            function insertAddBook(){
                                $(".insertAddBook").show();
                            }

                            // 주소록 추가 '취소'시 처리하는 함수
                            function dismissInsertAdd() {
                                $(".insertAddBook").hide();
                            }

                        </script>
                        
                        <div class="insider">
                            <h4>학생 주소록</h4>
                            <a href=""><h6>JAVA의 기초</h6></a>
                        </div>

                    </nav>
                    <!-- 게시판 영역 -->
                    <div class="main-content_indiv">
                        <!-- Page Heading -->
                        <div class="second-title">
                            <h2>개인 주소록</h2>
                        </div>
                        
                        <div>
                            <span class="mailListCheck"><input type="checkbox"></span>
                            <button type="button" class="reply-btn"><i class="fas fa-location-arrow"></i>&nbsp;&nbsp;메일 작성</button>
                            <button type="button" class="sub-btn" data-toggle="modal" data-target="#add-Address"><i class="fas fa-plus"></i>&nbsp;&nbsp;추가</button>
                            <button type="button" class="sub-btn" onclick="deleteAddress();"><i class="fas fa-trash-alt"></i>&nbsp;&nbsp;삭제</button>
                        </div>

                        <!-- <hr> -->

                        <!-- 
                        <div class="filterHead tableOption">
                            <div class="searchbar" align="center">
                                <input type="text" placeholder="검색">
                                <i class="fas fa-search fa-lg address-search"></i>
                            </div>
                        </div> -->

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

                        <div class="main-list key_main-list">
                            <table class="board-content table" align="center">
                                <thead>
                                    <tr class="table_thead_border">
                                        <th width="3%"><input type="checkbox"></th>
                                        <th width="5%">번호</th>
                                        <th width="10%">이름</th>
                                        <th width="10%">부서명</th>
                                        <th width="10%">직급명</th>
                                        <th width="15%">전화번호</th>
                                        <th width="15%">이메일</th>
                                        <th width="15%">메모</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- 값은 다 DB와 연결될 것 -->
                                    <!-- 반복문 시작 -->
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>1</td>
                                        <td data-toggle="modal" data-target="#update-Address">홍길동</td>
                                        <td>마케팅팀</td>
                                        <td>사원</td>
                                        <td>010-1234-5678</td>
                                        <td>user02@naver.com</td>
                                        <td>마케팅 신입</td>
                                    </tr>
                                    <!-- 반복문 끝 -->
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>2</td>
                                        <td data-toggle="modal" data-target="#update-Address">홍길동</td>
                                        <td>마케팅팀</td>
                                        <td>사원</td>
                                        <td>010-1234-5678</td>
                                        <td>user02@naver.com</td>
                                        <td>마케팅 신입</td>
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
                
                  <!-- 개인 주소록 연락처 추가(add-Address Model) 모달-->
    <div class="modal" id="add-Address">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content" style="height:600px">
      
            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title"><b>연락처 추가</b></h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
              <!-- 해당 버튼 클릭시 모달과 연결해제 -->
            </div>
      
            <!-- Modal body -->
        <form action="" method="post">

            <div class="modal-body" align="center">

            <input type="hidden" name="userId" value="${loginUser.userId }">

                <div class="insertAddress">

                    <table class="address-table">
                        <tr>
                            <th>그룹 선택</th>
                            <td>
                                <select name="" id="select-addressBook">
                                    <option value="" selected>개인주소록</option>
                                    <option value="">거래처</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <th>이름</th>
                            <td><input type="text" name=""></td>
                        </tr>
                        <tr>
                            <th>부서명</th>
                            <td><input type="text" name=""></td>
                        </tr>
                        <tr>
                            <th>직급명</th>
                            <td><input type="text" name=""></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name=""></td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><input type="text" name=""></td>
                        </tr>
                        <tr>
                            <th>메모</th>
                            <td><input type="text" name=""></td>
                        </tr>

                    </table>

                </div>
                              

                <div style="margin-top:10px;">
                    <button type="submit" class="addBtn" style="background-color:slategray; color:white; border:none;">추가</button>
                    <button type="button" data-dismiss="modal" class="addBtn" >취소</button>
                </div>

            </div>

        </form>

            </div>
        </div>
    </div>


        <!-- 개인 주소록 연락처 수정 및 삭제(update-Address Model) 모달-->
        <div class="modal" id="update-Address">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="height:600px">
        
                <!-- Modal Header -->
                <div class="modal-header">
                <h4 class="modal-title"><b>연락처 수정</b></h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <!-- 해당 버튼 클릭시 모달과 연결해제 -->
                </div>
        
                <!-- Modal body -->
                
                
            <form action="" method="post">

                <div class="modal-body" align="center">

                <input type="hidden" name="userId" value="${loginUser.userId }">

                    <div class="insertAddress">

                        <table class="address-table">
                            <tr>
                                <th>그룹 선택</th>
                                <td>
                                    <select name="">
                                        <option value="" selected>개인주소록</option>
                                        <option value="">거래처</option>
                                    </select>
                                </td>
                            </tr>

                            <tr>
                                <th>이름</th>
                                <td><input type="text" name="" value="홍길동"></td>
                            </tr>
                            <tr>
                                <th>부서명</th>
                                <td><input type="text" name="" value="마케팅"></td>
                            </tr>
                            <tr>
                                <th>직급명</th>
                                <td><input type="text" name="" value="사원"></td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td><input type="text" name="" value="010-1234-5678"></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><input type="text" name="" value="eduwork123@goodee.co.kr"></td>
                            </tr>
                            <tr>
                                <th>메모</th>
                                <td><input type="text" name="" value="마케팅 신입"></td>
                            </tr>

                        </table>

                    </div>
                                

                    <div style="margin-top:10px;">
                        <button type="submit" class="addBtn" style="background-color:lightgray; color:black; border:none;" onclick="deleteAddress();">삭제</button>
                        <button type="submit" class="addBtn" style="background-color:slategray; color:white; border:none;">수정</button>
                        <button type="button" data-dismiss="modal" class="class addBtn">취소</button>
                    </div>

                </div>
            </form>

                </div>
            </div>
        </div>

        <script>

            // 개인 연락처 삭제 처리하는 함수
            function deleteAddress(){
                confirm("연락처를 삭제하시겠습니까?");

                // if(확인버튼 클릭){
                //     주소록 삭제
                // }
            }

        </script>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>