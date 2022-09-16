<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/book.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
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
		        <h2>강의 수정</h2>
		        <button class="btn gogo" id="n-btn-border" type="button" style="margin-left:75%">목록가기</button>
                <hr class="hr_line">
		    </div>
		    
		    <script>
				$(".gogo").click(function(){
					location.href = 'doneList.cl';
				})
			</script>
		
		    <br><br><br><br><br>
		    
	    	<form action="donUpdate.cl">
	   		 <div class="main_width">
	   		 	<input type="hidden" value="${t.classNo }" name="classNo">
		         <table id="ttable" class="board-content table"  align="center">
		              <tr>
		                   <th>강의명</th>
		                   <td><input type="text" name="classTitle" value="${ t.classTitle }" style="width:500px;" required></td>
		              </tr>
		              <tr>
		                   <th>강사명</th>
		                   <td>
		                   		 <select id="memNo" name="memNo" selected="${ t.memName }">
			                   		<c:forEach var="l" items="${ list }">
				                        <option  value="${ l.memNo }" >${ l.memName }</option>
			                        </c:forEach>
			                    </select>
		                   </td>
		              </tr>
		              <tr>
		                   <th>강의 날짜</th>
		                   <td><input type="date" name="classStartDate" value="${ t.classStartDate }" required>~<input type="date" name="classEndDate" value="${ t.classEndDate }" required></td>
		              </tr>
		              <tr>
		                   <th>수강료</th>
		                   <td><input type="text" name="classFee" value="${ t.classFee }" style="width:90px;" required>원</td>
		              </tr>
		              <tr>
		                   <th>신청일</th>
		                   <td><input type="text" value="${ t.classSignupDate }" readonly></td>
		              </tr>
		              <tr>
		                   <th>수업 소개</th>
		                   <td>
		                   		<textarea id="content" name="classContent" cols="53" rows="8" style="resize:none; border:none; text-align:center" required>${ t.classContent }</textarea>
		                   </td>
		               </tr>
		           </table>
		       </div>
	           <br><br>
	           
	           <div class="su_btn_two_center" align="center">
                   <button type="submit" class="n-btn su_btn_two su_btn_all" >수정하기</button>
                   <button type="button" id="cen" class="n-btn su_btn_two su_btn_border">취소</button>
               </div>
			 </form>
			<script>
		    	$(function(){
		    		
		    		$('#memNo').val(${t.memNo}).attr("selected",true);
		    		
		    		$("#cen").click(function(){
		    			location.href = 'doneDetail.cl?no=' + ${ t.classNo}; 
		    		})
		    		
		    	})
		    </script>
	           
	       </div>
	      
		</div>
	
		  

        
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>