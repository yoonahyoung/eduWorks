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
	<div class="container-fluid" style="display: flex;">
		<nav class="menu-sidebar">

			<div class="insider">
				<h2>주소록</h2>
				<div class="address-btn">
					<button type="button" class="writeForm btn-lg" data-toggle="modal"
						data-target="#add-Address">연락처 추가</button>
				</div>
			</div>

			<div class="insider">
				<h4>주소록 목록</h4>
				<a onclick="postFormSubmit('individualAddress.ad')"><h6>개인 주소록</h6></a>
	
				<!--반복문 시작 -->
				<c:choose>
					<c:when test="${not empty category}">
						<c:forEach var="c" items="${category}">
							<c:if test="${c.addName != '개인주소록'}">
								<div class="address-title">
									<a onclick="postSubmit('indivAddressBook.ad', '${c.addNo}')" class="category-title"><h6>${c.addName }</h6></a>
									<!-- 주소록 클릭시 수정,삭제 처리하는 dropdown 생성-->
									<a class="tag-modify" href="#" id="dotDropdown" role="button"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
									</a>
									<div class="dropdown-list dropdown-menu shadow"
										aria-labelledby="dotDropdown"
										style="margin-left: -180px; margin-top: -10px;">
										<!-- 작성자에게만 보임 -->
										<a class="dropdown-item d-flex align-items-center"
											onclick="updateAddBook(/*해당 주소록 번호*/);"> <span
											class="font-weight-bold">수정하기</span>
										</a> <a class="dropdown-item d-flex align-items-center"
											onclick="deleteAddBook();"> <span
											class="font-weight-bold">삭제하기</span>
										</a>
									</div>

								</div>
								
						<form id="post" action="" method="post">
			            	
			            	<input type="hidden" name="memNo" value="${loginUserN.memNo }">
			            	<input type="hidden" name="addNo" id="addNo">
			            
			            </form>

								<!-- 주소록 그룹명 수정 처리하는 함수 -->
								<div class="insider updateAddBook">
									<div class="updateAddress">
										<span> <input type="text" name="" value="거래처">
										</span>
										<div class="update-addBtn">
											<a href=""><i class="fas fa-check"></i></a> <span
												onclick="dismissUpdateAdd();"><i class="fas fa-times"></i></span>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>
						<!-- 반복문 끝 -->
					</c:when>
				</c:choose>

				<!-- 주소록 그룹 추가하는 함수 -->
				<div class="insider insertAddBook">
					<div class="insertAddress">
						<span> <input type="text" name="addName" id="addName"> </span>
						
						<div class="update-addBtn">
							<a id="insertAddIndiv"><i class="fas fa-check"></i></a>
							<a onclick="dismissInsertAdd();"><i class="fas fa-times"></i></a>
						</div>
					</div>
				</div>

				<div id="plus-tag" onclick="insertAddBook();">+ 주소록 추가</div>
			</div>


			<script>

				// 해당 주소록 이동 처리하는 함수	
				function postSubmit(url, addNo) {
					$("#post").children("#addNo").val(addNo); // hidden값에 반복되는 addNo요소 중 클릭된 요소만 value값에 넣기
					$("#post").attr("action", url).submit();
				}

				// 개인 주소록 수정 처리하는 함수
				function updateAddBook() {
					// 해당 주소록 번호만 들어간 요소 hide, show 이벤트 부여
					$(".address-title").hide();
					$(".updateAddBook").show();
				}

				// 개인 주소록 삭제 처리하는 함수
				function deleteAddBook() {
					confirm("주소록을 삭제하면 안에 있는 연락처 모두 삭제됩니다.\n주소록을 삭제하시겠습니까?");

					// if(확인버튼 클릭){
					//     주소록 삭제
					// }
				}

				// 주소록 그룹명 수정 '취소'시 처리하는 함수
				function dismissUpdateAdd() {
					$(".updateAddBook").hide();
					$(".address-title").show();
				}

				// 주소록 추가 클릭시 처리하는 함수
				function insertAddBook() {

					// 추가하는 구문 보이도록 처리
					$(".insertAddBook").show();

					// 주소록 그룹 '추가'시 실행하는 ajax함수
					$("#insertAddIndiv").click(function() {

						if ($("#addName").val().trim() != 0) {

							$.ajax({
								url : "insertAddIndiv.ad",
								data : {
									memNo : '${loginUserN.memNo }',
									addName : $("#addName").val()
								},
								success : function(result) {

									if (result == "success") {
										location.reload(); // 서버 새로고침
									}
								},
								error : function() {
									alert("주소록을 추가하는데 실패했습니다. 다시 시도해주세요.");
								}

							})
						} else {
							alert("주소록명을 입력해주세요.");
						}

					})
				}

				// 주소록 추가 '취소'시 처리하는 함수
				function dismissInsertAdd() {
					$(".insertAddBook").hide();
				}
			</script>

		</nav>
		<!-- 게시판 영역 -->
		<div class="main-content_indiv">
			<!-- Page Heading -->
			<div class="second-title">
				<h2>개인 주소록</h2>
			</div>

			<div>
				<span class="mailListCheck"><input type="checkbox"></span>
				<button type="button" class="reply-btn">
					<i class="fas fa-location-arrow"></i>&nbsp;&nbsp;메일 작성
				</button>
				<button type="button" class="sub-btn" onclick="deleteAddress();">
					<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;삭제
				</button>
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
					<input type="text" placeholder="검색"> <i
						class="fas fa-search fa-lg address-search"></i>
				</div>

				<div class="selectOption" style="margin-bottom: 10px">
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
						<c:choose>
							<c:when test="${empty list }">
								<tr>
									<td colspan="7">등록된 연락처가 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="a" items="${list}">
									<!-- 반복문 시작 -->
									<tr>
										<td><input type="checkbox"></td>
										<td data-toggle="modal" data-target="#update-Address">${a.addName }</td>
										<td>${a.addDept }</td>
										<td>${a.addJob }</td>
										<td>${a.addPhone }</td>
										<td>${a.addEmail }</td>
										<td>${a.addMemo }</td>
									</tr>
								</c:forEach>
								<!-- 반복문 끝 -->
							</c:otherwise>
						</c:choose>

					</tbody>
				</table>
				<br>
				<br>
			</div>

				<Script>

                            // 더블클릭시 해당 선택자에게 메일 보내는 함수 실행
                            $(function() {
                                $(".board-content>tbody>tr").dblclick(function() {
                                    location.href="sendMail.ma?mail=" + $(this).children().eq(6).text();
                                })
                            })

           		</Script>

			<div style="margin: 30px 0 30px 0">

				<c:choose>
					<c:when test="${empty list }">
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
							</ul>
						</nav>
					</c:when>
					<c:otherwise>
						<nav aria-label="Page navigation example">
							<ul class="pagination justify-content-center">
								<c:choose>
									<c:when test="${pi.currentPage eq 1 }">
										<li class="page-item"><a class="page-link disabled"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<!--  href="indivAddressBook.ad?page=${pi.currentPage -1 }" -->
										<li class="page-item"><a class="page-link"
											onclick="movePage('indivAddressBook.ad', ${pi.currentPage -1 });"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:otherwise>
								</c:choose>
								<!-- href="indivAddressBook.ad?page=${p }" -->
								<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
									<li class="page-item"><a class="page-link"
										onclick="movePage('indivAddressBook.ad', ${p });">${p }</a></li>
								</c:forEach>

								<c:choose>
									<c:when test="${pi.currentPage eq pi.maxPage }">
										<li class="page-item"><a class="page-link disabled"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<!-- href="indivAddressBook.ad?page=${pi.currentPage + 1}" -->
										<li class="page-item"><a class="page-link"
											onclick="movePage('indivAddressBook.ad', ${pi.currentPage + 1});"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<form id="moveForm" action="" method="post">
		<input type="hidden" name="memNo" value="${loginUserN.memNo }">
		<input type="hidden" name="page" id="page">
	</form>

	<script>
		function movePage(url, page){
			$("#moveForm").children("#page").val(page);
			$("#moveForm").attr("action", url).submit();
		}
	</script>
	<!-- /.container-fluid -->
                
 <!-- 개인 주소록 연락처 추가(add-Address Model) 모달-->
	<div class="modal" id="add-Address">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="height: 600px">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">
						<b>연락처 추가</b>
					</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<!-- 해당 버튼 클릭시 모달과 연결해제 -->
				</div>

				<!-- Modal body -->
				<form action="insertAddIndivNum.ad" method="post">

					<div class="modal-body" align="center">

						<!-- 나중에 로그인된 회원으로 value값 변경하기!!! -->
						<input type="hidden" name="memNo" value="${loginUserN.memNo }">

						<div class="insertAddress">

							<table class="address-table">
								<tr>
									<th>그룹 선택</th>
									<td><c:choose>
											<c:when test="${empty category }">
												<select name="addNo" id="select-addressBook">
													<option value="2" selected>개인주소록</option>
												</select>
											</c:when>
											<c:otherwise>
												<select name="addNo" id="select-addressBook">
													<c:forEach var="c" items="${category }">
														<option value="${c.addNo }">${c.addName }</option>
													</c:forEach>
												</select>
											</c:otherwise>
										</c:choose></td>
								</tr>

								<tr>
									<th>이름</th>
									<td id="addName"><input type="text" name="addName"></td>
								</tr>
								<tr>
									<th>부서명</th>
									<td id="addDept"><input type="text" name="addDept"></td>
								</tr>
								<tr>
									<th>직급명</th>
									<td id="addJob"><input type="text" name="addJob"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td id="addPhone"><input type="text" name="addPhone"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td id="addEmail"><input type="text" name="addEmail"></td>
								</tr>
								<tr>
									<th>메모</th>
									<td id="addMemo"><input type="text" name="addMemo"></td>
								</tr>

							</table>

						</div>


						<div style="margin-top: 10px;">
							<button type="button" class="addBtn" onclick="insertAddNum();"
								style="background-color: slategray; color: white; border: none;">추가</button>
							<button type="button" data-dismiss="modal" class="addBtn">취소</button>
						</div>

					</div>

				 <script>
				
		        	// 선택한 그룹에 연락처 추가하는 ajax함수
		        	function insertAddNum(){
		        		
		        		if( $("#addName>input").val().trim().length != 0 && $("#addPhone>input").val().trim().length != 0 ){
		        				
			        		$.ajax({
			        			method : "get",
			        			url : "insertAddIndivNum.ad",
			        			data : {
			        				memNo : ${loginUserN.memNo},
			        				addNo : $('select[name=addNo] option:selected').val(),
			        				addName : $("#addName>input").val(),
			        				addDept : $("#addDept>input").val(),
			        				addJob : $("#addJob>input").val(),
			        				addPhone : $("#addPhone>input").val(),
			        				addEmail : $("#addEmail>input").val(),
			        				addMemo : $("#addMemo>input").val()
			        			},
			        			success : function(result) {
			        				
			        				console.log("성공");

			        				if(result == 'success') {
										location.reload(); // 서버 새로고침
									}
								},
			        			error : function(){
			        				console.log("실패");
			        			}
			        		})

		        		} else {
		        			alert("이름 및 연락처를 입력해주세요.");
		        		}

		        	}

				</script>

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

                <input type="hidden" name="memNo" value="${loginUserN.memNo }">

                    <div class="insertAddress">

                        <table class="address-table">
                            <tr>
                                <th>그룹 선택</th>
                                <td>
                                    <select name="">
                                    <c:forEach var="ca" items="${category }">
                                        <option value="${ca.addNo }">${ca.addName }</option>
                                    </c:forEach>
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
                        <button type="button" class="addBtn" style="background-color:slategray; color:white; border:none;">수정</button>
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