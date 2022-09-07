<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="${pageContext.request.contextPath}/resources/css/bookDetailView.css" rel="stylesheet" type="text/css">

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
				     <li><a onclick="updateForm('update.bk');">교재 수정</a></li>
				<hr>
				<li><a onclick="deleteForm('delete.bk')">교재 삭제</a></li>
				    </ul>
				    
				  </div>
				</ul>
				
				<form id="postForm" action="" method="post">
				    <input type="hidden" value="" name="">
				</form>
				
				<script>
				function deleteForm(url){
				    var result = confirm('정말 삭제하시겠습니까?');
				    if(result == true){
				        $("#postForm").attr("action", url).submit();
				    }
				}
				
				function updateForm(url){
				    $("#postForm").attr("action", url).submit();
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
				   
			    
			   
			    
			</div>
		
			<div class="main_width">
			     <table class="board-content table"  align="center">
			          <tr>
			               <th>교재명</th>
			               <td>c언어 알아보기</td>
			          </tr>
			          <tr>
			               <th>강사명</th>
			               <td>김강사</td>
			          </tr>
			          <tr>
			               <th>교재 내용</th>
			               <td>자바 기초에 대한 모든 정수를 담은 이시대 최고의 교재</td>
			          </tr>
			          
			       </table>
			       <br><br>
			      
			</div>
			<div class="btn_two_spacing">
			  <button type="submit" style="float:right; padding-right: 10%;">목록가기</button>
			</div>
		</div>  
	

        <!-- End of Content Wrapper -->

   	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>