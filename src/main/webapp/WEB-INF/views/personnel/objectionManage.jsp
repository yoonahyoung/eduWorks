<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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

        .td4 {
            width: 100%;
            border: 1px solid #858796;
            border-collapse: collapse;
        }
        
        
        .tb3{
            width: 100%;
            border: 1px solid white;
            border-collapse: collapse;
        }

        .tb3 th, .tb3 td{
            border: 1px solid white;
            padding: 10px;
        }

        .tb3 th{width: 10%; height: 50px;}
        .tb3 td{width: 90%; height: 50px;}
        
        .tb1 th{width: 33%;}
        .tb1 th, .tb1 td{
            padding: 10px;
            font-size: 18px;
        }

        .tb5 td, .tb5 th{
            border: 1px solid #858796;
            border-left: none; 
            border-right: none;
            border-top: none; 
            padding: 0 0 5px 0;
        }

        .tb6{
            
            border-collapse: collapse;
        }
        .tb6 td,.tb6 th{
            border: 0;
            padding:2px;
        }
        .tb6 th{width: 40%;}
        .positionab{
            position:absolute ;
            top: 0;
            padding: 30px;
        }
        .detailInfo{
            background-color: whitesmoke;
            width: 500px;
            height: 600px;
            left: 25%;
            z-index: 10;
           
            box-shadow: 10px 10px 20px grey;
        }
         .checks2 {position: relative;}
        .checks2 input[type="radio"] {
        position: absolute;
        width: 1px;
        height: 1px;
        padding: 0;
        margin: -1px;
        overflow: hidden;
        clip:rect(0,0,0,0);
        border: 0;
        }
        .checks2 input[type="radio"] + label {
        display: inline-block;
        position: relative;
        padding-left: 27px;
        cursor: pointer;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        }
        .checks2 input[type="radio"] + label:before {
        content: '';
        position: absolute;
        left: 1px;
        top: 1px;
        width: 21px;
        height: 21px;
        text-align: center;
        background: #fafafa;
        border: 1px solid #cacece;
        border-radius: 100%;
        box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
        }
        .checks2 input[type="radio"] + label:active:before,
        .checks2 input[type="radio"]:checked + label:active:before  {
        box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
        }
        .checks2 input[type="radio"]:checked + label:before {
        background: #E9ECEE;
        border-color: #adb8c0;
        }
        .checks2 input[type="radio"]:checked + label:after {
        content: '';
        position: absolute;
        top: 5px;
        left: 5px;
        width: 13px;
        height: 13px;
        background: #99a1a7;
        border-radius: 100%;
        box-shadow: inset 0px 0px 10px rgba(0,0,0,0.3);
        }
        #pagebar a>span{
        	text-decoration: none;
        	color:black;
        }

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
                            <h3 class="su_sub_menu_name">조정신청내역</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            
                            <br>
                            <div style="width: 850px; " >
                            	<form id="form1" action="search.ad">
                            		<div align="right">
                            				<input type="checkbox" id="cek1" name="check1" style="zoom: 1.5; vertical-align: middle;" checked>
                                            <label for="cek1" style="color:black; font-weight:500 ;">처리대기</label>
                                            &nbsp;
                                            <input type="checkbox" id="cek2" name="check2" style="zoom: 1.5; vertical-align: middle;" >
                                            <label for="cek2" style="color:black; font-weight:500 ;">처리완료</label>
                                	</div>
                                </form>
                                
                                <c:if test="${ not empty at }">
                                	<c:if test="${ at.check1 eq false }">
                                		<script>
                                			$('#cek1').prop('checked',false)
                                		</script>
                                	</c:if>
                                	<c:if test="${ at.check2 eq true }">
                                		<script>
                                			$('#cek2').prop('checked',true)
                                		</script>
                                	</c:if>
                                </c:if>
                                	
                                <script>
                                	$('#cek1').on('change',function(){
                                		if($('#cek1').prop('checked')==false && $('#cek2').prop('checked')==false){
                                			alert('적어도 한개는 선택해야 합니다.')
                                			$('#cek1').prop('checked',true)
                                		}else{
                                			$('#form1').submit();
                                		}
                                	})
                                	$('#cek2').on('change',function(){
                                		if($('#cek1').prop('checked')==false && $('#cek2').prop('checked')==false){
                                			alert('적어도 한개는 선택해야 합니다.')
                                			$('#cek2').prop('checked',true)
                                		}else{
                                			$('#form1').submit();
                                		}
                                	})
                                </script>
                                
                                <br>
                                <table id="table1" class="tb5" width="100%" style="border-collapse: separate; border-spacing: 0 10px; ">
                                    <thead>
                                    <tr>
                                        <th>신청날짜</th>
                                        <th>신청자 이름</th>
                                        <th>신청자 부서</th>
                                        <th>신청자 직급</th>
                                        <th>처리상태</th>
                                    </tr>
                                    </thead>
                                    <c:choose>
                                    	<c:when test="${ empty list }">
                                    		<th colspan="5">조회된 목록이 없습니다.</th>>
                                    	</c:when>
                                    	<c:otherwise>
                                    	<tbody>
                                    		<c:forEach var="list" items="${ list }">
                                    			<tr>
			                                        <td align="center">${ list.adjDate }</td>
			                                        <td class="memName" align="center">${ list.memName }</td>
			                                        <td align="center">${ list.deptName }</td>
			                                        <td align="center">${ list.jobName }</td>
			                                        <td align="center">
			                                        <c:choose>
			                                        	<c:when test="${ list.adjStatus eq 'W' }">처리대기</c:when>
			                                        	<c:when test="${ list.adjStatus eq 'A' }">승인</c:when>
			                                        	<c:otherwise>거절</c:otherwise>
			                                        </c:choose>
			                                        
			                                        </td>
			                                        <td class="sel0" style="display:none;">${ list.adjObjdate }</td>
			                                        <td class="sel1" style="display:none;">${ list.attStatus }</td>
			                                        <td class="sel4" style="display:none;">${ list.attHstatus }</td>
			                                        <td class="sel2" style="display:none;">${ list.adjReason }</td>
			                                        <td class="sel3" style="display:none;">${ list.adjFile }</td>
			                                        <td class="sel5" style="display:none;">${ list.deptCode }</td>
			                                        <td class="sel6" style="display:none;">${ list.jobCode }</td>
			                                        <td class="sel7" style="display:none;">${ list.adjNo }</td>
			                                        <td class="sel8" style="display:none;">${ list.adjStatus }</td>
			                                        <td class="sel9" style="display:none;">${ list.adjIn }</td>
			                                        <td class="sel10" style="display:none;">${ list.adjOut }</td>
			                                    </tr>
                                    		</c:forEach>
                                    	</tbody>
                                    	</c:otherwise>
                                    </c:choose>
                                    
                                </table>
                                <br>
                                
                            </div>
                            
                            <script>
                            	$(function(){
                            		$("#table1>tbody>tr").click(function(){
                            			
                            			$('#bigdiv').css("display",'')
                            			
                            			$('#adjObjdate').val($(this).children('.sel0').text())
                            			
                            			if($(this).children('.sel1').text()==''){
                            				$('#attStatus').val('무단결석')
                            			}else if($(this).children('.sel1').text()=='H'){
                            				let val = $(this).children('.sel4').text()
                            				switch(val){
                            				case 'H0' : $('#attStatus').val('연차'); break;
                            				case 'H1' : $('#attStatus').val('오전반차'); break;
                            				case 'H2' : $('#attStatus').val('오후반차'); break;
                            				}
                            			}else{
                            				let val = $(this).children('.sel1').text()
                            				switch(val){
                            				case 'D' : $('#attStatus').val('정상'); break;
                            				case 'L' : $('#attStatus').val('무단지각'); break;
                            				case 'E' : $('#attStatus').val('무단조퇴'); break;
                            				}
                            			}
                            			
                            			$('#adjReason').html($(this).children('.sel2').text())
										
                            			if($(this).children('.sel3').text()==''){
                            				$('#listfile').css('display','none')
                            			}else{
                            				$('#adjFile').attr('href',$(this).children('.sel3').text())
                            				$('#adjFile').text($(this).children('.sel3').text())
                            				$('#listfile').css('display','')
                            			}
                            			
                            			$('#adjNo2').val($(this).children('.sel7').text())
                            			console.log($(this).children('.sel6').text())
                            			let dcode = $(this).children('.sel5').text()
                            			let jcode = $(this).children('.sel6').text()
                            			let memName = $(this).children('.memName').text()
                            			let date = $(this).children('.sel0').text()
                            			let updateUrl = 'search.at?deptCode='+dcode+'&jobCode='+jcode+'&startDate='+date+'&endDate='+date+'&keyword='+memName+'&check1=on&check2=on&check3=on'
                            			$('#updateUrl').val(updateUrl)
                            			$('#con1').val($(this).children('.sel8').text())
                            			
                            			$('#adjIn').val($(this).children('.sel9').text())
                            			$('#adjOut').val($(this).children('.sel10').text())
                            		})
                            	})
                            </script>
                            
                            <br>
                            <c:choose>
                            	<c:when test="${ empty list }"></c:when>
                            	<c:otherwise>
                            	
		                            <div style="margin-top: 10px; width: 1000px; height: 40px;" align="center" id="pagebar">
		                            	<c:if test="${ pi.currentPage ne 1 }">
		                            		<c:choose>
				                            	<c:when test="${ empty searchck }">
				                            		<a href="objectionManage.ad?p=${ pi.currentPage-1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                                </span>
					                                </a>
				                            	</c:when>
				                            	<c:otherwise>
				                            		<a href="search.ad?p=${ pi.currentPage-1 }&check1=${ at.check1 }&check2=${ at.check2 }">
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
					                            		<a href="objectionManage.ad?p=${ p }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi.currentPage }">
					                            		<a href="objectionManage.ad?p=${ p }">
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
														<a href="search.ad?p=${ p }&check1=${ at.check1 }&check2=${ at.check2 }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
													</c:if>
													<c:if test="${ p ne pi.currentPage }">
														<a href="search.ad?p=${ p }&check1=${ at.check1 }&check2=${ at.check2 }">
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
				                            		<a href="objectionManage.ad?p=${ pi.currentPage+1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                                </span>
					                                </a>
				                            	</c:when>
				                            	<c:otherwise>
				                            		<a href="search.ad?p=${ pi.currentPage+1 }&check1=${ at.check1 }&check2=${ at.check2 }">
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
                            <br>
                            <div id="bigdiv" style="display:none">
                            <h3 class="su_sub_menu_name">조정신청 상세내역</h3>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                            <br>
                            <table class="tb1" style="width: 75%;">
                                <tr>
                                    <th style="background-color: #e6e9ec; width: 200px;">&nbsp;변경신청날짜</th>
                                    <td>&nbsp;<input id="adjObjdate" type="text" style="width: 85%; border:none" name="sendTitle" value="" readonly></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #e6e9ec; width: 200px;">&nbsp;신청날짜 근태현황</th>
                                    <td>&nbsp;<input id="attStatus" type="text" style="width: 85%;border:none" name="sendTitle" value="" readonly></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #e6e9ec; width: 200px;">&nbsp;요청출근시간</th>
                                    <td>&nbsp;<input id="adjIn" type="text" style="width: 85%;border:none" name="sendTitle" value="" readonly></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #e6e9ec; width: 200px;">&nbsp;요청퇴근시간</th>
                                    <td>&nbsp;<input id="adjOut" type="text" style="width: 85%;border:none" name="sendTitle" value="" readonly></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #e6e9ec; width: 200px;">&nbsp;조정내용/사유</th>
                                    <td>&nbsp;<textarea id="adjReason" style="resize: none; width: 85%; height: 120px;" readonly></textarea></td>
                                </tr>
                                <tr>
                                    <th style="background-color: #e6e9ec; width:200px ;">&nbsp;첨부파일</th>
                                    <td id="listfile" style="display: none">&nbsp;<a id="adjFile" href="" >첨부파일</a></td>
                                </tr>
                                <tr id="" style="display: none;">
                                    <td><input type="hidden" id="updateUrl"></td>
                                     <td><input type="hidden" id="con1" value=""></td>
                                     
                                </tr>
                            </table>
                            <div style="width: 1000px;" align="center">
                                    <button style="width: 200px" type="button" class="btn su_btn_two su_btn_all" id="updateAtt" data-toggle="modal" data-target="#noContent">상세보기 및 수정하기</button>
                            </div>
                            
                            <script>
                            	$("#updateAtt").click(function(){
                            		if($('#con1').val()=='W'){
                            			var openNewWindow = window.open("about:blank");
                                		openNewWindow.location.href = $('#updateUrl').val()
                            		}else{
                            			alert('이미 조정신청이 완료된 건입니다.')
                            		}
                            	})
                            </script>

                            <br><br>
                            <div style="position:relative ;">
                                <h3 class="su_sub_menu_name">조정신청 처리하기</h3>
                                <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">
                                <br>
                                <form id="forms" action="" method="post">
                                <input type="hidden" id="adjNo2" name='adjNo'>
                                <div style="width: 1000px;" align="center">
                                    <button type="button" class="btn su_btn_two su_btn_all" id="acceptBtn" data-toggle="modal" data-target="#noContent">승인 및 수정</button>
                                    <button type="button" class="btn su_btn_border" id="refuseBtn" data-toggle="modal" data-target="#noContent" style="width: 13%; height: 43px;">승인거절</button>
                                </div>

                                <div class="detailInfo positionab" id="div1" style="display: none; width: 550px; height: 380px;">
                                    <div  align="left" style="font-size: 25px; font-weight: bold; color: black;">거절사유 입력란</div>
                                    <br>

                                    <textarea name="adjDenycontent" id="adjDenycontent" style="width: 80%; height: 60%; resize: none;" ></textarea>

                                    <br><br>
                                    
                                    <div style="width: 98%;" align="center">
                                        <button style="width: 100px;" type="button" class="btn su_btn_two su_btn_all" id="cancelBtn1" data-toggle="modal" data-target="#noContent">취소</button>
                                        <button style="width: 100px;" type="button" class="btn su_btn_border" id="refuse" data-toggle="modal" data-target="#noContent" style="width: 13%; height: 43px;">승인거절</button>
                                    </div>
                                </div>
                                </form>
                                </div>
                                <script>
                                $(function(){
                                	$("#acceptBtn").click(function(){
 	                                	console.log($('#con1').val())
 	                            		if($('#con1').val()=='W'){
 	                            			$('#forms').attr('action', 'approve.ad');
 	                            			$('#forms').submit()
 	                            		}else if($('#con1').val()==''){
 	                            			alert('신청내역을 선택하세요.')
 	                            		}else{
 	                            			alert('이미 조정신청이 완료된 건입니다.')
 	                            		}
 	                            	})
 	                            	
 	                            	$('#refuseBtn').click(function(){
 	                            		if($('#con1').val()=='W'){
 	                            			$('#div1').css('display','')
 	                            		}else if($('#con1').val()==''){
 	                            			alert('신청내역을 선택하세요.')
 	                            		}else{
 	                            			alert('이미 조정신청이 완료된 건입니다.')
 	                            		}
 	                            	})
 	                            	
 	                            	$('#cancelBtn1').click(function(){
 	                            		$('#adjDenycontent').html('')
 	                            		$('#div1').css('display','none')
 	                            	})
 	                            	
 	                            	$('#refuse').click(function(){
 	                            		$('#forms').attr('action', 'refuse.ad');
	                            		$('#forms').submit()
 	                            	})
                                })
	                                
                                </script>
                                
                                <br><br><br><br><br><br><br><br><br><br>
                            </div>
                            
                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div> 
          <jsp:include page="../common/footer.jsp" />
</body>
</html>