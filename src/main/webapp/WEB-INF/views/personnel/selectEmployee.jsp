<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.checks {position: relative;}

        .checks input[type="checkbox"] {  
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip:rect(0,0,0,0);
        border: 0
        }
        .checks input[type="checkbox"] + label {
        display: inline-block;
        position: relative;
        cursor: pointer;
        
        }
        .checks input[type="checkbox"] + label:before {  
        content: ' ';
        display: inline-block;
        width: 21px; 
        height: 21px;  
        line-height: 21px; 
        margin: -2px 8px 0 0;
        text-align: center; 
        vertical-align: middle;
        background: #fafafa;
        border: 1px solid #cacece;
        border-radius : 3px;
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        .checks input[type="checkbox"] + label:active:before,
        .checks input[type="checkbox"]:checked + label:active:before {
        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
        }

        .checks input[type="checkbox"]:checked + label:before {  
        content: '\2714';  
        color: #99a1a7;
        text-shadow: 1px 1px #fff;
        background: #e9ecee;
        border-color: #adb8c0;
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
        }

        .checks input[type="text"]{
            background: #fafafa;
            border: 1px solid #cacece;
            border-radius : 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }

        #searchbtn{
            
            color: white;
            background-color: #5e7e9b;
            height: 38px;
            width: 50px;
            border: 1px solid #cacece;
            border-radius : 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        
        #outbtn{
            
            color: white;
            background-color: #5e7e9b;
            height: 38px;
            width: 50px;
            border: 1px solid #cacece;
            border-radius : 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        

        td, th{
            border: 1px solid #858796;
            border-left: none; 
            border-right: none;
            border-top: none; 
            padding: 0 0 5px 0;
        }
        
        #pagebar a>span{
        	text-decoration: none;
        	color:black;
        }
        
        select {
            width: 90px; 
            height: 30px;
            padding: 0em .5em; 
            font-family: inherit;  
            background: url(resources/images/selectimg.jpg) no-repeat 95% 50%;  
            border: 1px solid #999; 
            border-radius: 0px; 
            -webkit-appearance: none; 
            -moz-appearance: none;
            appearance: none;
        }
        
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
		<!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
					<jsp:include page="../personnel/personnelSidebar.jsp" />
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header" style="margin-left: 10px;">
                            <h3 class="su_sub_menu_name" style="color: black;">직원조회</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            <form action="search.em">
	                            <div style="width: 1000px; height: 60px;" class="checks" align="right" >
	                                <div style="float: right;  height: 70px;">
	                                    <button type="submit" id="searchbtn" style="line-height: 0px; width: 70px;" class="btn su_btn_two su_btn_all">검색</button>
	                                 </div>
	                                <div style="height: 70px; float: right; padding-top: 3px;">
	                                    <input type="checkbox" id="check1" name="check1" value=true checked> 
	                                    <label for="check1" >재직</label>
	                                    &nbsp;
	                                    <input type="checkbox" id="check2" name="check2" value=true checked> 
	                                    <label for="check2" >퇴사</label>
	                                    &nbsp;&nbsp;
	                                    <select name="deptCode" id="select1">
	                                    		<option value="all">전체</option>
                                            	<c:forEach var="d" items="${ dlist }">
                                            		<option value="${ d.deptCode }">${ d.deptName }</option>
                                            	</c:forEach>
                                        </select>
                                        <select name="jobCode" id="select2">
                                        		<option value="all">전체</option>
                                                <c:forEach var="j" items="${ jlist }">
                                            		<option value="${ j.jobCode }">${ j.jobName }</option>
                                            	</c:forEach>
                                        </select>
		                                    <input type="text" style="line-height: 30px; text-align:center;	 width: 200px;" name="keyword" id="searchclick" placeholder="   이름검색" value="${ keyword }">
		                                    <label for="searchclick"></label>
	                                    
	                                </div>
	                            </div>
                            </form>
                            
                            <!-- 검색내용이 있을경우 검색했던조건이 그대로 보여지게끔 처리 -->
                            <!-- 재직,퇴사 체크박스관련 -->
               				<c:if test="${ not empty check1 and not empty check2 }">
               					<c:if test="${ check1 eq false }">
               						<script>
               							$('#check1').prop('checked',false)
               						</script>
               					</c:if>
               					<c:if test="${ check2 eq false }">
               						<script>
               							$('#check2').prop('checked',false)
               						</script>
               					</c:if>
               					<c:if test="${ check1 eq false and check2 eq false }">
               						<script>
               							$('#check1').prop('checked',true)
               							$('#check2').prop('checked',true)
               						</script>
               					</c:if>
               				</c:if>
               				
               				<!-- 부서 select option관련 -->
               				<script>
	                        	$(function(){
	                        		$("option[value='${deptCode}']").attr("selected", true);
	                        	})
	                        </script>
                            
                            <!-- 직급 select option관련 -->
                            <c:if test="${ not empty jobCode }">
                            	<script>
	                            	$(function(){
	                            		$('#select2').val('${jobCode}')
	                            	})
                            		
                            	</script>
                            </c:if>
                            
                            <div style="clear: both; width: 650px; margin-left: 150px;" class="checks">
                                <table width="100%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                    <tr>
                                    	<!-- 전체선택,해제 체크박스 -->
                                        <th>
                                            <input type="checkbox" id="allcheck"> 
                                            <label for="allcheck" class="tblabel"></label>
                                        </th>
                                        <th>강사명</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>입사일/퇴사일</th>
                                        <th>상태</th>
                                    </tr>
                                    <c:choose>
                                    	<c:when test="${ empty list }">
                                    		<tr>
                                    			<th colspan="6">조회된 직원이 없습니다</th>
                                    		</tr>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="m" items="${ list }">
			                                    <tr>
			                                        <th>
			                                        	<!-- 개인용 체크박스 -->
			                                            <input type="checkbox" id="c${ m.memNo }" class="userNo" value="${ m.memNo }"> 
			                                            <label for="c${ m.memNo }" class="tblabel"></label>
			                                        </th>
			                                        <td align="center" onclick=empDe(${m.memNo})>${ m.memName }</td> <!-- 이름클릭시 그 직원 상세정보 페이지이동 -->
			                                        <td align="center">${ m.deptCode }</td>
			                                        <td align="center">${ m.jobCode }</td>
			                                        <td align="center">
			                                        	<c:if test="${ m.memResignStatus eq 'Y'  }"> 
			                                        		${ m.memResignDate }
			                                        	</c:if>
			                                        	<c:if test="${ m.memResignStatus eq 'N'  }">
			                                        		${ m.memEnrollDate }
			                                        	</c:if>
			                                        </td>
			                                        <td align="center">
			                                        	<c:if test="${ m.memResignStatus eq 'Y'  }"> 
			                                        		퇴사
			                                        	</c:if>
			                                        	<c:if test="${ m.memResignStatus eq 'N'  }">
			                                        		재직
			                                        	</c:if>
			                                        </td>
			                                    </tr>
		                                    </c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                    
                                </table>
                            </div>
                            
                            
                            <div style="width: 650px; margin-left: 140px;">
                                <button id="outbtn" style="line-height: 0px; width: 90px;" class="btn su_btn_two su_btn_all">퇴직처리</button>
                            </div>
                            
                            <script>
                            	// 특정직원클릭시 그 직원의 상세페이지로 이동
                            	function empDe(i){
                            		location.href="detail.em?no="+i
                            	}
                            	
                            	// 전체선택,해제 체크박스 기능
                            	$('#allcheck').on('click',function(){
                            		if($('#allcheck').prop('checked')){
                            			$('.userNo').prop('checked',true)
                            		}else{
                            			$('.userNo').prop('checked',false)
                            		}
                            	})
                            	
                            	// 퇴사버튼 클릭시 퇴사처리 ajax
                            	$('#outbtn').on('click',function(){
                            		let userNo =[]
                            		let li = $('input[class="userNo"]:checked')
                            		$(li).each(function(){
                                		userNo.push($(this).val())
                                	})
                                	// 선택한강사가 없을경우
                                	if(userNo.length==0){
                            			alert('선택강사없음')
                            		}
                                	else{
                                		$.ajax({
                                			url:'out.te',
                                			method:'POST',
                                			data:{'userNo':userNo},
                                			success:function(result){
                                				if(result=="success"){
                                					alert('퇴사처리성공')
                                					location.href=location.href
                                				}else{
                                					alert('퇴사처리실패')
                                					console.log('실패')
                                				}
                                			},error:function(){
                                				alert('퇴사처리실패')
                                				console.log('애러')
                                			}
                                		})
                                	}
                            		
                            
                            	})
                            </script>
                            <br>
                            <c:choose>
                            	<c:when test="${ empty list }">
                            	</c:when>
                            	<c:otherwise>
                            		<div style="margin-top: 10px; width: 1000px; height: 40px;" align="center" id="pagebar">
			                            <c:if test="${ pi.currentPage ne 1 }">
				                            <c:choose>
				                            	<c:when test="${ empty searchck }">
				                            		<a href="list.em?p=${ pi.currentPage-1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                                </span>
					                                </a>
				                            	</c:when>
				                            	<c:otherwise>
				                            		<a href="search.em?p=${ pi.currentPage-1 }&check1=${ check1 }&check2=${ check2 }&keyword=${ keyword }&deptCode=${ deptCode }&jobCode=${ jobCode }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                                </span>
			                                		</a>
				                            	</c:otherwise>
				                            </c:choose>
			                            </c:if>
			                            
			                            <c:choose>
				                            <c:when test="${ empty searchck }">
					                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					                            	<c:if test="${ p eq pi.currentPage }">
					                            		<a href="list.em?p=${ p }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi.currentPage }">
					                            		<a href="list.em?p=${ p }">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
							                    </c:forEach>	
											</c:when>
											<c:otherwise>
												<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
													<c:if test="${ p eq pi.currentPage }">
														<a href="search.em?p=${ p }&check1=${ check1 }&check2=${ check2 }&keyword=${ keyword }&deptCode=${ deptCode }&jobCode=${ jobCode }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
													</c:if>
													<c:if test="${ p ne pi.currentPage }">
														<a href="search.em?p=${ p }&check1=${ check1 }&check2=${ check2 }&keyword=${ keyword }&deptCode=${ deptCode }&jobCode=${ jobCode }">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
													</c:if>
												</c:forEach>	
											</c:otherwise>
							         	</c:choose>
							         	
							         	<c:if test="${ pi.currentPage ne pi.maxPage }">
				                            <c:choose>
				                            	<c:when test="${ empty searchck }">
				                            		<a href="list.em?p=${ pi.currentPage+1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                                </span>
					                                </a>
				                            	</c:when>
				                            	<c:otherwise>
				                            		<a href="search.em?p=${ pi.currentPage+1 }&check1=${ check1 }&check2=${ check2 }&keyword=${ keyword }&deptCode=${ deptCode }&jobCode=${ jobCode }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                                </span>
			                                		</a>
				                            	</c:otherwise>
				                            </c:choose>
			                            </c:if>
			                        </div>
                            	</c:otherwise>
                            </c:choose>
                            
                            
                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div> 
	<jsp:include page="../common/footer.jsp" />
	
</body>
</html>