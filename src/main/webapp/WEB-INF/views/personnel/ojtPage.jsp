<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
            height: 38px;
            width: 50px;
            border: 1px solid #cacece;
            border-radius : 5px;
            box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        #searchbtn:hover{
            background-color: #858796;
        }

        td, th{
            border: 1px solid #858796;
            border-left: none; 
            border-right: none;
            border-top: none; 
            padding: 0 0 5px 0;
        }

        .tb2 td,.tb2 th{
            padding: 10px;
        }
        
        .tb1 td,.tb1 th{
            border-bottom: none;
            font-size: 20px;
            font-weight: bold;
            color: black;
          
        }
        
        #pagebar a>span{
        	text-decoration: none;
        	color:black;
        }

        .positionab{
            position:absolute ;
            top: 0;
            padding: 30px;
        }
        .detailInfo{
            background-color: whitesmoke;
            width: 500px;
            height: 700px;
            left: 25%;
            z-index: 10;
            display:"";
            box-shadow: 10px 10px 20px grey;
        }

        .arrowL {
            position: relative;
        }

        .arrowL::after {
            position: absolute;
            left: -30px; 
            top: 0; 
            content: '';
            width: 25px;
            height: 25px; 
            border-top: 5px solid #000; 
            border-right: 5px solid #000; 
            transform: rotate(225deg);
        }

        .arrowR {
            position: relative;
        }

        .arrowR::after {
            position: absolute;
            left: 0; 
            top: 0; 
            content: '';
            width: 25px; 
            height: 25px; 
            border-top: 5px solid #000;
            border-right: 5px solid #000; 
            transform: rotate(45deg); 
        }

        .close {
        position:relative;
        display:inline-block;
        display:inline;
        width:50px;
        height:50px;
        text-align:center;
        margin-right:20px;
        
        }
        .close2:after {
        content: "\00d7"; 
        font-size:25pt;
        line-height:45px;
        }
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
                            <h3 class="su_sub_menu_name">수료여부조회</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            <form action="search.oj">
	                            <div style="width: 1000px; height: 60px;" class="checks" align="right" >
	                                <div style="float: right;  height: 70px;">
	                                    <button id="searchbtn" style="line-height: 0px; width: 70px;" class="btn su_btn_two su_btn_all">검색</button>
	                                 </div>
	                                <div style="height: 70px; float: right; padding-top: 3px;">
	                                    <input type="checkbox" id="check1" name="check1" checked> 
	                                    <label for="check1">수료자</label>
	                                    &nbsp;
	                                    <input type="checkbox" id="check2" name="check2" checked> 
	                                    <label for="check2">미수료자</label>
	                                    &nbsp;
	                                    <input type="checkbox" id="check3" name="check3" checked> 
	                                    <label for="check3">수료예정자</label>
	                                    &nbsp;&nbsp;
	                                    <input type="text" style="line-height: 30px; width: 200px; text-align: center" id="searchclick" name="keyword"  placeholder="이름으로 검색">
	                                    <label for="searchclick"></label>
	                                </div>
	                            </div>
                            </form>
                            
                            <c:if test="${ not empty searchck}">
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
               					<c:if test="${ check3 eq false }">
               						<script>
               							$('#check3').prop('checked',false)
               						</script>
               					</c:if>
               					<c:if test="${ check1 eq false and check2 eq false and check3 eq false }">
               						<script>
               							$('#check1').prop('checked',true)
               							$('#check2').prop('checked',true)
               							$('#check3').prop('checked',true)
               						</script>
               					</c:if>
               				</c:if>
                            
                            <div style="clear: both; width: 650px; margin-left: 150px;" class="checks">
                                <table width="100%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                    <tr>
                                        <th>
                                            <input type="checkbox" id="c1"> 
                                            <label for="c1" class="tblabel"></label>
                                        </th>
                                        <th>직원명</th>
                                        <th>부서</th>
                                        <th>직급</th>
                                        <th>수료일/수료예정일</th>
                                        <th>수료여부</th>
                                    </tr>
                                    <c:choose>
                                    	<c:when test="${ empty list }">
                                    		<tr>
                                    			<td colspan="6">조회된 목록이 없습니다.</td>
                                    		</tr>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:forEach var="o" items="${ list }">
                                    			<tr>
			                                        <th>
			                                            <input type="checkbox" class="userNo" id="c${ o.memNo }" value="${ o.memNo }"> 
			                                            <label for="c${ o.memNo }" class="tblabel"></label>
			                                            <input type="hidden" class="userNo2" value="${ o.memEmail }"> 
			                                        </th>
			                                        
			                                        <td align="center">${ o.memName }</td>
			                                        <td align="center">${ o.deptName }</td>
			                                        <td align="center">${ o.jobName }</td>
			                                        <td align="center"><c:out value="${ o.ojtDate }" default="--"></c:out></td>
			                                        <td align="center" class="status">
			                                        	<c:if test="${ o.ojtStatus eq 'Y' }">
			                                        		수료
			                                        	</c:if>
			                                        	<c:if test="${ o.ojtStatus eq 'N' }">
			                                        		미수료
			                                        	</c:if>
			                                        	<c:if test="${ o.ojtStatus eq 'W' }">
			                                        		수료예정
			                                        	</c:if>
			                                        	<input type="hidden" class="status2" value="${ o.ojtStatus }">
			                                        </td>
			                                    </tr>
                                    		</c:forEach>
                                    	</c:otherwise>
                                    </c:choose>
                                    
                                </table>
                            </div>
                            
                            <div style="display: none;">
                            	<table class="tb1">
	                                    <tr>
	                                        <td style="background-color: #e6e9ec; width: 100px;">&nbsp;제목</td>
	                                        <td>&nbsp;<input type="text" style="width: 70%;" id="cancelTitle" value="OJT일정취소 안내입니다."></td>
	                                    </tr>
	                                    <tr>
	                                        
	                                        <td colspan="2">&nbsp;<textarea id="cancelContent" cols="60" rows="10" style="resize: none;">OJT일정이 취소되었습니다. 추후에 다시 공지하겠습니다.</textarea></td>
	                                    </tr>
	                                    
	                             </table>
	                        </div>
                            
                            <script>
	                            $('#c1').on('click',function(){
	                        		if($('#c1').prop('checked')){
	                        			$('.userNo').prop('checked',true)
	                        		}else{
	                        			$('.userNo').prop('checked',false)
	                        		}
	                        	})
	                        	
	                        	
	                        	
                            </script>
                            
                            <div style="width: 650px; margin-left: 140px;">
                                <button type="button" onclick="complete()" style="width: 120px; height: 40px; font-size: 14.5px;" type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">수료완료처리</button>
                                <button type="button" onclick="cancel()" style="width: 170px; height: 40px; font-size: 14.5px;" type="button" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent">취소및취소메일보내기</button>
                            </div>
                            
                            <script>
                            	function emailTest(){
                            		let userEmail =[]
                            		let li = $('input[class="userNo"]:checked').siblings('.userNo2')
                            		$(li).each(function(){
                            			console.log($(this).val())
                            			userEmail.push($(this).val())
                                	})
                                	console.log(userEmail)
                            	}
                            	
                            	function cancel(){
                            		let userNo =[]
                            		let userEamil =[]
                            		let li = $('input[class="userNo"]:checked')
                            		if($(li).length==0){
                            			alert('지정된 직원이 없습니다.')
                            		}
                            		let result = 1
                            		$(li).each(function(){
                            			if($(this).parent().siblings('.status').children('.status2').val()!='W'){
                            				result = 0
                            			}
                                		userNo.push($(this).val())
                                		userEamil.push($(this).siblings('.userNo2').val())
                                	})
                                	console.log(userNo)
                                	console.log(userEamil)
                                	if(result>0){
                                		$.ajax({
                                			url:'cancel.oj',
                                			method:'POST',
                                			data:{'memNo':userNo,
                                			      'title':$('#cancelTitle').val(),
                                			      'content':$('#cancelContent').val(),
                                			      'memEmail':userEamil},
                                			success:function(result){
                                				if(result=="success"){
                                					alert('성공')
                                					location.href=location.href
                                				}else{
                                					alert('실패')
                                					console.log('실패')
                                				}
                                			},error:function(){
                                				alert('애러')
                                				console.log('애러')
                                			}
                                		})
                                	}else{
                                		alert('수료예정이 아닌 직원이 포함되어 있습니다.')
                                	}
                            	}
                            	
                            	function complete(){
                            		let userNo =[]
                            		let li = $('input[class="userNo"]:checked')
                            		if($(li).length==0){
                            			alert('지정된 직원이 없습니다.')
                            		}
                            		let result = 1
                            		$(li).each(function(){
                            			if($(this).parent().siblings('.status').children('.status2').val()!='W'){
                            				result = 0
                            			}
                                		userNo.push($(this).val())
                                	})
                                	console.log(userEmail)
                                	console.log(userNo)
                                	if(result>0){
                                		$.ajax({
                                			url:'complete.oj',
                                			method:'POST',
                                			data:{'memNo':userNo},
                                			success:function(result){
                                				if(result=="success"){
                                					alert('성공')
                                					location.href=location.href
                                				}else{
                                					alert('실패')
                                					console.log('실패')
                                				}
                                			},error:function(){
                                				alert('애러')
                                				console.log('애러')
                                			}
                                		})
                                	}else{
                                		alert('수료예정이 아닌 직원이 포함되어 있습니다.')
                                	}
                            	}
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
				                            		<a href="ojtMain.oj?p=${ pi.currentPage-1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                                </span>
					                                </a>
				                            	</c:when>
				                            	<c:otherwise>
				                            		<a href="search.oj?p=${ pi.currentPage-1 }&check1=${ check1 }&check2=${ check2 }&check3=${ check3 }&keyword=${ keyword }">
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
					                            		<a href="ojtMain.oj?p=${ p }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi.currentPage }">
					                            		<a href="ojtMain.oj?p=${ p }">
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
														<a href="search.oj?p=${ p }&check1=${ check1 }&check2=${ check2 }&check3=${ check3 }&keyword=${ keyword }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
													</c:if>
													<c:if test="${ p ne pi.currentPage }">
														<a href="search.oj?p=${ p }&check1=${ check1 }&check2=${ check2 }&check3=${ check3 }&keyword=${ keyword }">
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
				                            		<a href="ojtMain.oj?p=${ pi.currentPage+1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                                </span>
					                                </a>
				                            	</c:when>
				                            	<c:otherwise>
				                            		<a href="search.oj?p=${ pi.currentPage+1 }&check1=${ check1 }&check2=${ check2 }&check3=${ check3 }&keyword=${ keyword }">
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
                            
                            <br><br>
                            
                            <h3 class="su_sub_menu_name" data-toggle="modal" data-target="#myModals">OJT 일정메일 보내기 및 일정등록</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            <form action="sendOjt.oj">
                            	<div>
                            		<input type="hidden" id="memNos" name="memNos" value="">
                            		<input type="hidden" id="memEmail" name="memEmail" value="">
	                                <table class="tb1">
	                                    <tr>
	                                        <td style="width: 100px;">&nbsp;제목</td>
	                                        <td>&nbsp;<input type="text" style="width: 70%;" name="sendTitle" value="OJT일정 안내입니다."></td>
	                                    </tr>
	                                    <tr>
	                                        
	                                        <td colspan="2">&nbsp;<textarea name="sendContent" id="contents" cols="60" rows="10" style="resize: none;">OJT일정을 다음과같이 알려드립니다. 반드시 참석부탁드립니다.</textarea></td>
	                                    </tr>
	                                    <tr>
	                                        <td >&nbsp;OJT 요일</td>
	                                        <td>&nbsp;<input type="date" id="ojtdate" name="sendDate" required></td>
	                                    </tr>
	                                </table>
	                            </div>
	                            <br>
	                            <div style="width: 1000px;" align="center">
	                                <button type="submit" onclick="return test();" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 220px;">메일보내기 및 일정등록</button>
	                            </div>
                            </form>
                            <script>
                            	$('#ojtdate').on('change',function(){
                            		console.log($(this).val())
                            		let date1 = $(this).val()
                            		let str = date1.slice(0,4)+'년 '+date1.slice(5,7)+'월 '+date1.slice(8,10)+'일'
                            		console.log(str)
                            		
                            		$("#contents").val('OJT일정을 다음과같이 알려드립니다. 반드시 참석부탁드립니다.\r일시 : '+str)
                            	})
                            	
                            	
                            	
                            	function test(){
                            		let userNo =[]
                            		let userEmail =[]
                            		let li = $('input[class="userNo"]:checked')
                            		if($(li).length==0){
                            			alert('지정된 직원이 없습니다.')
                            			return false;
                            		}
                            		let result = 1
                            		$(li).each(function(){
                            			console.log($(this).parent().siblings('.status').children('.status2').val())
                            			if($(this).parent().siblings('.status').children('.status2').val()=='Y'){
                            				result = 0
                            			}
                                		userNo.push($(this).val())
                                		userEmail.push($(this).siblings('.userNo2').val())
                                	})
                                	console.log(userNo)
                                	console.log(userEmail)
                                	if(result>0){
                                		if(new Date($('#ojtdate').val())<new Date()){
                                			alert('오늘날짜보다 뒤로입력해주세요')
                                			return false;
                                		}else{
                                			$('#memNos').val(userNo)
                                			$('#memEmail').val(userEmail)
                                			return true;
                                		}
                                	}else{
                                		alert('이미 수료한 직원이 포함되어 있습니다.')
                                		return false;
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