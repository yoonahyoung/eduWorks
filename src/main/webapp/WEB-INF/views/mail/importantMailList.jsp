<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<!-- 공통요소 사이드 메뉴바(메일만 해당) -->
	<jsp:include page="commonMailMenu.jsp" />

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<div class="second-title">
			<div>
				<div>
					중요 메일함 <span class="mail-count">전체메일 102 / 안읽은 메일 22</span>
				</div>
			</div>

			<ul class="navbar-nav ml-auto moDelte">
				<li class="nav-item dropdown no-arrow"><span
					class="mailListCheck"><input type="checkbox"></span>
					<button type="button" class="sub-btn">
						<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;삭제
					</button>
					<button class="nav-link dropdown-toggle sub-btn tag-btn" href="#"
						id="dotDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bookmark"></i>&nbsp;&nbsp;태그
					</button>
					<div class="dropdown-list dropdown-menu shadow"
						aria-labelledby="dotDropdown" style="margin-top: -10px;">

						<!-- 태그없으면 안보임  -->
						<a class="dropdown-item d-flex align-items-center" href="#"> <span
							class="font-weight-bold">태그색성 + 태그명</span>
						</a> <a class="dropdown-item d-flex align-items-center" href="#"
							data-toggle="modal" data-target="#delete"> <span
							class="font-weight-bold">태그색성 + 태그명</span>
						</a>

						<!-- 태그 생성유무 상관없이 보임-->
						<a class="dropdown-item d-flex align-items-center"
							data-toggle="modal" data-target="#addTags" href="#"> <span
							class="font-weight-bold">+ 태그 추가</span>
						</a>


					</div></li>
			</ul>

			<!-- <span class="mailListCheck"><input type="checkbox"></span>
                            <button type="button" class="mailBtn">삭제</button>
                            <button type="button" class="dropdown mailBtn">태그</button>
                            <a class="nav-link dropdown-toggle mailBtn" href="#" id="searchDropdown" role="button"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">태그</a> 
                            <button type="button" class="mailBtn">읽음</button> -->
		</div>
		<hr style="margin: 20px 0px 10px 0px;">
		<div class="mail-list">


			<table class="mail">
				<!-- 반복문 사용 시작 -->
				<tr>
					<td><input type="checkbox" class="mail-select"></td>
					<td>
						<!-- 중요메일함에는 찜하기된 상태의 이미지만 표시 --> <i class="icon fas fa-star"
						style="color: gold;"></i>
					</td>
					<td>
						<!-- 안읽은 메일 --> <i class="icon fas fa-envelope"></i> <!-- 읽은 메일 -->
						<!-- <i class="icon far fa-envelope-open"></i> -->
					</td>
					<td>
						<!-- 첨부파일 있는 경우 생성 
                                        <i class="icon fas fa-paperclip"></i>
                                        -->
					</td>
					<td class="mail-person" width="15%"><div class="person">이나라</div></td>
					<td class="mail-title">[결재완료] '사전 마케팅을 위한 카페 제휴&운영 건'이(가) 결재가
						완료되었습니다.</td>
					<td class="mail-sendtime">2022-08-10 10:23:22</td>
				</tr>
				<!-- 반복문 끝 -->
				<tr>
					<td><input type="checkbox" class="mail-select"></td>
					<td>
						<!-- 중요메일함에는 찜하기된 상태의 이미지만 표시 --> <i class="icon fas fa-star"
						style="color: gold;"></i>
					</td>
					<td>
						<!-- 안읽은 메일 --> <!-- <i class="icon fas fa-envelope"></i> --> <!-- 읽은 메일 -->
						<i class="icon far fa-envelope-open"></i>
					</td>
					<td>
						<!-- 첨부파일 있는 경우 생성 
                                        <i class="icon fas fa-paperclip"></i>
                                        -->
					</td>
					<td class="mail-person" width="15%"><div class="person">김민수</div></td>
					<td class="mail-title">[결재완료] '사전 마케팅을 위한 카페 제휴&운영 건'이(가) 결재가
						완료되었습니다.</td>
					<td class="mail-sendtime">2022-08-10 10:23:22</td>
				</tr>
				<tr>
					<td><input type="checkbox" class="mail-select"></td>
					<td>
						<!-- 중요메일함에는 찜하기된 상태의 이미지만 표시 --> <i class="icon fas fa-star"
						style="color: gold;"></i>
					</td>
					<td>
						<!-- 안읽은 메일 --> <!-- <i class="icon fas fa-envelope"></i> --> <!-- 읽은 메일 -->
						<i class="icon far fa-envelope-open"></i>
					</td>
					<td>
						<!-- 첨부파일 있는 경우 생성 --> <i class="icon fas fa-paperclip"></i>

					</td>
					<td class="mail-person" width="15%"><div class="person">홍재희</div></td>
					<td class="mail-title">[결재완료] '사전 마케팅을 위한 카페 제휴&운영 건'이(가) 결재가
						완료되었습니다.</td>
					<td class="mail-sendtime">2022-08-10 10:23:22</td>
				</tr>

			</table>

		</div>

		<!-- 페이지 바 -->
		<div class="page-nav" style="margin: 30px 0 30px 0">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>

	<!-- /.container-fluid -->

	<jsp:include page="../common/footer.jsp" />


</body>
</html>