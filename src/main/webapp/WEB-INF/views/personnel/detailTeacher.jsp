<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/personnel.css" rel="stylesheet" type="text/css">
<link href="resources/css/personnel-2.css" rel="stylesheet" type="text/css">
<style type="text/css">
	select {
            width: 200px; 
            height: 30px;
            padding: 0em .5em; 
            font-family: inherit;  
            background: url(selectimg.jpg) no-repeat 95% 50%;  
            border: 1px solid #999; 
            border-radius: 0px; 
            -webkit-appearance: none; 
            -moz-appearance: none;
            appearance: none;
        }

        table {
            width: 100%;
            border: 1px solid #858796;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #858796;
            padding: 10px;
        }
        th{width: 25%; height: 50px;}
        td{width: 75%; height: 50px;}
        
        .su_btn_border{
	     background-color: aliceblue;
	     border: 2px solid #5e7e9b;
	     color: black;
	   }
	   
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../personnel/personnelCss.jsp" />
	
	<!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <nav class="menu-sidebar">
                        <div class="insider">
                            <h4>강사관리</h4>
                            <a href=""><h6>강사조회</h6></a>
                            <a href=""><h6>강사등록</h6></a>
                            
                        </div>
                        
                        <div class="insider">
                            <h4>직원관리</h4>
                            <a href=""><h6>직원조회</h6></a>
                            <a href=""><h6>직원등록</h6></a>
                            <a href=""><h6>신입 OJT</h6></a>
                        </div>
                        <div class="insider">
                            <h4>근태관리</h4>
                            <a href=""><h6>부서별 근태조회</h6></a>
                            <a href=""><h6>조정신청관리</h6></a>
                            <a href=""><h6>연차관리</h6></a>
                        </div>                        
                    </nav>
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header" style="margin-left: 10px;">
                            <h3 class="su_sub_menu_name">강사 상세정보</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            
                            <form>
                            <div style="height: 200px; width: 1000px; " align="center">
                            	<c:choose>
                            		<c:when test="${ empty m.memProfile }">
                            			<input type="image" name="memProfile" src="resources/profile_images/defaultProfile.png" width="25%" height="100%">
                            		</c:when>
                            		<c:otherwise>
                            			<input type="image" name="memProfile" src="${ m.memProfile }" width="25%" height="100%">
                            		</c:otherwise>
                            	</c:choose>
                                
                            </div>
                            <br>
                            <div style="width: 850px; ">
                                <table width="100%">
                                <input type="hidden" name="memNo" id="memNo" value="${ m.memNo }">
                                    <tr>
                                        <th style="background-color: #e6e9ec;">이름</th>
                                        <td>
                                            <input type="text" value="${ m.memName }" name="memName" style="width: 40%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">부서</th>
                                        <td>
                                            <select name="deptCode" id="select1">
                                            	<c:forEach var="d" items="${ dlist }">
                                            		<option value="${ d.deptCode }">${ d.deptName }</option>
                                            	</c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">직급</th>
                                        <td>
                                            <select name="jobCode" id="select1">
                                                <c:forEach var="j" items="${ jlist }">
                                            		<option value="${ j.jobCode }">${ j.jobName }</option>
                                            	</c:forEach>
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">입사일</th>
                                        <td>
                                            <input type="date" name="memEnrollDate" value="${ m.memEnrollDate }">  
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">퇴사일</th>
                                        <c:choose>
                                        	<c:when test="${ empty m.memResignDate }">
                                        		<td>
		                                            <input type="date" name="memResignDate">
		                                        </td>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<td>
		                                            <input type="date" name="memResignDate" value="${ m.memResignDate }">
		                                        </td>
                                        	</c:otherwise>
                                        </c:choose>
                                        
                                    </tr>
                                </table>
                                <script>
	                                $(function(){
	                        			$("option[value=${m.deptCode}]").attr("selected", true);
	                        		})
	                        		$(function(){
	                        			$("option[value=${m.jobCode}]").attr("selected", true);
	                        		})
                                </script>
                                <br>
                                <table>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">아이디</th>
                                        <td>&nbsp;<input type="text" name="memId" style="width: 70%;" value=${ m.memId }></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">전화번호</th>
                                        <td>&nbsp;<input type="text" name="memPhone" value="${ m.memPhone }" style="width: 70%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">이메일</th>
                                        <td>&nbsp;<input type="text" name="memEmail" value="${ m.memEmail }" style="width: 70%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">생년월일</th>
                                        <td>&nbsp;<input type="text" name="memBirth" value="${ m.memBirth }"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">거주지</th>
                                        <td>&nbsp;<input type="text" name="memPostalCode" value=${ m.memPostalCode } style="width: 40%;">&nbsp;&nbsp;<button type="button" class="btn su_btn_border" style="height: 30px; padding-left: 12; padding-right: 12; padding-top: 0; padding-bottom: 0;">우편번호검색</button></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;"></th>
                                        <td>&nbsp;<input type="text" name="memPostalDetail" value=${ m.memPostalDetail } style="width: 70%;"></td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div style="width: 1000px;" align="center">
                                <button type="submit" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">수정하기</button>
                                <c:choose>
                                	<c:when test="${ empty m.memResignDate }">
                                		<button type="button" onclick=resignTeacher(${m.memNo}) class="btn su_btn_border" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 13%; height: 43px;">퇴사처리</button>
                                	</c:when>
                                	<c:otherwise>
                                		<button type="button" onclick=returnTeacher(${m.memNo}) class="btn su_btn_border" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 13%; height: 43px;">복직처리</button>
                                	</c:otherwise>
                                </c:choose>
                                
                            </div>
                            </form>
                            
                            <script>
                            	function resignTeacher(memNo){
                            		$.ajax({
                            			url:'resign.te',
                            			method:'POST',
                            			data:{'memNo':memNo},
                            			success:function(result){
                            				if(result=="success"){
                            					alert('퇴사처리성공')
                            					location.href="list.te"
                            				}else{
                            					alert('퇴사처리실패')
                            					console.log('실패')
                            				}
                            			},error:function(){
                            				alert('퇴사처리애러')
                            				console.log('애러')
                            			}
                            		})
                            	}
                            </script>
                            
                            <br><br>
                            <h3 class="su_sub_menu_name">비밀번호 초기화</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <div>
                                <table style="width: 60%;">
                                    <tr>
                                        <th style="background-color: #e6e9ec;">비밀번호 초기화</th>
                                        <td>&nbsp;<input type="text" style="width: 70%;" value="1111"></td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div style="width: 1000px;" align="center">
                                <button type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">초기화</button>    
                            </div>
                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div>	
	
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>