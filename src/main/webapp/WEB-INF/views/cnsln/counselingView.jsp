<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css -->
<link href="${pageContext.request.contextPath}/resources/css/schedule.css" rel="stylesheet" type="text/css">
</head>
<body>

	<jsp:include page="../common/header.jsp" />
		<div class="container-fluid" style="margin: auto;">
            <div id='calendar' class="su_calendar_size"></div>
        </div>
        
        <script>
	        function getEvent(){
	        	var event = [];
	        	var e="";
	        	$.ajax({
		    		type: 'post',
		    		cache: false,
		    		async: false,
		    		url: "cnlist.cn",
		    		dataType:'json',
		    		data:{
	              		memNo: ${ loginUser.memNo }
	              	},
	              	success: function(param){
	              		//console.log(param);
	              		$.each(param, function(index, data){
	              			// map에서 값 불러와서 조건넣어서 이벤트 푸쉬하기...
		              		event.push({
		              			id: data.id,
		              			title: data.title,
		              			start: data.start,
		              			end: data.end,
		              			color: 'rgba(94, 126, 155, 0.6)'
		              			//backgroundColor: 'rgba(94, 126, 155, 0.6)'
		              		});
	              	    });
	              		
	              		e = event;
	              	}
	        	});
	        	return e;
	        }
	        
	        document.addEventListener('DOMContentLoaded', function() {
	        	
	        	var event = getEvent();
	        	console.log(event);
		        var calendarEl = document.getElementById('calendar');
		
		        var calendar = new FullCalendar.Calendar(calendarEl, {
			        plugins: [ 'interaction', 'dayGrid', 'timeGrid', 'list' ],
			        dateClick:function(arg){
					    //console.log(arg.dateStr); // 날짜 출력
					    location.href="enrollForm.cn?day=" + arg.dateStr + "&memNo=" + ${loginUser.memNo};
					},
					
					// 이벤트 클릭시 일정 상세 조회 페이지로 이동
					eventClick:function(e){
						location.href = "detail.cn?cNo=" + e.event.id + "&memNo=" + ${loginUser.memNo};
						//console.log(e.event.id);
					},
			        header: {
			            left: 'prev,next today',
			            center: 'title',
			            right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
			        },
			        locale: "ko",
			        //defaultDate: '2020-02-12',
			        navLinks: true, // can click day/week names to navigate views
			        businessHours: true, // display business hours
			        editable: true,
			        events: event
		        });
	
	        calendar.render();
	        });
    </script>
        
	<jsp:include page="../common/footer.jsp" />

</body>
</html>