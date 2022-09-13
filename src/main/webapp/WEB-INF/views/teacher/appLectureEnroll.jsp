<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/lecture.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	
	<div class="container-fluid">
	                   
	                    <!-- 게시판 영역 -->
		<div style="padding:0; width:85%;">
			<!-- Page Heading -->
			<form action="" >
				<div class="d-sm-flex align-items-center mb-4" id="boardHeader" style="margin:40px" >
					<h2 style="color:black">강의 개설 신청</h2>
				</div>
				
				<br>
				
				<br>
				
				<h5 style="color: rgb(211, 84, 0); font-weight:700; margin-left: 200px; ">신청 내용</h5> <br>
				
				<div style=" display: flex; margin-left: 200px;" >
				
					<div style="flex:1; margin-right: 0px;" >
						<label>과정명</label> <br>
						<input type="text" placeholder="내용을 입력해주세요." style="margin-bottom:50px; width:500px">
						
						<br>
						
						<label>과정목표</label> <br>
						<textarea name="" id="" cols="53" rows="8" placeholder="내용을 입력해주세요" style="resize:none; margin-bottom:50px;"></textarea>
						
						<br>
						
						<label>강의내용</label> <br>
						<textarea name="" id="" cols="53" rows="8" placeholder="내용을 입력해주세요" style="resize:none;"></textarea>
					
					</div>
					<div class="updown"></div>
					<div style="flex:0.9; margin-left: 100px;">
					<label>과목</label> <br>
					<input type="text" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:350px">
					
					<br>
					
					<label>대상</label> <br>
					<input type="text" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:350px">
					
					<br>
					
					<label>장소</label> <br>
					<input type="text" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:350px">
					
					<br>
					
					<label>수강료</label> <br>
					<input type="text" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:350px">
					
					<br>
					
					<label>강의 시작일</label> 
					<input type="date" placeholder="내용을 입력해주세요." style="margin-bottom:10px; width:200px">
					<br>
					<label>강의 종료일</label> 
					<input type="date" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:200px">
					</div>
				</div>
				
				<div class="clickbtn" style="padding-right: 20%; float:right;">
					<button class="addBtn" type="submit" style="margin-right:20px; background-color:slategray; color:white; border:none;">등록</button>
					<button class="addBtn" type="reset">취소</button>
				</div>
			
			</form>
			                    
			                    
			                   
			                 
		    <br><br>
		    
		</div>  
	
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>