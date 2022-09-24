<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<style>
	#calendar{
		height: 1200px;
    	margin: 5px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	
	<div class="p-5">
  <h2 class="mb-4" align="center">시설예약</h2><br>
  <div class="card">
    <div class="card-body p-0">
      <div id="calendar"></div>
    </div>
  </div>
</div>

<!-- calendar modal -->
<div id="modal-view-event" class="modal modal-top fade calendar-modal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<h4 class="modal-title"><span class="event-icon"></span><span class="event-title"></span></h4>
					<div class="event-body"></div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
<!-- 예약 입력창 -->
<div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="add-event" action="reservationInsert.re">
        <div class="modal-body">
        <h4>예약 정보 입력</h4>        
          <div class="form-group">
            <label>예약명</label>
            <input type="text" class="form-control" name="resTitle" id="title" required>
          </div>
          <div class="form-group">
            <label>예약 시작 시간</label>
            <input type='datetime-local' class="datetimepicker form-control" id="resStartTime" name="resStartTime" required><br>
            <label>예약 종료 시간</label>
            <input type='datetime-local' class="datetimepicker form-control" id="resEndTime" name="resEndTime" required>
          </div>        
          <div class="form-group">
            <label>예약 내용</label>
            <textarea class="form-control" name="resContent" required></textarea>
          </div>
          <div class="form-group">
            <label>예약 색상 선택</label>
            <select class="form-control" name="resColor">
              <option value="red">red</option>
              <option value="blue">blue</option>
              <option value="lightgreen">lightgreen</option>
              <option value="pinkred">pinkred</option>
              <option value="deepskyblue">deepskyblue</option>
            </select>
          </div>
               
      </div>
        <div class="modal-footer">
        <input type="hidden" value="${ loginUser.memNo }" name="memNo">
		<input type="hidden" value="1회의실" name="resFacilities">      
        <button type="submit" class="btn btn-primary">저장</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">취소</button>        
      </div>
      </form>
    </div>
  </div>
</div>

<!-- 예약 수정 및 삭제 모달창 -->
<div id="modal-view-event-addH" class="modal modal-top fade calendar-modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="add-event" action="">
        <div class="modal-body">
        <h4>예약 정보 입력</h4>        
          <div class="form-group">
            <label>예약명</label>
            <input type="text"  class="form-control" name="resTitleU" id="titleUpdate" required>
          </div>
          <div class="form-group">
            <label>예약 시작 시간</label>
            <input type='datetime-local' class="datetimepicker form-control" id="resStartTimeUpdate" name="resStartTimeU" required><br>
            <label>예약 종료 시간</label>
            <input type='datetime-local'  class="datetimepicker form-control" id="resEndTimeUpdate" name="resEndTimeU" required>
          </div>        
          <div class="form-group">
            <label>예약 내용</label>
            <textarea class="form-control" name="resContentU" id="resContentUpdate" required></textarea>
          </div>
          <div class="form-group">
            <label>예약 색상 선택</label>
            <select class="form-control" name="resColorU" id="resColorUpdate">
              <option value="red">red</option>
              <option value="blue">blue</option>
              <option value="lightgreen">lightgreen</option>
              <option value="pinkred">pinkred</option>
              <option value="deepskyblue">deepskyblue</option>
              <option value="yellow">yellow</option>
              <option value="slategray">slategray</option>
            </select>
          </div>
               
      </div>
        <div class="modal-footer">
        <input type="hidden" id="resNoUpdate" value="" name="resNoU">
        <input type="hidden" value="${ loginUser.memNo }" name="memNo">
		<input type="hidden" value="1회의실" name="resFacilities">      
        <!-- <button type="button" class="btn btn-primary" onclick="postFormSubmitR('reservationUpdate.re')">수정</button>
        <button type="button" class="btn btn-primary" onclick="postFormSubmitR('reservationDelete.re')">삭제</button> -->
        <button type="reset" class="btn btn-primary" data-dismiss="modal">취소</button>        
      </div>
      </form>
    </div>
  </div>
</div>
 <script>
      	function postFormSubmitR(url){
      		$("#add-event").attr("action", url).submit();
      	}
</script>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script type="text/javascript">

	$(function(){
		
		$(document).ready(function () {
			$('input.timepicker').timepicker({
		            timeFormat: 'HH:mm',
		            interval: 30,
		            startTime: '00:00',
		            dynamic: false,
		            dropdown: true,
		            scrollbar: true
		        });
		})
	    var calendarEl = document.getElementById('calendar');

		var event = []; // 여기에 ㄷ
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      timeZone: 'UTC',
	      locale: 'ko',
	      initialView: 'timeGridWeek',
	      navLinks: true, // can click day/week names to navigate views
	      editable: true,
	  	  allDaySlot: true,
	  	  contentHeight: 'auto',
	      editable: true,
	      eventClick:function(e){
	    	  $.ajax({
	    		  url:"reservationUpdateForm.re",
	    		  data:{resNo:e.event.id},
	    		  dataType:'json',
	    		  success: function(result){
	    			  $("#resNoUpdate").val(e.event.id);
	    			  $("#titleUpdate").val(result.resTitle);
	    			  $("#resStartTimeUpdate").val(result.resStartTime);
	    			  $("#resEndTimeUpdate").val(result.resEndTime);
	    			  $("#resContentUpdate").val(result.resContent);
	    			  $("#resColorUpdate").val(result.resColor);
			    	  $("#modal-view-event-addH").modal("show");
	    			  
	    		  }
	    	  })
	    	  //location.href = "reservationUpdateForm.re";
	      },
	      selectable: true,
		    select: function(info) {
		    	$("#resStartTime").val(moment(info.startStr).add(3, 'hours').format('YYYY-MM-DD hh:mm'));
		    	$("#resEndTime").val(moment(info.endStr).add(3, 'hours').format('YYYY-MM-DD hh:mm'));
	    	  $("#modal-view-event-add").modal("show");
	    },
	      events:function(info, successCallback, failureCallback){
	  		$.ajax({
				url:"reservationSelect.re",
				data:{memNo: ${ loginUser.memNo }},
				dataType:'json',
				success:function(result){
					
					// result에 담긴 데이터들을 [{start:xxx, end:xxxx, title:xxxx, color:xxx}, {}, ....] 이런 모양으로 만들기
					console.log(event);
					$.each(result, function(index, data){
              			// map에서 값 불러와서 조건넣어서 이벤트 푸쉬하기...
              			if(result != null){
              				event.push({
    	              			id: data.id,
    	              			title: data.title,
    	              			start: data.start,
    	              			end: data.end,
    	              			color: data.color
    	              			//backgroundColor: 'rgba(94, 126, 155, 0.6)'
    	              		});
              			 }
					
						})
						console.log(event);
		              	successCallback(event);
						}
			      })  
	      		}
		    });
	    	  
	      

	    calendar.render();
		  
		
	})
	/*
	function selectList(){
		$.ajax({
			url:"",
			data:{},
			success:function(result){
				
				// result에 담긴 데이터들을 [{start:xxx, end:xxxx, title:xxxx, color:xxx}, {}, ....] 이런 모양으로 만들기
				let arr = []; // 여기에 ㄷ
				
			},error:function(){
				
			}
		})
	}*/
	
	
</script>

	


	<jsp:include page="../common/footer.jsp" />
  
</body>
</html>
