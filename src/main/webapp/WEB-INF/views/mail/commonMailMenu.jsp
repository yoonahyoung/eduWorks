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
<link href="${pageContext.request.contextPath}/resources/css/mail.css"
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
						onclick="location.href='writeMailToMeForm.ma'">나에게 작성</button>
				</div>
			</div>

			<div class="insider">
				<h4 class="">태그</h4>
				<!-- 태그 추가시 생성 -->

				<!-- 반복문 사용 -->
				<div class="tagList">
				
				</div>

				<div id="plus-tag" data-toggle="modal" data-target="#addTags">+
					태그추가</div>
			</div>

			<div class="insider">
				<h4>메일함</h4>
				<a href="sendMailList.ma"><h6>보낸메일</h6></a> <a
					href="receiveMailList.ma"><h6>받은메일</h6></a> <a
					href="sendMailToMeList.ma"><h6>내게쓴메일</h6></a> <a
					href="TemporaryMailList.ma"><h6>임시보관함</h6></a> <a
					href="deleteMailList.ma" style="display: inline-block;"><h6>휴지통</h6></a>
				<button type="button" id="empty" onclick="emptyMail();">비우기</button>
			</div>

			<div class="insider">
				<h4>빠른 검색</h4>
				<a href="importantMailList.ma"><h6>중요메일함</h6></a> <a
					href="readMailList.ma"><h6>읽은메일함</h6></a> <a
					href="unReadMailList.ma"><h6>안읽은메일함</h6></a> <a
					href="spamMailList.ma"><h6>스팸메일함</h6></a>
			</div>

			<div class="insider">
				<a class="setup"><i class="fas fa-cog"
					style="color: gray; margin-right: 10px"></i>메일 환경설정</a>
			</div>
		</nav>

		<script>

			// '태그 삭제'클릭시 실행하는 함수
			function deleteTags() {
				let answer = confirm("태그를 삭제하시겠습니까?");

				
			}

			// '비우기' 클릭시 실행하는 함수
			function emptyMail() {
				let answer = confirm("휴지통을 비우시면 지워진 메일(중요메일 포함)들은 복구할 수 없습니다.\n\n휴지통을 비우시겠습니까?");
				
				if(answer == true){
					$.ajax({
						url: "deleteAllMail.ma",
						data : {
							memNo : '${loginUser.memNo}',
							sendMail : '${loginUser.memEmail}',
							receiveMail : '${loginUser.memEmail}'
						},
						success : function(result){
							console.log(result);
							if(result == 'success'){
								alert("메일함 비우기가 완료되었습니다.");
								location.reload();
							}
						},
						error : function(){
							console.log("메일 전체 삭제 실패");
						}
					})
				}
				
			}
			
			
			// 태그 목록 조회
			
			function selectTagList(){
				
				$.ajax({
					url : "selectTagList.ma",
					data : {
						memNo : "${loginUser.memNo}"
					},
					success : function(tag){
						let value="";
						console.log(tag);
						console.log(tag.length);
						for(let i=0; i < tag.length; i++){
							console.log(tag);
							value += "<div class='tag-title'>" 
								+ "<a href='' class='tag-name'>"
								+ "<h6>"
								+ "<i class='fas fa-bookmark' style='color:" + tag[i].tagColor + "'></i>&nbsp;&nbsp;"
							    + tag[i].tagName
								+ "</h6>"
								+ "</a>"
								+ "<a class='tag-modify' href='#' id='dotDropdown' role='button' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
								+ "<i class='fas fa-ellipsis-v'></i>"
								+ "</a>"
								+ "<div class='dropdown-list dropdown-menu shadow' aria-labelledby='dotDropdown' style='margin-left: -180px; margin-top: -10px;'>"
								+ "<a class='dropdown-item d-flex align-items-center' href='#' data-toggle='modal' data-target='#updateTags'>"
								+ "<span class='font-weight-bold'>수정하기</span>"
								+ "</a>"
								+ "<a class='dropdown-item d-flex align-items-center' onclick='deleteTags();'>"
								+ "<span class='font-weight-bold'>삭제하기</span>"
								+ "</a>"
								+ "</div>"
								+"</div>"
						}
	
						
						$(".tagList").html(value);
					},
					error : function(){
						console.log("태그 조회 실패");
					}
				})
				
			}
			
			$(function(){
				selectTagList();
			})

			
		</script>

		<!-- 태그 추가(addTags Model) 모달-->
		<div class="modal" id="addTags">
			<div class="modal-dialog modal-dialog-centered" style="width: 400px;">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">
							<b>태그 추가</b>
						</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<!-- 해당 버튼 클릭시 모달과 연결해제 -->
					</div>

					<!-- Modal body -->
					<form action="" method="post">
						<div class="modal-body" align="center">

							<input type="hidden" name="memNo" value="${loginUser.memNo }">
							<input type="hidden" name="tagColor" id="tagColor">

							<div class="setup-tag">

								<div>태그 이름</div>
								<input type="text" name="tagName" id="tagName"> <br>

								<div class="tag-color">
									<div>태그 색상</div>

									<div id="select-tag" style="text-align: center;">

										<a class="bgcolor1 tagColor" color="bgcolor1">bgcolor1</a> 
										<a class="bgcolor2 tagColor" color="bgcolor2">bgcolor2</a> 
										<a class="bgcolor3 tagColor" color="bgcolor3">bgcolor3</a> 
										<a class="bgcolor4 tagColor" color="bgcolor4">bgcolor4</a> 
										<a class="bgcolor5 tagColor" color="bgcolor5">bgcolor5</a> <br>
										<a class="bgcolor6 tagColor" color="bgcolor6">bgcolor6</a> 
										<a class="bgcolor7 tagColor" color="bgcolor7">bgcolor7</a> 
										<a class="bgcolor8 tagColor" color="bgcolor8">bgcolor8</a> 
										<a class="bgcolor9 tagColor" color="bgcolor9">bgcolor9</a> 
										<a class="bgcolor10 tagColor" color="bgcolor10">bgcolor10</a>

									</div>
								</div>

							</div>


							<div class="tagBtn">
								<button type="button" class="mailBtn addTag" onclick="insertTag();" data-dismiss="modal">추가</button>
								<button type="button" data-dismiss="modal" class="mailBtn">취소</button>
							</div>

						</div>

					</form>

				</div>
			</div>
		</div>

		<script>
    	
    	// 태그 선택시 클래스명 지정하는 함수
    	function choiceTag(num){
    		
    		// 선택한 색상에 클래스 추가
    		$(".bgcolor" + num).addClass("active");
    		
    		// 선택한 색상 외 클래스 제거
    		$(".tagColor").not($(".bgcolor" + num)).removeClass("active");
    		
    		// 선택한 색상 배경색 추출
    		let color = $(".bgcolor" + num).css("background-color");

    		// tagColor value값에 넣기
    		$("input[name=tagColor]").val(color);
      		
    	}
    	
    	// 태그 '추가'시 실행하는 함수
    	function insertTag(){
    		
    		let color = $("#tagColor").val();
    		console.log(color);
    		let name = $("#tagName").val();
    		console.log(name);
    		
    		$.ajax({
    			url : "insertTag.ma",
    			data : {
    				memNo : "${loginUser.memNo}",
    				tagName : name,
    				tagColor : color
    			},
    			success : function(result){
    				console.log(result);
    				selectTagList();
    			},
    			error : function(){
    				console.log("태그 추가 실패");
    			}
    		})

    		
    	}

    	</script>


		<!-- 태그 수정(updateTags Model) 모달-->
		<div class="modal" id="updateTags">
			<div class="modal-dialog modal-dialog-centered" style="width: 400px;">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">
							<b>태그 수정</b>
						</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<!-- 해당 버튼 클릭시 모달과 연결해제 -->
					</div>

					<!-- Modal body -->
					<form action="" method="post">
						<div class="modal-body" align="center">
							<input type="hidden" name="" value="">

							<div class="setup-tag">

								<div>태그 이름</div>
								<input type="text" name="" value="" style="width: 100%;">
								<br>

								<div class="tag-color">
									<div>태그 색상</div>

									<div id="select-tag" style="text-align: center;">

										<a class="bgcolor1 tagColor" color="bgcolor1">bgcolor1</a> 
										<a class="bgcolor2 tagColor" color="bgcolor2">bgcolor2</a> 
										<a class="bgcolor3 tagColor" color="bgcolor3">bgcolor3</a> 
										<a class="bgcolor4 tagColor" color="bgcolor4">bgcolor4</a> 
										<a class="bgcolor5 tagColor" color="bgcolor5">bgcolor5</a> <br>
										<a class="bgcolor6 tagColor" color="bgcolor6">bgcolor6</a> 
										<a class="bgcolor7 tagColor" color="bgcolor7">bgcolor7</a> 
										<a class="bgcolor8 tagColor" color="bgcolor8">bgcolor8</a> 
										<a class="bgcolor9 tagColor" color="bgcolor9">bgcolor9</a> 
										<a class="bgcolor10 tagColor" color="bgcolor10">bgcolor10</a>

									</div>
								</div>

							</div>

							<div class="tagBtn">
								<button type="submit" class="mailBtn addTag">확인</button>
								<button type="button" data-dismiss="modal" class="mailBtn">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>

</body>
</html>