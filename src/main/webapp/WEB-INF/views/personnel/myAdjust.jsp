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
                                <div style="width: 40%; height: 100%; float: left;">
                                    <div style="width: 100%; height: 90%;" align="center">
                                        <table style="border-collapse: separate; border-spacing: 0 10px;">
                                        	<thead>
                                            <tr  style="background-color: #e6e9ec;">
                                                <th style="width: 200px;">조정신청날짜</th>
                                                <th style="width: 150px;">처리상태</th>
                                            </tr>
                                            </thead>
                                            <c:choose>
                                            	<c:when test="${ empty list }">
                                            		<tr><th colspan="2">조회목록없음</th></tr>
                                            	</c:when>
                                            	<c:otherwise>
                                            		<tbody>
                                            			<c:forEach var="list" items="${ list }">
                                            				<tr>
                                            					<th>${ list.adjObjdate }</th>
                                            					<th>${ list.adjStatus }</th>
                                            				</tr>
                                            			</c:forEach>
                                            		</tbody>
                                            	</c:otherwise>
                                            </c:choose>
                                        </table>
                                    </div>
                                    <div style="width: 100%; height: 10%;" align="center">
                                        <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%; padding-top: 5px;">
                                            &lt;
                                        </span>
                                        <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                            1
                                        </span>
                                        <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                            2
                                        </span>
                                        <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                            3
                                        </span>
                                        <span style="width: 40px; height: 40px; background-color: #e6e9ec; display: inline-block; border-radius: 15%;padding-top: 5px;">
                                            &gt;
                                        </span>
                                    </div>
                                </div>
                                <div style="width: 60%; height: 100%; float: left; padding-left: 10%;">
                                    <table id="tab1">
                                        <tr>
                                            <th colspan="2"><h3>조정신청 세부내역</h3></th>
                                        </tr>
                                        <tr>
                                            <th>변경신청날짜</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>신청날짜 근태현황</th>
                                            <td><input type="text"></td>
                                        </tr>
                                        <tr>
                                            <th>조정 내용/사유</th>
                                            <td><textarea name="" id="" cols="30" rows="10" style="resize: none;"></textarea></td>
                                        </tr>
                                        <tr>
                                            <th>파일첨부</th>
                                            <td><input type="file"></td>
                                        </tr>
                                        <tr>
                                            <th colspan="2">
                                                <br>
                                                <button type="button" class="btn su_btn_border">수정하기</button>
                                            </th>
                                        </tr>
                                    </table>
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