<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="p-5">
  <h2 class="mb-4" align="center">Full Calendar</h2><br>
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

<div id="modal-view-event-add" class="modal modal-top fade calendar-modal">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <form id="add-event">
        <div class="modal-body">
        <h4>Add Event Detail</h4>        
          <div class="form-group">
            <label>Event name</label>
            <input type="text" class="form-control" name="ename">
          </div>
          <div class="form-group">
            <label>Event Date</label>
            <input type='text' class="datetimepicker form-control" name="edate">
          </div>        
          <div class="form-group">
            <label>Event Description</label>
            <textarea class="form-control" name="edesc"></textarea>
          </div>
          <div class="form-group">
            <label>Event Color</label>
            <select class="form-control" name="ecolor">
              <option value="fc-bg-default">fc-bg-default</option>
              <option value="fc-bg-blue">fc-bg-blue</option>
              <option value="fc-bg-lightgreen">fc-bg-lightgreen</option>
              <option value="fc-bg-pinkred">fc-bg-pinkred</option>
              <option value="fc-bg-deepskyblue">fc-bg-deepskyblue</option>
            </select>
          </div>
          <div class="form-group">
            <label>Event Icon</label>
            <select class="form-control" name="eicon">
              <option value="circle">circle</option>
              <option value="cog">cog</option>
              <option value="group">group</option>
              <option value="suitcase">suitcase</option>
              <option value="calendar">calendar</option>
            </select>
          </div>        
      </div>
        <div class="modal-footer">
        <button type="submit" class="btn btn-primary" >Save</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>        
      </div>
      </form>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js"></script>
<script type="text/javascript">
/*
jQuery(document).ready(function(){
	  jQuery('.datetimepicker').datepicker({
	      timepicker: true,
	      language: 'ko',
	      range: true,
	      multipleDates: true,
			  multipleDatesSeparator: " - "
	    });
	  jQuery("#add-event").submit(function(){
	      alert("Submitted");
	      var values = {};
	      $.each($('#add-event').serializeArray(), function(i, field) {
	          values[field.name] = field.value;
	      });
	      console.log(
	        values
	      );
	  });
	});*/
	
	$(function(){
	    var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      timeZone: 'UTC',
	      locale: 'ko',
	      initialView: 'timeGridWeek',
	      events: [
	    	  {
	    		  start:'2022-09-23 10:00',
	    		  end:'2022-09-25 12:00',
	    		  title:'일정2',
	    		  color:'red'
	    	  },
	    	  {
	    		  start:'2022-09-01',
	    		  end:'2022-09-03',
	    		  title:'일정1',
	    		  color:'blue' 
	    	  }
	      ],
	      editable: true,
	      selectable: true,
	      select:function(){
	    	  $("#modal-view-event-add").modal("show");
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
