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
			<form action="appEnrollForm.cl" >
				<div class="d-sm-flex align-items-center mb-4" id="boardHeader" style="margin:40px" >
					<h2 style="color:black">강의 개설 신청</h2>
				</div>
				
				<br>
				
				<br>
				
				<h5 style="color: rgb(211, 84, 0); font-weight:700; margin-left: 200px; ">신청 내용</h5> <br>
				
				<div style=" display: flex; margin-left: 200px;" >
				
					<div style="flex:1; margin-right: 0px;" >
						<label for="title">강의명</label> <br>
						<input type="text" id="title" name="classTitle" placeholder="내용을 입력해주세요." style="margin-bottom:50px; width:500px" required>
						
						<br>
						
						<label for="object">강의목표</label> <br>
						<textarea id="object" name="classObjective" cols="53" rows="8" placeholder="내용을 입력해주세요" style="resize:none; margin-bottom:50px;" required></textarea>
						
						<br>
						
						<label for="content">강의내용</label> <br>
						<textarea id="content" name="classContent" cols="53" rows="8" placeholder="내용을 입력해주세요" style="resize:none;" required></textarea>
					
					</div>
					<div class="updown"></div>
						<div style="flex:0.9; margin-left: 100px;">
						<label for="subject">과목</label> <br>
						<input type="text" id="subject" name="classSubject" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:350px" required>
						
						<br>
						
						<label for="student">대상</label> <br>
						<input type="text" id="student" name="classStudent" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:350px" required>
						
						<br>
						
						<label for="fee">수강료</label> <br>
						<input type="text" id="fee" name="classFee" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:350px" required>
						
						<br>
						
						<label for="startDate">강의 시작일</label> 
						<input type="date" id="startDate" name="classStartDate" placeholder="내용을 입력해주세요." style="margin-bottom:10px; width:200px" required>
						<br>
						<label for="endDate">강의 종료일</label> 
						<input type="date" id="endDate" name="classEndDate" placeholder="내용을 입력해주세요." style="margin-bottom:30px; width:200px" required>
						
						<div class="clickbtn" style="margin:170px;">
							<button class="addBtn" type="submit" style="margin-right:20px; background-color:slategray; color:white; border:none;">등록</button>
							<button class="addBtn" type="reset">취소</button>
						</div>
						<input type="hidden" name="memNo" value="${ loginUser.memNo }">
					</div>
				</div>
				
			
			</form>
			                    
			                    
			                   
			                 
		    <br><br>
		    
		</div>  
	
	</div>
	
	
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>