<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/mail.css"
	rel="stylesheet" type="text/css">

<title>보낸 메일함</title>
</head>
<body>

	<!-- 은영 -->
	<jsp:include page="../common/header.jsp" />

	<!-- 공통요소 사이드 메뉴바(메일만 해당) -->
	<jsp:include page="commonMailMenu.jsp" />

	<!-- 메인 콘텐츠 영역 -->
	<div class="main-content">
		<div class="second-title">
			<div>
				<i class='fas fa-bookmark' style='color:${t.tagColor}'></i>
				${t.tagName }	
				 <span class="mail-count">전체메일 ${count } / 안읽은 메일 ${unread }</span>
			</div>

			<ul class="navbar-nav ml-auto moDelte">
				<li class="nav-item dropdown no-arrow navigation"><span
					class="mailListCheck"><input type="checkbox" id="allCheck"
						onclick="allCheck(this)"></span>
					<button type="button" class="reply-btn">
						<i class="fas fa-location-arrow"></i>&nbsp;&nbsp;답장
					</button>
					<button type="button" class="sub-btn">
						<i class="fas fa-arrow-right"></i>&nbsp;&nbsp;전달
					</button>
					<button type="button" class="sub-btn" onclick="chooseDelete();">
						<i class="fas fa-trash-alt"></i>&nbsp;&nbsp;삭제
					</button>
					<button class="nav-link dropdown-toggle sub-btn tag-btn" href="#"
						id="dotDropdown" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-bookmark"></i>&nbsp;&nbsp;태그
					</button>
					<button type="button" class="sub-btn warning-btn">
						<i class="fas fa-exclamation-triangle"></i>&nbsp;&nbsp;스팸신고
					</button>
					<div class="dropdown-list dropdown-menu shadow" id="tagList"
						aria-labelledby="dotDropdown" style="margin-top: -10px;">

					</div>
				</li>
			</ul>
			
		</div>
		
		<script>
			
			// 태그 목록 조회
			$(".tag-btn").click(function(){
				insertTagList();
			})

			// 태그 목록 조회
			function insertTagList(){
				
				$.ajax({
					url : "selectTagList.ma",
					data : {
						memNo : ${loginUser.memNo}
					},
					success : function(tag){
						let value="";
	
						for(let i=0; i < tag.length; i++){
	
							value += "<a class='dropdown-item d-flex align-items-center' id='tag'>"
									+ "<input type='hidden' name='tagNo' value='" + tag[i].tagNo + "'>"
									+ "<span class='font-weight-bold'>"
									+ "<i class='fas fa-bookmark' style='color:" + tag[i].tagColor + "'></i>&nbsp;&nbsp;"
									+ tag[i].tagName
									+ "</span>"
									+ "</a>"
						}
						
						$("#tagList").html(value);
					},
					error : function(){
						console.log("태그 조회 실패");
					}
				})
				
			}
			
			/*
			// 메일에 태그 삽입하는 함수
			$(document).on("click", "#tag", function(){
				
				let tagNo = $(this).children("input[name=tagNo]").val();
				console.log(tagNo);
				
				let checkArr = [];
				
				$(".mail-select").each(function(){
					if($(this).prop("checked")){
						checkArr.push( $(this).val() );
					}
				})
				//console.log(checkArr.length);
				
				if(checkArr.length < 1){
					alert("태그를 추가할 메일을 선택해주세요.");					
				} else {
					
					const mailNo = checkArr.toString();
					console.log(mailNo);
					
					$.ajax({
						url : "insertMailTag.ma",
						data : {
							tagNo : tagNo,
							memNo : ${loginUser.memNo},
							mailNo : mailNo,
							receiveMail : '${loginUser.memEmail}',
						},
						success : function(result){
							console.log(result);
							if(result == 'success'){
								location.reload();
							}
						},
						error : function(){
							console.log("메일에 태그 추가 실패");
						}
					})	

				}

			})
			*/
			
		</script>

		<hr style="margin: 20px 0px 15px 0px;">
		<div class="mail-list">
			<table class="mail">
				
				<!-- 반복문 사용 시작 -->
				<c:forEach var="m" items="${list}">
				<tr>
					<td><input type="checkbox" class="mail-select" name="mailNo" value="${m.mailNo }"></td>
					<td>
						<c:choose>
							<c:when test="${m.mailStatus.mailImportant == 'N' }">
								<!-- 찜하기 전 --> 
								<i class="icon far fa-star"
									onclick="importantBtn(${m.mailNo}, '${m.mailStatus.mailImportant }');"></i> 
							</c:when>
							<c:otherwise>
								<!-- 찜하기 후 -->
								<i class="icon fas fa-star" id="import"
									onclick="importantBtn(${m.mailNo}, '${m.mailStatus.mailImportant }');"></i>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<c:choose>
							<c:when test="${m.mailStatus.mailRead == 'N' and m.mailStatus.mailFolder != 1}">
								<!-- 안읽은 메일 --> 
								<i class="icon fas fa-envelope"></i> 
							</c:when>
							<c:otherwise>
								<!-- 읽은 메일 -->
								<i class="icon far fa-envelope-open"></i> 
							</c:otherwise>
						</c:choose>
					</td>
					<td>

						<!-- 첨부파일 있는 경우 생성 -->
						<c:if test="${m.attachment.atCount > 0 }">
                         	<i class="icon fas fa-paperclip"></i>
                        </c:if>
                         
					</td>
					<td>
						<c:choose>
							<c:when test="${empty m.sendName}">
								<!-- 사내직원이 보내지 않은 경우 -->
								<td class="mail-person" width="15%"><div class="person">${m.sendMail }</div></td>
							</c:when>
							<c:otherwise>
								<!-- 사내직원이 보낸 경우 -->
								<td class="mail-person" width="15%"><div class="person">${m.sendName }</div></td>
							</c:otherwise>
						</c:choose>
					</td>
					<td>	
						<c:choose>
							<c:when test="${m.tagNo == '' }">
									
							</c:when>
							<c:otherwise>
								<i class='fas fa-bookmark' style="color:${m.tag.tagColor};" ></i>
							</c:otherwise>
						</c:choose>
					</td>
					<td class="mail-title">
						<c:if test="${m.mailType == 1}"><span style="color:red;">[중요!]</span></c:if>
						${m.mailTitle }
						<input type="hidden" name="mailNo" value="${m.mailNo }">
					</td>
					<td class="mail-sendtime">${m.sendDate }</td>
				</tr>
				
				<!-- 반복문 끝 -->
				</c:forEach>
					
			</table>

		</div>
		
		<form id="postMailDetail" action="mailDetail.ma" method="post">
			<input type="hidden" name="mailFolder" value="1">
			<input type="hidden" name="mailNo" id="detailNo">
		</form>
		
		<script>
		
		    // '전체클릭'버튼 클릭시 실행하는 함수
		    function allCheck(allCheck){
			  				  
			 let checkboxes = document.querySelectorAll('input[type="checkbox"]');
	
			  console.log( checkboxes);
	           checkboxes.forEach((checkbox)=>{
	        	   
	              checkbox.checked = allCheck.checked; // 전체 클릭 클릭시 => 항목 전체 선택 실행
	              
	           });
	        }
					
			// '중요메일' 설정시 실행하는 함수
			function importantBtn(mailNo, important){

				$.ajax({
					url : "updateImportant.ma",
					data : {
						mailNo : mailNo
					  , sendMail : '${loginUser.memEmail}'
					  , mailFolder : 1
					  , mailImportant : important
					},
					success : function(result){
						console.log(result);
						if(result == 'success'){
							location.reload();
						}
					},
					error : function(){
						console.log("좋아요 실패");
					}
				})

			}
			
			// '메일 상세 조회'시 실행하는 함수
			$(function(){
				$(".mail-title").click(function(){
					
					let mailNo = $(this).children('input[type=hidden]').val();
					console.log(mailNo);
					$("#detailNo").val(mailNo);
					$("#postMailDetail").submit();

				})
			})
			
			
			// 메일 '삭제'시 실행하는 함수
			function chooseDelete(){

				let checkArr = [];
				
				$("input[name=mailNo]").each(function(){
					if( $(this).prop("checked") ){
						checkArr.push( $(this).val() );
					}
				});
				
				const mailNo = checkArr.toString();
				console.log(mailNo);
				
				$.ajax({
					url : "deleteMail.ma",
					data : {
						sendMail : '${loginUser.memEmail}',
						mailNo : mailNo,
						mailFolder : 1
					},
					success : function(result){
						console.log(result);
						if(result == 'success'){
							location.reload();				
						}		
					},
					error : function(){
						console.log("메일 삭제 실패");
					}
				})
				
			}
			

		</script>
		
		<!-- 페이지 바 -->
		<div class="page-nav" style="margin: 30px 0 30px 0">
			<c:choose>
				<c:when test="${empty list }">
					<!-- 연락처 목록 없는 경우 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center"></ul>
					</nav>
				</c:when>
				<c:otherwise>
					<!-- 연락처 목록 있는 경우 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						
							<c:choose>
								<c:when test="${pi.currentPage eq 1 }">
									<!-- 현재 페이지가 1인 경우 -->
									<li class="page-item">
										<a class="page-link disabled" aria-label="Previous"> 
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<!-- 현재 페이지가 1이 아닌 경우 -->
									<li class="page-item">
										<a class="page-link"
											href="tagMailList.ma?page=${pi.currentPage - 1 }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
							
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<li class="page-item">
									<a class="page-link"
									   href="tagMailList.ma?page=${p }">${p }</a>
								</li>
							</c:forEach>
							
							<c:choose>
								<c:when test="${pi.currentPage eq pi.maxPage }">
									<!-- 현재 페이지가 마지막인 경우 -->
									<li class="page-item"><a class="page-link disabled"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<!-- 현재 페이지가 마지막이 아닌 경우 -->
									<li class="page-item"><a class="page-link"
										href="tagMailList.ma?page=${pi.currentPage + 1}"
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
	<!-- /.container-fluid -->

	<!-- 태그 추가(addTags Model) 모달-->

	<div class="modal" id="addTags">
		<div class="modal-dialog modal-dialog-centered">
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


						<input type="hidden" name="" value="">

						<div class="setup-tag">

							<div>태그 이름</div>
							<input type="text" name="" style="width: 100%;"> <br>

							<div class="tag-color">
								<div>태그 색상</div>

								<div id="select-tag" style="text-align: center;">
									<i class="fas fa-bookmark fa-lg" style="color: red;"></i> <i
										class="fas fa-bookmark fa-lg" style="color: orange;"></i> <i
										class="fas fa-bookmark fa-lg" style="color: gold;"></i> <i
										class="fas fa-bookmark fa-lg" style="color: green"></i> <i
										class="fas fa-bookmark fa-lg" style="color: blue;"></i> <br>
									<i class="fas fa-bookmark fa-lg" style="color: purple;"></i> <i
										class="fas fa-bookmark fa-lg" style="color: violet;"></i> <i
										class="fas fa-bookmark fa-lg" style="color: gray;"></i> <i
										class="fas fa-bookmark fa-lg" style="color: pink;"></i> <i
										class="fas fa-bookmark fa-lg" style="color: yellowgreen;"></i>
								</div>
							</div>

						</div>


						<div>
							<button type="submit" class="mailBtn"
								style="background-color: slategray; color: white; border: none;">추가</button>
							<button type="button" data-dismiss="modal" class="mailBtn">취소</button>
						</div>

					</div>

				</form>

			</div>
		</div>
	</div>

	<!-- 태그 수정(updateTags Model) 모달-->

	<div class="modal" id="updateTags">
		<div class="modal-dialog modal-dialog-centered">
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
										<i class="fas fa-bookmark fa-lg" style="color: red;"></i> <i
											class="fas fa-bookmark fa-lg" style="color: orange;"></i> <i
											class="fas fa-bookmark fa-lg" style="color: gold;"></i> <i
											class="fas fa-bookmark fa-lg" style="color: green"></i> <i
											class="fas fa-bookmark fa-lg" style="color: blue;"></i> <br>
										<i class="fas fa-bookmark fa-lg" style="color: purple;"></i> <i
											class="fas fa-bookmark fa-lg" style="color: violet;"></i> <i
											class="fas fa-bookmark fa-lg" style="color: gray;"></i> <i
											class="fas fa-bookmark fa-lg" style="color: pink;"></i> <i
											class="fas fa-bookmark fa-lg" style="color: yellowgreen;"></i>
									</div>
								</div>

							</div>


							<div>
								<button type="submit" class="mailBtn"
									style="background-color: slategray; color: white; border: none;">확인</button>
								<button type="button" data-dismiss="modal" class="mailBtn">취소</button>
							</div>
					</div>

				</form>

			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />


</body>
</html>