<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#tab1>th,td{
		padding:7px
	}
	
	#pagebar a>span{
        	text-decoration: none;
        	color:black;
    }
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<jsp:include page="../personnel/personnelCss.jsp" />
	<!--Begin of Main Content -->
                <!-- Begin Page Content -->
                <div class="container-fluid" style="padding: 10px;">
                   
                    <div class="container-fluid su_contentArea" style="padding-left: 10px;">
                        <div class="su_content_header">
                            <h2 class="su_sub_menu_name">출퇴근관리</h2>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b;">

                            <div  style="margin-left: 10px; padding: 30px;  width: 1000px; height: 250px;" align="center">
                               <h3 class="date1"></h3> <br>
                                <h3 class="clock"></h3> <br>
                                <span>
                                    <button type="button" class="btn su_btn_border" id="submitIn">출근하기</button>
                                </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>
                                    <button type="button" class="btn su_btn_border" id="submitOut">퇴근하기</button>
                                </span>
                            </div>
                            <br>
                            
                            <script type="text/javascript">
                            	
                            	$('#submitIn').click(function(){
                            		let c = new Date();
  	                              	c.setHours(c.getHours() + 9)
  	                              	let c1 = c.toISOString();
	  	                            let date2 = c1.slice(0,10);
		                            let time2 = c1.slice(11,16);
		                            
		                            $.ajax({
		                            	url: 'submitIn.me',
                           				type: 'POST',
                           				data: {
                           					inDate : date2,
                           					inTime : time2
                           				},
                           				success: function(result) {
                           					if(result=='success'){
                           						alert('출근처리완료')
                           						location.reload();
                           					}else if(result='errors'){
                           						alert('이미출근하였습니다.')
                           					}else{
                           						alert('출근처리실패')
                           					}
                           				},error:function(){
                           					console.log('error')
                           				}
		                            })
                            	})
                            	
                            	$('#submitOut').click(function(){
                            		let c = new Date();
  	                              	c.setHours(c.getHours() + 9)
  	                              	let c1 = c.toISOString();
	  	                            let date2 = c1.slice(0,10);
		                            let time2 = c1.slice(11,16);
		                            
		                            $.ajax({
		                            	url: 'submitOut.me',
                           				type: 'POST',
                           				data: {
                           					outDate : date2,
                           					outTime : time2
                           				},
                           				success: function(result) {
                           					if(result=='success'){
                           						alert('퇴근처리완료')
                           						location.reload();
                           					}else if(result=='none'){
                           						alert('아직출근전입니다.')
                           					}else if(result=='zzz'){
                           						alert('이미퇴근하였습니다.')
                           					}else{
                           						alert('퇴근처리실패')
                           					}
                           				},error:function(){
                           					console.log('error')
                           				}
		                            })
                            	})
                            	
                            </script>
                            
                            <script>
                            	$(function(){
                            		const clock = $(".clock");
                            		const date = $('.date1');
                            		
    	                            function dateClock(){
    	                              let d2 = new Date();
    	                              d2.setHours(d2.getHours() + 9)
    	                              let d3 = d2.toISOString();
    	                              //console.log(d3) //2022-09-18T20:48:07.964Z
    	                              let date1 = d3.slice(0,10);
    	                              let time = d3.slice(11,19);
    	                              let week = new Array('일', '월', '화', '수', '목', '금', '토');
    	                              let day = week[d2.getDay()]
    	                              clock.text(time)
    	                              date.text(date1+'('+day+")")
    	                            }
    	                            
    	                            dateClock();
    	                            setInterval(dateClock, 1000);
                            	})
                            	
                            </script>

                            <div style="float: left;">
                                <h2 class="su_sub_menu_name">조정신청내역</h2>
                            </div>
                            <form action="AttManage.me">
                            <div style="float: right;">
                                <button type="submit" class="btn su_btn_border">근무내역관리</button>
                            </div>
                            </form>
                            
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b; clear: both;">

                            <div  style="margin-left: 10px; padding-top: 30px;  width: 1000px; height: 500px; " >
                                <div class="tt1" style="width: 40%; height: 100%; float: left;">
                                    <div style="width: 100%; height: 90%;" align="center">
                                        <table id="tab1" style="border-collapse: separate; border-spacing: 0 10px;">
                                        	<c:if test="${ not empty list }">
                                        	<thead>
                                            <tr  style="background-color: #e6e9ec;">
                                                <th style="width: 200px;">조정신청날짜</th>
                                                <th style="width: 150px;">처리상태</th>
                                            </tr>
                                            </thead>
                                            </c:if>
                                            <c:choose>
                                            	<c:when test="${ empty list }">
                                            		<h2>조회목록없음</h2>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<tbody id="tab3">
                                            			<c:forEach var="list" items="${ list }">
                                            				<tr>
                                            					<th>${ list.adjDate }</th>
                                            					<th>
                                            						<c:choose>
                                            							<c:when test="${ list.adjStatus eq 'W' }">처리대기</c:when>
                                            							<c:when test="${ list.adjStatus eq 'A' }">승인</c:when>
                                            							<c:when test="${ list.adjStatus eq 'D' }">거절</c:when>
                                            						</c:choose>
                                            					</th>
                                            					<th id="sel0" style="display: none;">${ list.attStatus }</th>
                                            					<th id="sel1" style="display: none;">${ list.attHstatus }</th>
                                            					<th id="sel2" style="display: none;">${ list.adjObjdate }</th>
                                            					<th id="sel3" style="display: none;">${ list.adjReason }</th>
                                            					<th id="sel4" style="display: none;">${ list.adjStatus }</th>
                                            					<th id="sel5" style="display: none;">${ list.adjFile }</th>
                                            					<th id="sel6" style="display: none;">${ list.adjNo }</th>
                                            				</tr>
                                            			</c:forEach>
                                            		</tbody>
                                            	</c:otherwise>
                                            </c:choose>
                                        </table>
                                      </div>
                                     
                                        <script>
                                        	$('#tab3>tr').on('click',function(){
                                        		
                                        		$('#tab2').css('display','')
                                        		$('.alls').val('')
                                        		
                                        		$('#adjNo').val($(this).children('#sel6').text())
                                        		$('#date1').val($(this).children('#sel2').text())
                                        		$('#content1').val($(this).children('#sel3').text())
                                        		if($(this).children('#sel4').text()!='W'){
                                        			$('#content1').attr('readonly',true)
                                        		}else{
                                        			$('#content1').attr('readonly',false)
                                        			console.log('readonly')
                                        		}
                                        		if($(this).children('#sel0').text()=='D'){
                                        			$('#status').val('정상')
                                        		}else if($(this).children('#sel0').text()=='E' || $(this).children('#sel0').text()=='L'){
                                        			$('#status').val('무단지각/무단결석')
                                        		}else if($(this).children('#sel0').text()=='H' || $(this).children('#sel1').text()=='H0'){
                                        			$('#status').val('종일연차')
                                        		}else if($(this).children('#sel0').text()=='H' || $(this).children('#sel1').text()=='H1'){
                                        			$('#status').val('오전연차')
                                        		}else if($(this).children('#sel0').text()=='H' || $(this).children('#sel1').text()=='H2'){
                                        			$('#status').val('오후연차')
                                        		}else{
                                        			$('#status').val('무단결근')
                                        		}
                                        		if($(this).children('#sel4').text()=='D'){
                                        			$('#reason').val($(this).children('#sel3').text())
                                        			$('#reasontr').css('display','')
                                        		}else{
                                        			$('#reasontr').css('display','none')
                                        		}
                                        		if($(this).children('#sel4').text()=='W' ){
                                        			$('#adjFile').attr('href',$(this).children('#sel5').text())
                                        			$('#inputf').css('display','')
                                        		}else{
                                        			$('#inputf').css('display','none')
                                        		}
                                        		if($(this).children('#sel5').text()!=''){
                                        			$('#readf').css('display','')
                                        		}else{
                                        			$('#readf').css('display','none')
                                        		}
                                        		if($(this).children('#sel4').text()=='W'){
                                        			$('#rebtn').css('display','')
                                        		}else{
                                        			$('#rebtn').css('display','none')
                                        		}
                                        		$('#adjFile').attr('href',$(this).children('#sel5').text())
                                        	})
                                        </script>
                                        
                                    
                                    <c:choose>
                            	<c:when test="${ empty list }">
                            	
                            	</c:when>
                            	<c:otherwise>
                            		<div style="margin-top: 10px; width: 350px; height: 40px;" align="center" id="pagebar">
			                            <c:if test="${ pi.currentPage ne 1 }">
				                           <a href="adjust.me?p=${ pi.currentPage-1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &lt;
						                                </span>
					                                </a>
				                        </c:if>
			                            	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					                            	<c:if test="${ p eq pi.currentPage }">
					                            		<a href="adjust.me?p=${ p }">
							                                <span style="width: 40px; height: 40px; background-color: #5e7e9b; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
					                            	<c:if test="${ p ne pi.currentPage }">
					                            		<a href="adjust.me?p=${ p }">
							                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
							                                    ${ p }
							                                </span>
					                                	</a>
					                            	</c:if>
							                    	
							                  	</c:forEach>	
											
							         	<c:if test="${ pi.currentPage ne pi.maxPage }">
				                            		<a href="adjust.me?p=${ pi.currentPage+1 }">
						                                <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
						                                    &gt;
						                                </span>
					                                </a>
			                            </c:if>
			                            	
			                                
			                            </div>
                            	</c:otherwise>
                            </c:choose>
                            
                            </div>
                                <div style="width: 60%; height: 100%; float: left; padding-left: 10%;">
                                <form id='forms1' action="modifyAdj.me" method="post" enctype="multipart/form-data">
                                	<input type="hidden" name="userNo" id="adjNo">
                                    <table id="tab2" style="display: none;">
                                        <tr>
                                            <th colspan="2"><h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조정신청 세부내역</h3></th>
                                        </tr>
                                        <tr>
                                            <th>변경신청날짜</th>
                                            <td><input id="date1" class="all" type="text" readonly="readonly"></td>
                                        </tr>
                                        <tr>
                                            <th>신청날짜 근태현황</th>
                                            <td><input id="status" class="alls"  type="text" readonly="readonly"></td>
                                        </tr>
                                        <tr>
                                            <th>조정내용/사유</th>
                                            <td><textarea name="reason" class="alls"  id="content1" cols="30" rows="10" style="resize: none;" readonly="readonly" required="required"></textarea></td>
                                        </tr>
                                        <tr id="reasontr" style="display: none;">
                                        	<th>거절사유</th>
                                            <td><textarea name="" class="alls"  id="reason" cols="30" rows="10" style="resize: none;" readonly="readonly" ></textarea></td>
                                       	<tr id="inputf" style="display: none;">
                                        	<th>파일첨부</th>
                                        	<td><input id="infile" name="upfile" type="file" class="alls" ></td>
                                        </tr>
                                        <tr id="readf" style="display:none;">	
                                        	<th>첨부파일</th>
                                        	<td><a id="adjFile" href="" download>첨부파일</a></td>
                                        </tr>
                                        <tr id="rebtn" style="display: none;">
                                            <th colspan="2">
                                                <br>
                                                <button type="submit" class="btn su_btn_border">수정하기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="button" onclick="deleteAdj()" class="btn su_btn_border">삭제하기</button>
                                            </th>
                                        </tr>
                                    </table>
                                </form>
                                </div>
                                
                                <script type="text/javascript">
                                	function deleteAdj(){
                                		$('#forms1').attr('action','deleteAdj.me');
                                		$('#forms1').submit();
                                	}
                                </script>
                                
                            </div>
                            </div>
                            <br style="clear: both;">
                            
                            

                        </div>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div> 
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>