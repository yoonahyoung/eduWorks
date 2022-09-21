<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
</head>
	<jsp:include page="../common/header.jsp" />
<body>
	    
    <link rel="stylesheet" href="https://fullcalendar.io/releases/core/4.1.0/main.min.css" />
<script src="https://fullcalendar.io/releases/core/4.1.0/main.min.js"></script>

<script src="https://fullcalendar.io/releases/interaction/4.1.0/main.min.js"></script>

<link rel="stylesheet" href="https://fullcalendar.io/releases/timeline/4.1.0/main.min.css" />
<script src="https://fullcalendar.io/releases/timeline/4.1.0/main.min.js"></script>

<script src="https://fullcalendar.io/releases/resource-common/4.1.0/main.min.js"></script>

<link rel="stylesheet" href="https://fullcalendar.io/releases/resource-timeline/4.1.0/main.min.css" />
<script src="https://fullcalendar.io/releases/resource-timeline/4.1.0/main.min.js"></script>

<div style="font-family:Arial;" id="calendar"></div>

<script>
    //fullcalendar
//https://fullcalendar.io/
//resourceColumns-demo
//https://fullcalendar.io/docs/resourceColumns-demo

	let res=[
	      { id: 'a', title: 'Auditorium A', occupancy: 40 },
	      { id: 'b', title: 'Auditorium B', occupancy: 60 },
	      { id: 'c', title: 'Auditorium C', occupancy: 40 },
	      { id: 'd', title: 'Auditorium D', occupancy: 40 },
	      { id: 'e', title: 'Auditorium E', occupancy: 60 },
	      { id: 'f', title: 'Auditorium F', occupancy: 60 },
	      { id: 'g', title: 'Auditorium G', occupancy: 60 },
	      { id: 'h', title: 'Auditorium H', occupancy: 40 },
	      { id: 'i', title: 'Auditorium I', occupancy: 70 },
	      { id: 'j', title: 'Auditorium J', occupancy: 70 },
	      { id: 'k', title: 'Auditorium K', occupancy: 70 },
	      { id: 'l', title: 'Auditorium L', occupancy: 75 },
	      { id: 'm', title: 'Auditorium M', occupancy: 40 },
	      { id: 'n', title: 'Auditorium N', occupancy: 40 },
	      { id: 'o', title: 'Auditorium O', occupancy: 40 },
	      { id: 'p', title: 'Auditorium P', occupancy: 40 },
	      { id: 'q', title: 'Auditorium Q', occupancy: 40 },
	      { id: 'r', title: 'Auditorium R', occupancy: 40 },
	      { id: 's', title: 'Auditorium S', occupancy: 40 },
	      { id: 't', title: 'Auditorium T', occupancy: 40 },
	      { id: 'u', title: 'Auditorium U', occupancy: 40 },
	      { id: 'v', title: 'Auditorium V', occupancy: 40 },
	      { id: 'w', title: 'Auditorium W', occupancy: 40 },
	      { id: 'x', title: 'Auditorium X', occupancy: 40 },
	      { id: 'y', title: 'Auditorium Y', occupancy: 40 },
	      { id: 'z', title: 'Auditorium Z', occupancy: 40 }
	    ]
	
	let evs=[{"resourceId":"d","title":"event 1","start":"2019-04-25","end":"2019-04-27"},{"resourceId":"c","title":"event 3","start":"2019-04-26T12:00:00+00:00","end":"2019-04-27T06:00:00+00:00"},{"resourceId":"f","title":"event 4","start":"2019-04-26T07:30:00+00:00","end":"2019-04-26T09:30:00+00:00"},{"resourceId":"b","title":"event 5","start":"2019-04-26T10:00:00+00:00","end":"2019-04-26T15:00:00+00:00"},{"resourceId":"e","title":"event 2","start":"2019-04-26T09:00:00+00:00","end":"2019-04-26T14:00:00+00:00"}]
	
	let opt={
	    plugins: [ 'interaction', 'resourceTimeline' ],
	    timeZone: 'UTC',
	    header: {
	      left: 'today prev,next',
	      center: 'title',
	      right: 'resourceTimelineDay,resourceTimelineWeek'
	    },
	    defaultView: 'resourceTimelineDay',
	    aspectRatio: 1.5,
	    editable: true,
	    resourceColumns: [
	      {
	        labelText: 'Room',
	        field: 'title'
	      },
	      {
	        labelText: 'Occupancy',
	        field: 'occupancy'
	      }
	    ],
	    resources: res,
	    events: evs,
	  }
	
	
	let ele=document.getElementById('calendar')
	let calendar=new FullCalendar.Calendar(ele,opt)
	calendar.render()
</script>

	<jsp:include page="../common/footer.jsp" />
  
</body>
</html>
