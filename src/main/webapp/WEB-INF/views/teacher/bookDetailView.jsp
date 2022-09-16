<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/book.css" rel="stylesheet" type="text/css">

</head>
<body>

	<jsp:include page="../common/header.jsp" />
	

                    
         <!-- 게시판 영역 -->
		<div style="padding:0; width:100%;">
			<!-- Page Heading -->	
			<div class="d-sm-flex align-items-center mb-4" id="boardHeader">
			    <h2 style="color:black">교재 정보</h2>
			</div>
			
			<br>
			
			
			
				<div class="tableOption" style="display:flex; justify-content: space-between;">
				
				
				<!------- 케밥 메뉴 -------->
					<ul class="navK">
						 <div class="kebab">
						   <figure></figure>
						   <figure class="middleK"></figure>
						   <p class="crossK">x</p>
						   <figure></figure>
						   <ul class="dropdownK">
						     <li><a onclick="postFormSubmit2('bookUpdateForm.bk');">교재수정</a></li>
							 <hr>
							 <li><a onclick="deleteForm('bookDelete.bk')">교재 삭제</a></li>
						   </ul>
						</div>
					</ul>
					
				
				    
				
				</div>
				
			<form id="postForm2" action="" method="post">
				<input type="hidden" value="${ b.bookNo }" name="no">
			</form>
			
					<script>
						function postFormSubmit2(url){
							$("#postForm2").attr("action", url);
							$("#postForm2").submit();
						}
						
						function deleteForm(url){
							console.log(url);
							/*
						    var result = confirm('정말 삭제하시겠습니까?');
						    if(result == true){
						        $("#postForm").attr("action", url).submit();
						    }
						    */
	
						    Swal.fire({
						       title: '정말 삭제하시겠습니까?',
						       text: '다시 되돌릴 수 없습니다. 신중하세요.',
						       icon: 'warning',
						       
						       showCancelButton: true, // cancel버튼 보이기. 기본은 원래 없음
						       confirmButtonColor: 'slategray', // confrim 버튼 색깔 지정
						       cancelButtonColor: 'lightgray', // cancel 버튼 색깔 지정
						       confirmButtonText: '삭제', // confirm 버튼 텍스트 지정
						       cancelButtonText: '취소', // cancel 버튼 텍스트 지정
						       
						       reverseButtons: true, // 버튼 순서 거꾸로
						       
						    }).then(result => {
						       // 만약 Promise리턴을 받으면,
						       if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면
						    	   $("#postForm2").attr("action", url).submit();
						           Swal.fire('삭제가 완료되었습니다.', '', 'success');
						       }
						    });

						}
						
					</script>
				
				
				
					<script>
					var kebab = document.querySelector('.kebab'),
					middle = document.querySelector('.middleK'),
					cross = document.querySelector('.crossK'),
					dropdown = document.querySelector('.dropdownK');
					
					kebab.addEventListener('click', function() {
					middle.classList.toggle('active');
					cross.classList.toggle('active');
					dropdown.classList.toggle('active');
					})
					</script>
				   
			    
			   
			    
		
			<div class="main_width">
			     <table class="board-content table"  align="center">
			          <tr>
			               <th>교재명</th>
			               <td>${ b.bkTitle }</td>
			          </tr>
			          <tr>
			               <th>강사명</th>
			               <td>${ b.memName }</td>
			          </tr>
			          <tr>
			               <th>교재 내용</th>
			               <td>${ b.bkContent }</td>
			          </tr>
			          
			       </table>
			       <br><br>
			      
			</div>
			<div class="btn_two_spacing">
			  <button id="gogo" type="submit" style="float:right; padding-right: 10%;">목록가기</button>
			</div>
		</div>  
		
		<script>
			$("#gogo").click(function(){
				location.href = 'bookList.bk';
			})
		</script>
	

        <!-- End of Content Wrapper -->

   	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>