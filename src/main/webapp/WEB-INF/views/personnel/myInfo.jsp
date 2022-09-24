<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../personnel/personnelCss.jsp" />
		<!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid" style="padding: 10px;">
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header">
                            <h2 class="su_sub_menu_name">인사정보</h2>
                            <br><br>
						
                            <h3 class="su_sub_menu_name">개인정보관리</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            
                            <form style="display: none;">
                            	<input type="file" id="profileImgFile" >
                            	<button type="reset" id=fileReset></button>
                            </form>
                            
                            <form action="updateMyInfo.me">
                            <div  style="margin-left: 10px; padding: 10px;  width: 600px; height: 250px;">
                                <div style="width: 40%; height: 100%; float: left; padding-top: 25px;"  align="center">
                                    <c:choose>
	                            		<c:when test="${ empty m.memProfile }">
	                            			<img id="Profile" name="Profile" src="resources/profile_images/defaultProfile.png" width="80%" height="80%" onclick="$('#profileImgFile').click();">
	                            		</c:when>
	                            		<c:otherwise>
	                            			<img id="Profile" name="Profile" src="${ m.memProfile }" width="80%" height="80%" onclick="$('#profileImgFile').click();">
	                            		</c:otherwise>
                            		</c:choose>
                            		<br>
                            		<input type="text" id="memProfile" name="memProfile" value="${ m.memProfile }" style="display: none;" >    
                            		<button type="button" class="btn su_btn_border" style="height: 30px; padding-left: 12; padding-right: 12; padding-top: 0; padding-bottom: 0;" onclick=defaultProfile(${m.memNo})>기본사진</button>   
                                </div>
                                
                                <script>
					            	$(function(){
					            		$("#profileImgFile").change(function(){
					            			
					            			let formData = new FormData();
					            			
					            			let uploadFile = this.files[0]; 
					            			console.log(uploadFile);
					            			
					            			formData.append("uploadFile", uploadFile); 
					            			
					            			$.ajax({
					            				url: "previewProfile.cm", 
					            				data: formData,
					            				contentType: false,
					            				processData: false,
					            				type: "POST",
					            				success: function(result){
					            					console.log('result:'+result)
					            					if(result=='none'){
					            						console.log('none')
					            					}else{
					            						$('#Profile').attr("src",result)
					            						$('#memProfile').attr("value",result)
					            					}
					            					
					            				},
					            				error:function(){
					            					console.log("ajax fail");
					            				}
					            			})	
					            		})
					            	})
					            	
					            	$(function(){
					            		console.log("주소"+"${memProfile}")
					            	})
					            	
					            	function defaultProfile(memNo){
					            		$('#Profile').attr("src","resources/profile_images/defaultProfile.png")
	            						$('#memProfile').attr("value","")
	            						$("#fileReset").click()
					            	}
				            	
				            	</script>
                            	
                                <div style="width: 60%; height: 100%; padding-top: 25px; float: left;">
                                	<input type="hidden" name="memNo" value="${ m.memNo }">
                                	<input type="hidden" name="memPwd" value="${ m.memPwd }">
                                    <table style="width: 80%; height: 80%;" align="center" border="1px  ">
                                        <tr>
                                            <th style="background-color: #e6e9ec;">이름</th>
                                            <td>&nbsp;
                                            	${ m.memName }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="background-color: #e6e9ec;">부서</th>
                                            <td>&nbsp;
                                            	<c:forEach var="d" items="${ dlist }">
                                            		<c:if test="${ d.deptCode eq m.deptCode }">
                                            			${ d.deptName }
                                            		</c:if>
                                            	</c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="background-color: #e6e9ec;">직급</th>
                                            <td>&nbsp;
                                            	<c:forEach var="j" items="${ jlist }">
                                            		<c:if test="${ j.jobCode eq m.jobCode }">
                                            			${ j.jobName }
                                            		</c:if>
                                            	</c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="background-color: #e6e9ec;">입사일</th>
                                            <td>&nbsp;
                                            	${ m.memEnrollDate }
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="background-color: #e6e9ec;">퇴사일</th>
                                            <td>&nbsp;
                                            	<c:if test="${ not empty m.memResignDate }">${ m.memResignDate }</c:if>
                                            	<c:if test="${ empty m.memResignDate }">--</c:if>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </div>
                            </div>

                            
                            
                            <div  style="margin-left: 10px; padding: 10px; padding-top: 0px;  width: 800px; height: 330px; clear: both;">
                                <table style="width: 100%; height: 100%;" align="center" border="1px solid ">
                                    <tr>
                                        <th style="background-color: #e6e9ec;">아이디</th>
                                        <td>&nbsp;<input type="text" name="memId" style="width: 70%;" value="${ m.memId }"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">전화번호</th>
                                        <td>&nbsp;<input type="text" name="memPhone" style="width: 70%;" value="${ m.memPhone }"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">이메일</th>
                                        <td>&nbsp;<input type="text" name="memEmail" style="width: 70%;" value="${ m.memEmail }" readonly></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">생년월일</th>
                                        <td>&nbsp;<input type="text" name="memBirth" style="width: 35%;" value="${ m.memBirth }"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">우편번호</th>
                                        <td>&nbsp;<input type="text" readonly style="width: 40%;" id="sample6_postcode" name="memPostalCode" value="${ m.memPostalCode }">&nbsp;&nbsp;<button type="button" class="btn su_btn_border" style="height: 30px; padding-left: 12; padding-right: 12; padding-top: 0; padding-bottom: 0;" onclick=address();>우편번호검색</button></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">주소</th>
                                        <td>&nbsp;<input type="text" readonly style="width: 70%;" id="sample6_address" name="memPostalAd" value="${ m.memPostalAd }"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">상세주소</th>
                                        <td>&nbsp;<input type="text" style="width: 60%;" id="sample6_detailAddress" name="memPostalDetail" value="${ m.memPostalDetail }" >&nbsp;<input type="text" style="width: 35%;" id="sample6_extraAddress" readonly name="memPostalRefer" value="${ m.memPostalRefer }"></td>
                                    </tr>
                                    
                                </table>
                            </div>
                            <br>
                            <div style="width: 1000px;" align="center">
                                <button type="submit" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">수정하기</button>
                            </div>
                            <br><br>
                            </form>
                            <script>
	                            function address(){
								    new daum.Postcode({
								        oncomplete: function(data) {
								        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
							                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							                var addr = ''; // 주소 변수
							                var extraAddr = ''; // 참고항목 변수

							                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							                    addr = data.roadAddress;
							                } else { // 사용자가 지번 주소를 선택했을 경우(J)
							                    addr = data.jibunAddress;
							                }

							                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							                if(data.userSelectedType === 'R'){
							                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
							                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
							                        extraAddr += data.bname;
							                    }
							                    // 건물명이 있고, 공동주택일 경우 추가한다.
							                    if(data.buildingName !== '' && data.apartment === 'Y'){
							                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
							                    }
							                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							                    if(extraAddr !== ''){
							                        extraAddr = ' (' + extraAddr + ')';
							                    }
							                    // 조합된 참고항목을 해당 필드에 넣는다.
							                    document.getElementById("sample6_extraAddress").value = extraAddr;
							                
							                } else {
							                    document.getElementById("sample6_extraAddress").value = '';
							                }

							                // 우편번호와 주소 정보를 해당 필드에 넣는다.
							                document.getElementById('sample6_postcode').value = data.zonecode;
							                document.getElementById("sample6_address").value = addr;
							                // 커서를 상세주소 필드로 이동한다.
							                document.getElementById("sample6_detailAddress").focus();
								        }
								    }).open();
	                            }
							</script>

                            <h3 class="su_sub_menu_name">비밀번호변경</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            
                            <form action="changePw.me" method="post">
                            <div  style="margin-left: 10px; padding: 10px; padding-top: 0px;  width: 600px; height: 150px; clear: both;">
                                <table style="width: 100%; height: 100%;" align="center" border="1px solid ">
                                    <tr>
                                        <th style="background-color: #e6e9ec;">현재비밀번호</th>
                                        <td>&nbsp;<input type="password" name="a" id="aa" style="width: 90%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">변경할 비밀번호</th>
                                        <td>&nbsp;<input type="password" name="pwd" id="bb" style="width: 90%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">변경할 비밀번호확인</th>
                                        <td>&nbsp;<input type="password" name="c" id="cc" style="width: 90%;"></td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div style="width: 1000px;" align="center">
                                <button type="submit" onclick="return test1();" class="btn su_btn_two su_btn_all" id="submitBtn" >변경하기</button>
                            </div>
                            </form>
							
                            <script>
                            	function test1(){
                            		let a = $('#aa').val()
                            		let b = $('#bb').val()
                            		let c = $('#cc').val()
                            		let pwd = '${loginUser.memPwd}'
                            		if(a!=pwd){
                            			alert('현재비밀번호가 다릅니다.')
                            			return false;
                            		}else if(b!=c){
                            			alert('변경할 비밀번호가 다릅니다')
                            			return false;
                            		}else{
                            			return true;
                            		}
                            	}
                            </script>    

                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>