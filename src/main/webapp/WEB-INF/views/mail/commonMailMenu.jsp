<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link
	href="${pageContext.request.contextPath}/resources/css/insertMailForm.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/css/mail.css"
	rel="stylesheet" type="text/css">
</head>
<body>

	<!--Begin of Main Content -->
	<!-- Begin Page Content -->
	<div class="container-fluid">
		<nav class="menu-sidebar">
			<div class="insider">
				<h2>메일</h2>
				<div>
					<button type="button" class="writeForm key_btn-lg"
						onclick="location.href='writeMailForm.ma'">메일 작성</button>
					<button type="button" class="writeForm key_btn-lg" 
						onclick="location.href='writeMailToMeForm.ma'">나에게
						작성</button>
				</div>
			</div>

			<div class="insider">
				<h4>태그</h4>
				<!-- 태그 추가시 생성 -->

				<!-- 반복문 사용 -->
				<div class="tag-title">
					<a href=""><h6>
							<i class="fas fa-bookmark" style="color: red;"></i>&nbsp;&nbsp;중요자료
						</h6> </a> <a class="tag-modify" href="#" id="dotDropdown" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-ellipsis-v"></i>
					</a>
					<div class="dropdown-list dropdown-menu shadow"
						aria-labelledby="dotDropdown"
						style="margin-left: -180px; margin-top: -10px;">
						<!-- 작성자에게만 보임 -->
						<a class="dropdown-item d-flex align-items-center" href="#"
							data-toggle="modal" data-target="#updateTags"> <span
							class="font-weight-bold">수정하기</span>
						</a> <a class="dropdown-item d-flex align-items-center"
							onclick="deleteTags();"> <span class="font-weight-bold">삭제하기</span>
						</a>
					</div>
				</div>

				<!-- 반복문 사용 -->
				<div class="tag-title">
					<a href=""><h6>
							<i class="fas fa-bookmark" style="color: gold;"></i>&nbsp;&nbsp;회의자료
						</h6> </a> <a class="tag-modify" href="#" id="dotDropdown" role="button"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-ellipsis-v"></i>
					</a>
					<div class="dropdown-list dropdown-menu shadow"
						aria-labelledby="dotDropdown"
						style="margin-left: -180px; margin-top: -10px;">
						<!-- 작성자에게만 보임 -->
						<a class="dropdown-item d-flex align-items-center" href="#"
							data-toggle="modal" data-target="#updateTags"> <span
							class="font-weight-bold">수정하기</span>
						</a> <a class="dropdown-item d-flex align-items-center"
							onclick="deleteTags();"> <span class="font-weight-bold">삭제하기</span>
						</a>
					</div>
				</div>

				<div id="plus-tag" data-toggle="modal" data-target="#addTags">+
					태그추가</div>
			</div>

			<div class="insider">
				<h4>메일함</h4>
				<a href="sendMailForm.ma"><h6>보낸메일</h6></a> <a
					href="receiveMailForm.ma"><h6>받은메일</h6></a> <a href=""><h6>내게쓴메일</h6></a>
				<a href=""><h6>임시보관함</h6></a> <a href=""
					style="display: inline-block;"><h6>휴지통</h6></a>
				<button type="button" id="empty" onclick="emptyMail();">비우기</button>
			</div>

			<div class="insider">
				<h4>빠른 검색</h4>
				<a href="importantMailForm.ma"><h6>중요메일함</h6></a> <a href=""><h6>읽은메일함</h6></a>
				<a href=""><h6>안읽은메일함</h6></a> <a href=""><h6>스팸메일함</h6></a>
			</div>

			<div class="insider">
				<a class="setup"><i class="fas fa-cog"
					style="color: gray; margin-right: 10px"></i>메일 환경설정</a>
			</div>
		</nav>

		<script>

             // '태그 삭제'클릭시 실행하는 함수
            function deleteTags(){
            	confirm("태그를 삭제하시겠습니까?");

                    // if(ok){
                    //     태그 삭제;
                    // }
            }

            // '비우기' 클릭시 실행하는 함수
            function emptyMail(){
                 confirm("휴지통을 비우시면 지워진 메일(중요메일 포함)들은 복구할 수 없습니다.\n\n휴지통을 비우시겠습니까?");

                    // if(true){
                    //     휴지통 비우기
                    // }
            }

       </script>
</body>
</html>