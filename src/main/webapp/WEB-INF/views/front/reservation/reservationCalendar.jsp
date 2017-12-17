<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<div class="depth3_menu menu_3">
	<ul>
		<li><a href="reserveGuide.do">회의실 안내</a></li>
		<li><a class="on" href="reserveCalendar.do">회의실 예약</a></li>
		<li><a href="reserveStatusLogin.do">회의실 예약조회</a></li>
	</ul>
</div>
<div id='calendar'></div>

<link href='/assets/comn/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/assets/comn/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />

<script src="/assets/script/fullcalendar/moment.min.js"></script>
<script src="/assets/script/fullcalendar/fullcalendar.min.js"></script>
<script src="/assets/script/fullcalendar/ko.js"></script>

<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev',
				center: 'title',
				right: 'next'
			},
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			dayClick: function(date, jsEvent, view) {	
		        var dateParam = "?reservation_date=" + date.format("YYYY") + "-" + date.format("MM") + "-" + date.format("DD");  
		        location.href="reserve.do" + dateParam;
		    }
		});
		
	});

</script>

