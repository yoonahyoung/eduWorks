<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- css  -->
<link href="${pageContext.request.contextPath}/resources/css/sumin.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/administration.css" rel="stylesheet" type="text/css">

<title>학생 주소록 상세</title>
</head>
<body>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="container-fluid">

            <!-- 게시판 영역 -->
            <div class="ad_content_body">
                
                <div class="su_content_header">
                	<c:if test="${ not empty update }">
                		<h2 class="su_sub_menu_name">학생 주소록 수정</h2>
                	</c:if>
                	<c:if test="${ empty update }">
		            	<h2 class="su_sub_menu_name">학생 주소록 상세 조회</h2>
					</c:if>
					
		            <div class="su_btn_two_area">
		                <div class="su_left_area"><!-- 자리 채우기용 div --></div>
		                
		            </div>
		            <br>
	        	</div>
                
                <div class="boardArea">
                    <div class="addBookheader">
                        <h4>${ s.studentName }</h4>
                        <c:if test="${ update eq 1 }">
                        	<div>
			                    <button type="button" class="n-btn su_btn_border" onclick="updateSt();">수정완료</button>
			                </div>
                        </c:if>
                        <c:if test="${ empty update && loginUser.jobName ne '강사'}">
	                        <div>
			                    <button type="button" class="n-btn su_btn_border" onclick="location.href='listSt.ad'">목록으로</button>
			                </div>
		                </c:if>
		                <c:if test="${ loginUser.jobName eq '강사' }">
		                	<div>
			                    <button type="button" class="n-btn su_btn_border" onclick="location.href='listSt.te'">목록으로</button>
			                </div>
		                </c:if>
                    </div>
                    
                    <div class="addBookContent">
                        <div class="info-title">◆ 기본정보</div>
                        <!-- 수정삭제 버튼 -->
                        <c:if test="${ loginUser.jobName ne '강사' }"> <!-- 이거 두개 왜 || 문으로 안 이어지는...? -->
                        <c:if test="${ empty update }">
	                        <div class="detailDot">
	                            <ul class="navbar-nav ml-auto moDelte">
	                                <li class="nav-item dropdown no-arrow mx-1">
	                                    <a class="nav-link dropdown-toggle" href="#" id="dotDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" 
	                                        aria-expanded="false">
	                                        <i class="fas fa-ellipsis-v"></i>
	                                    </a>
	                                    <div class="dropdown-list dropdown-menu shadow" aria-labelledby="dotDropdown">
	                                        <a class="dropdown-item d-flex align-items-center" href="updateStForm.ad?no=${ s.studentNo }">
	                                            <span class="font-weight-bold">수정하기</span>
	                                        </a>
	                                    </div>
	                                </li>
	                            </ul>
	                        </div>
                        </c:if>
                        </c:if>
                        <table id="studentTable">
                            <tr>
                                <th>관리번호</th>
                                <td class="tdLine">${ s.studentNo }</td>
                                <th>등록일자 </th>
                                <td>${ s.studentEnDate }</td>
                            </tr>
                            <tr>
                                <th colspan="4"></th>
                            </tr>
                            <tr>
                                <th>성명</th>
	                                <c:if test="${ not empty update }">
		                                <td class="tdLine"><input type="text" id="studentName" value="${ s.studentName }"></td>
	                                </c:if>
	                                <c:if test="${ empty update }">
		                                <td class="tdLine">${ s.studentName }</td>
	                                </c:if>
                                <th>성별</th>
                                	<c:choose>
	                                	<c:when test="${ not empty update }">
			                                <td>
			                                	<select name="studentGender" id="studentGender">
			                                		<option value="M">남</option>
			                                		<option value="F">여</option>
			                                	</select>
			                                </td>
		                                </c:when>
		                                <c:otherwise>
			                                <c:if test="${ s.studentGender eq 'F' }">
				                                <td>여</td>
			                                </c:if>
			                                <c:if test="${ s.studentGender eq 'M' }">
				                                <td>남</td>
			                                </c:if>
		                                </c:otherwise>
                                    </c:choose>
                            </tr>
                            <tr>
                                <th colspan="4"></th>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <c:if test="${ not empty update }">
                                	<td class="tdLine"><input type="text" id="studentBirth" value="${ s.studentBirth }"></td>
                                </c:if>
                                <c:if test="${ empty update }">
                                	<td class="tdLine">${ s.studentBirth }</td>
                                </c:if>
                                <th>전화번호</th>
                                <c:if test="${ not empty update }">
                                	<td><input type="text" id="studentPhone" value="${ s.studentPhone }"></td>
                                </c:if>
                                <c:if test="${ empty update }">
                                	<td>${ s.studentPhone }</td>
                                </c:if>
                            </tr>
                            <tr>
                                <th colspan="4"></th>
                            </tr>
                        </table>
                    </div>
                    
					<c:if test="${ not empty list }">
	                    <div class="plusContent">
	                        <div class="info-title">◆ 추가정보</div>
	                        <div style="margin-left:50px"><b>수강내역</b></div>
	                        <table id="student-plus-table">
	                            <tr>
	                                <th width="50%">강의명</th>
	                                <th>시작일</th>
	                                <th>종료일</th>
	                                <th>수강료</th>
	                            </tr>
								<c:forEach var="c" items="${ list }" varStatus="status">
		                            <tr>
		                                <td>${ c.classTitle }</td>
		                                <td>${ c.classStartDate }</td>
		                                <td>${ c.classEndDate }</td>
		                                <td><span class="classFee${ status.index }" style="border:0px">${ c.classFee }</span></td>
		                            </tr>
		                		</c:forEach>
	                            <tr>
	                                <td></td>
	                                <td></td>
	                                <td></td>
	                                <td>합계 : <span id="totalFee" style="border:0px"></span> 원</td>
	                            </tr>
		                    </table>
		                </div>
                    </c:if>
                    <br><br>

                    <!-- 댓글 영역 -->
                    <div class="info-title">◆ 활동 이력</div>
                    <div class="su_board_reply" style="margin-left:40px; border:1px solid">
                        <!-- 댓글 하나의 영역 -->
                        <c:choose>
                        	<c:when test="${ empty cList }">
                        		<div class="su_reply_Barea">
                        			<div class="su_reply">
                        				현재 상담 이력이 없습니다
                        			</div>
                        		</div>
                        	</c:when>
                        	<c:otherwise>
                        		<c:forEach var="c" items="${ cList }">
                        			<div class="su_reply_Barea">
			                            <div class="su_reply">
			                                <div>
			                                    <img src="${pageContext.request.contextPath}/resources/profile_images/defaultProfile.png" alt="">
			                                </div>
			
			                                <div>
			                                    <div class="su_reply_writer">
			                                        <span class="font-weight-bold">${ c.cnslnReal }</span>
			                                        <span style="margin-right:10px">${ c.cnslnModifyDate }</span>
			                                    </div>
			                                    
			                                    <div class="su_reply_Bcontent">
			                                        <p>[${ c.cnslnTopic }] 에 대한 상담건 완료</p>
			                                    </div>
			                                </div>
			                            </div>
			                        </div>
                        		</c:forEach>
                        	</c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
    </div>
    
    <script>
    	$(function(){
    		// 총 수강료 구하기
    		let classFee = [];
    		let list = "${list}";
    		let totalFee = 0;
    		if(list != ''){
    			let length = ${fn:length(list)};
    			for(let i=0; i<length; i++){
    				classFee[i] = parseInt($(".classFee"+i).text().replace(/\,/g, ''));
    				totalFee += classFee[i];
    			}
    			$("#totalFee").html(totalFee.toLocaleString('ko-KR'));
    		}
    		
    		// 수정화면일 시 성별 checked옵션
    		let isUpdate = "${update}";
    		if(isUpdate == 1){ // 수정화면일 시
    			$("#studentGender").val("${s.studentGender}").attr("selected", true);
    		}
    	})
    	
    	function updateSt(){
    		$.ajax({
    			url:"updateSt.ad",
    			data:{
    				studentName:$("#studentName").val(),
    				studentGender:$("option:checked").val(),
    				studentPhone:$("#studentPhone").val(),
    				studentBirth:$("#studentBirth").val(),
    				studentNo:${s.studentNo}
    			},
    			success(result){
    				alert("수정되었습니다");
    				location.href='detailSt.ad?no=' + ${s.studentNo};
    			},
    			error(){
    				console.log("ajax통신 실패");
    			}
    		})
    	}
    </script>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>