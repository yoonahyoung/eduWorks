<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<style>
	td, th{
            border: 1px solid #858796;
            
            
            padding: 0 0 5px 0;
        }
        .tb6 td,.tb6 th{
            border: 0;
            padding:0px;
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
            height: 700px;
            left: 25%;
            z-index: 10;
           
            box-shadow: 10px 10px 20px grey;
        }

       
        .close {
        position:relative;
        display:inline-block;
        display:inline;
        width:50px;
        height:50px;
        text-align:center;
        
        
        }
        .close2:after {
        content: "\00d7"; 
        font-size:25pt;
        line-height:45px;
        }
        
        .fc-sun {color:#e31b23}
		.fc-sat {color:#007dc3}

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
                                    <button type="button" class="btn su_btn_border" onclick=submitIn();>출근하기</button>
                                </span>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span>
                                    <button type="button" class="btn su_btn_border"  onclick=submitOut();>퇴근하기</button>
                                </span>
                            </div>
                            <br>
                            
                            <script type="text/javascript">
                            	function submitIn(){
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
                           					console.log(result)
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
                            	}
                            	
                            	function submitOut(){
                            		let c = new Date();
                            		console.log(c.getHours())
                            		let re;
                            		if(c.getHours()<18){
                            			re = confirm('아직 퇴근시간(18시)전입니다.\n정말퇴근하시겠습니까?')
                            		}
                            		if(re){
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
	                           					console.log(result)
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
                            		}else{
                            			alert('퇴근취소')
                            		}
                            	}
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
                                <h2 class="su_sub_menu_name">근무내역관리</h2>
                            </div>
                            <form action="adjust.me">
                            <div style="float: right;">
                            	<input type="hidden" name="p" value="1">
                                <button type="submit" class="btn su_btn_border">조정신청현황</button>
                            </div>
                            </form>
                            <hr class="hr_line" style="border: 0px; height: 3px; width: 1000px; background-color: #5e7e9b; clear: both;">
                            <div style="margin-left: 10px; padding-top: 30px;  width: 1000px; height: 100px; position: relative;" >
                                <table style="width: 100%;">
                                    <tr>
                                        <th style="width: 33%;">정상</th>
                                        <th style="width: 33%;">지각/조퇴</th>
                                        <th style="width: 33%;">결근</th>
                                    </tr>
                                    <tr>
                                        <th id="d"></th>
                                        <th id="l"></th>
                                        <th id="f"></th>
                                    </tr>
                                </table>
                                <div class="detailInfo positionab" id="div1" style="display: none;">
                                    
                                            
                                    <div class="close close2"></div>
                                    
                                    
                                    <div  align="left" style="font-size: 25px; font-weight: bold; color: black;">근태조정신청</div>
                                    
                                    <br>
                                    <form action="adjForm.in" method="post" enctype="multipart/form-data"> 
                                    	<input type="hidden" name="deptCode" id="attNo" value="">
                                        <table style="width: 100%;" class="tb6" >
                                            <tr>
                                                <th>변경신청날짜</th>
                                                <td style="padding-bottom: 20px;">&nbsp;<input type="text" name="startDate" style="width:100%;" id="date1" readonly></td>
                                            </tr>
                                            <tr>
                                                <th>변경요청 출근시간</th>
                                                <td style="padding-bottom: 20px;">&nbsp;<input id="in" name="startTime" type="time" style="width:100%;" required></td>
                                            </tr>
                                            <tr>
                                                <th>변경요청 퇴근시간</th>
                                                <td style="padding-bottom: 20px;">&nbsp;<input id="out" name="endTime" type="time" style="width:100%;" required></td>
                                            </tr>
                                            <tr>
                                                <th>조정내용/사유</th>
                                                <td>&nbsp;<textarea name="reason" cols="30" rows="5" style="resize: none;" required>상세내용 입력</textarea></td>
                                            </tr>
                                            <tr>
                                                <th>파일첨부</th>
                                                <td style="padding-bottom: 20px;">&nbsp;<input type="file" style="width:100%;" id="upfile" name="upfile"></td>
                                            </tr>
                                        </table>
                                        <br>
                                        <div align="center">
                                            <button type="submit" class="btn su_btn_two su_btn_all" id="submitBtn" data-toggle="modal" data-target="#noContent" style="width: 180px;">근태조정 신청하기</button>
                                        </div>
                                        <br><br>   
                                        <div align="center">
                                            <span class="arrowL" style="margin-right:100px ;"></span>
                                            <span class="arrowR"></span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div id='calendar' style="margin-left: 10px; padding-top: 30px;  width: 1000px; height: 500px; " >
                                
                            </div>
                        
                        </div>

                        <script>

                        function test1(date){
                        	console.log(date)
                        	$.ajax({
                           				url: 'searchDetailAt.me',
                           				type: 'POST',
                           				dataType: 'json',
                           				data: {
                           					day : date
                           				},
                           				success: function(list) {
                           					console.log(list)
                           					if(list.attDate<list.memEnrollDate){
                           						alert('입사전 날짜입니다.')
                           					}else{
                           						$('#div1').css('display','')
                                				$('#date1').val(list.attDate)
                                				$('#in').val(list.attIn)
                                				$('#out').val(list.attOut)
                                				$('#attNo').val(list.attNo)
                           					}
                           					
                           				},error: function(){
                           					alert('휴일 또는 공휴일입니다.')
                           				}
                           			});	
                        	
           					
                        }

                        $('.close').click(function(){
                            $('#div1').css('display','none')
                            $('#date1').val('')
                            $('#in').val('')
                            $('#out').val('')
                        })
						</script>
						
                        <script>
                        
                   		
                         document.addEventListener('DOMContentLoaded', function() {
                            var calendarEl = document.getElementById('calendar');
                            var calendar = new FullCalendar.Calendar(calendarEl, {
                               
                                initialView: 'dayGridMonth',
                                
                                locale: 'ko',
                                headerToolbar: {         
                                    left: 'prevYear,prev,today',          
                                    center: 'title',          
                                    right: 'dayGridMonth,next,nextYear' //timeGridWeek,timeGridDay,        
                                },
                                
                                dateClick: function(info) {
                                    let clickDate = new Date(info.dateStr)
                                    clickDate.setHours(clickDate.getHours() - 9)
                                    let currentDate = new Date()
                                    console.log(clickDate)
                                    console.log(currentDate)
                                    if(clickDate<=currentDate){
                                    	test1(info.dateStr);
                                    }else{
                                    	alert('유효한날짜를 선택하세요.')
                                    }
                                },
	
                                navLinks: false,
                               	
                               eventSources: [{
                           		events: function(info, successCallback, failureCallback) {
                           			
                           			let h1 = new Date(info.startStr).toISOString().slice(0,10);
                           			let h2 = new Date(info.endStr).toISOString().slice(0,10);
                           			let h3 = new Date(info.startStr)
                           			let h4 = new Date(h3.setMonth(h3.getMonth()+1))
                           			let month = new Date(h4).getMonth()+1
                           			let year = new Date(h4).getFullYear();
                           			let date = new Date(year,month,0).getDate()
                           			let startdate = ''
                           			let enddate = ''
                           			if(month<10){
                           				startdate=year+'-0'+month+'-01'
                           				enddate=year+'-0'+month+'-'+date
                           			}else{
                           				startdate=year+'-'+month+'-01'
                           				enddate=year+'-'+month+'-'+date
                           			}
                           			$.ajax({
                           				url: 'count.cl',
                           				type: 'POST',
                           				dataType: 'json',
                           				data: {
                           					start : startdate,
                           					end : enddate
                           				},
                           				success: function(data) {
                           					console.log(data)
                           					$('#d').text(data.normal)
                           					$('#l').text(data.leave)
                           					$('#f').text(data.absent)
                           				}
                           			});
                           			
                           			$.ajax({
                           				url: 'test.cl',
                           				type: 'POST',
                           				dataType: 'json',
                           				data: {
                           					start : h1,
                           					end : h2
                           				},
                           				success: function(data) {
                           					successCallback(data);
                           				}
                           			});
                           		}
                           	}]
                            });
                            calendar.render();
                            
                            $(".fc-prev-button").click(function() {
                                /* var date = calendar.getDate();
                                var month = new Date(date).getMonth()
                                var year = new Date(date).getFullYear()
                                if(month+1<10){
                                    alert(year+'-0'+(month+1))
                                }else{
                                    alert(year+'-'+(month+1))
                                } */
                            	var date = calendar.getDate();
                                date.setHours(date.getHours() + 9)
                                var month = date.toISOString().replace('T', ' ').substring(0, 10)
                                
                            });
                            $(".fc-next-button").click(function() {
                            	var date = calendar.getDate();
                                date.setHours(date.getHours() + 9)
                                var month = date.toISOString().replace('T', ' ').substring(0, 10)
                                
                            });
                            $(".fc-prevYear-button").click(function() {
                            	var date = calendar.getDate();
                                date.setHours(date.getHours() + 9)
                                var month = date.toISOString().replace('T', ' ').substring(0, 10)
                    
                            });
                            $(".fc-nextYear-button").click(function() {
                            	var date = calendar.getDate();
                                date.setHours(date.getHours() + 9)
                                var month = date.toISOString().replace('T', ' ').substring(0, 10)
                           
                            });
                            $(".fc-today-button").click(function() {
                            	var date = calendar.getDate();
                                date.setHours(date.getHours() + 9)
                                var month = date.toISOString().replace('T', ' ').substring(0, 10)
                              
                            });
                        });
                     
                        
                      </script>
                        

                        <!-- 게시글 영역 -->
                        
                    </div>
                    
                </div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>