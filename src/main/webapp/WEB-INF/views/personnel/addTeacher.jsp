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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	select {
            width: 200px; 
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
</style>
</head>
<body>
	
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../personnel/personnelCss.jsp" />
	
	<!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <jsp:include page="../personnel/personnelSidebar.jsp" />
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header" style="margin-left: 10px;">
                            <h3 class="su_sub_menu_name">강사 등록하기</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            
                            <form style="display: none;">
                            	<input type="file" id="profileImgFile" >
                            	<button type="reset" id=fileReset></button>
                            </form>
                            
                            <form action="personnelAdd.pe" method="post">
                            <div style="height: 200px; width: 1000px; " align="center">
                                <img id="Profile" name="Profile" src="resources/profile_images/defaultProfile.png" width="25%" height="100%" onclick="$('#profileImgFile').click();">
                            	<input type="text" id="memProfile" name="memProfile" style="display: none;" >    
                            </div>
                            <br>
                            <div align='center'>
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
                            
                            <br>
                            <div style="width: 850px; ">
                                <table width="100%">
                                
                                    <tr>
                                        <th style="background-color: #e6e9ec;">이름</th>
                                        <td>
                                            <input type="text" name="memName" style="width: 40%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">부서</th>
                                        <td>
                                            <select name="deptCode" id="select1">
                                            	
                                            		<option value="D0">강사</option>
                                            	
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">직급</th>
                                        <td>
                                            <select name="jobCode" id="select1">
                                                
                                            		<option value="J0">강사</option>
                                            	
                                            </select>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">입사일</th>
                                        <td>
                                            <input type="date" name="memEnrollDate">  
                                        </td>
                                    </tr>
                                    
                                </table>
                                
                                <br>
                                <table>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">아이디</th>
                                        <td>&nbsp;<input type="text" name="memId" style="width: 70%;"></td>
                                        <td style="display: none;">&nbsp;<input type="text" name="memPwd" value="1111" ></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">전화번호</th>
                                        <td>&nbsp;<input type="text" name="memPhone"  style="width: 70%;"></td>
                                        <td style="display: none;">&nbsp;<input type="text" name="memBusinessnum"   value="1111"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">이메일</th>
                                        <td>&nbsp;<input type="text" name="memEmail"  style="width: 70%;"></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">생년월일</th>
                                        <td>&nbsp;<input type="date" name="memBirth" ></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">우편번호</th>
                                        <td>&nbsp;<input type="text" id="sample6_postcode" name="memPostalCode" style="width: 40%;">&nbsp;&nbsp;<button type="button" class="btn su_btn_border" style="height: 30px; padding-left: 12; padding-right: 12; padding-top: 0; padding-bottom: 0;" onclick=address();>우편번호검색</button></td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">주소</th>
                                        <td>
                                        	&nbsp;<input type="text" id="sample6_address" name="memPostalAd"  style="width: 70%;">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th style="background-color: #e6e9ec;">상세주소</th>
                                        <td> 
                                        	&nbsp;<input type="text" id="sample6_detailAddress" name="memPostalDetail"style="width: 50%;">&nbsp;<input type="text" id="sample6_extraAddress" name="memPostalRefer" value="${ m.memPostalRefer }" style="width: 40%;">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <br>
                            <div style="width: 1000px;" align="center">
                                <button type="submit" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">등록하기</button>
                            </div>
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
                            
                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div>
	
	<jsp:include page="../common/footer.jsp" />

</body>
</html>