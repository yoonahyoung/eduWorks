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
	
	<div class="container-fluid" style="display: flex;">
        <nav class="menu-sidebar">
            <div class="insider">
                <h4>강의관리</h4>
                <a href="doneList.cl"><h6>강의목록</h6></a>
                <a href="appList.cl"><h6>신청강의</h6></a>
            </div>                        
        </nav>
		<div style="padding:0; width:100%;">
		    <!-- Page Heading -->
		    <div class="d-sm-flex align-items-center mb-4" id="boardHeader">
		        <h2>강의 정보</h2>
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
					     <li><a onclick="postFormSubmit3('donUpdateForm.cl');">강의수정</a></li>
						 <hr>
						 <li><a onclick="deleteForm2('doneDelete.cl')">강의삭제</a></li>
					   </ul>
					</div>
				</ul>
						
			</div>
					    
					
					
					
				<form id="postForm3" action="" method="post">
					<input type="hidden" value="${ t.classNo }" name="no">
					<input type="hidden" value="${ list }">
				</form>
				
						<script>
							function postFormSubmit3(url){
								$("#postForm3").attr("action", url);
								$("#postForm3").submit();
							}
							
							function deleteForm2(url){
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
							    	   $("#postForm3").attr("action", url).submit();
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
		                   <th>강의명</th>
		                   <td>${ t.classTitle }</td>
		              </tr>
		              <tr>
		                   <th>강사명</th>
		                   <td>${ t.memName }</td>
		              </tr>
		              <tr>
		                   <th>강의 날짜</th>
		                   <td>${ t.classStartDate } ~ ${ t.classEndDate }</td>
		              </tr>
		              <tr>
		                   <th>수강료</th>
		                   <td>${ t.classFee }원</td>
		              </tr>
		              <tr>
		                   <th>신청일</th>
		                   <td>${ t.classSignupDate }</td>
		              </tr>
		              <tr>
		                   <th>수업 소개</th>
		                   <td>${ t.classContent }</td>
		               </tr>
		           </table>
	           <br><br>
	           
	           
	           
	       </div>
	      <div class="btn_two_spacing">
			  <button id="gogo" type="submit" style="float:right; padding-right: 10%;">목록가기</button>
			</div>
		</div>
	</div>
		<script>
			$("#gogo").click(function(){
				location.href = 'doneList.cl';
			})
		</script>  

        
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>