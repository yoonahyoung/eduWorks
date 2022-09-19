<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/book.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/loginForm.css" rel="stylesheet" type="text/css">
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
		    
		    
		   <div class="tableOption" style="display:flex; justify-content: space-between; margin:10px;">
		       
				<form id="postForm3" action="appStatus.cl" method="post">
		
	     	   <!------- 케밥 메뉴 -------->
		         <div class="selectOption">
                     <select name="classApproval" id="selectStatus">
                        
                         <option value="1" <c:if test="${t.classApproval == 1}"> selected </c:if>>대기중</option>
			 			 <option value="2" <c:if test="${t.classApproval == 2}"> selected </c:if>>승인</option>
			  			 <option value="3" <c:if test="${t.classApproval == 3}"> selected </c:if>>반려</option>
                     </select>
					<button type="submit" style="width:45px; height:27px;border-radius: 3px;">저장</button>
                 </div>
					<input type="hidden" value="${ t.classNo }" name="classNo">
					<input type="hidden" value="${ list }">
				</form>
			</div>
					    
			<script>
		    	$(function(){
		    		
		    		$('#selectStatus').val(${t.classApproval}).attr("selected",true);
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
			  <button id="gogo" type="submit" style="float:right; padding-right: 10%; width:300px;">목록가기</button>
			</div>
		</div>
	</div>
		<script>
			$("#gogo").click(function(){
				location.href = 'appList.cl';
			})
		</script>  

        
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>