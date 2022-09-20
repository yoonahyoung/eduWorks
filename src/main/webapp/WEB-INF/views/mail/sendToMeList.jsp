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
				내게쓴 메일함 <span class="mail-count">전체메일 ${count } / 안읽은 메일 ${unread }</span>
			</div>

			<ul class="navbar-nav ml-auto moDelte">
				<li class="nav-item dropdown no-arrow"><span
					class="mailListCheck"><input type="checkbox" onclick="allCheck(this)"></span>
					<button type="button" class="reply-btn">
						<i class="fas fa-location-arrow"></i>&nbsp;&nbsp;답장
					</button>
					<button type="button" class="sub-btn">
						<i class="fas fa-arrow-right"></i>&nbsp;&nbsp;전달
					</button>
					<button type="button" class="sub-btn">
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
					</div>
				</li>
			</ul>
		</div>
		
		<hr style="margin: 20px 0px 15px 0px;">
		<div class="mail-list">


			<table class="mail">
				
				<!-- 반복문 사용 시작 -->
				<c:forEach var="m" items="${list}">
				<tr>
					<td><input type="checkbox" class="mail-select"></td>
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
							<c:when test="${m.mailStatus.mailRead == 'N' }">
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
					<td class="mail-person" width="15%"><div class="person">${loginUser.memName }</div></td>
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
											href="sendMailToMeList.ma?page=${pi.currentPage - 1 }"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:otherwise>
							</c:choose>
							
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
								<li class="page-item">
									<a class="page-link"
									   href="sendMailToMeList.ma?page=${p }">${p }</a>
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
										href="sendMailToMeList.ma?page=${pi.currentPage + 1}"
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
	
	<jsp:include page="../common/footer.jsp" />


</body>
</html>