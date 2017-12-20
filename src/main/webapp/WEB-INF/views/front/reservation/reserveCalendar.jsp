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
<div></div>

<link href='/assets/comn/css/fullcalendar.min.css' rel='stylesheet' />

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
			navLinks: true,
		    navLinkDayClick: function(date, jsEvent) {
		        var dateParam = "?reservation_date=" + date.format("YYYY") + "-" + date.format("MM") + "-" + date.format("DD");
		        location.href="reserveDateTime.do" + dateParam;
		    },
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			eventRender: function(event, element, view) {
		        return $(event.title);
		    },
			events: [
				<c:forEach var="event" items="${eventList}" varStatus="status">
				{
					title: '<p class="booking">'
						 + '<a href="javascript:void(0)" onclick="popup(\'reserveDetail.do'
						 + '?meetingroom_key=<c:out value="${event.meetingroom_key}" />&total_times=<c:out value="${event.total_times}" />&reservation_date=<c:out value="${event.reservation_date}" />\', \'\', \'550\', \'250\', \'no\', \'no\', \'3\'); return false;">'
						 + '<span class="circle <c:out value="${event.color}" />">'
						 + '</span><span class="room"><c:out value="${event.meetingroom_name}" /></span>'
						 + '<span class="time"> <c:out value="${event.total_times}" /></span></a></p>',
					start: '<c:out value="${event.reservation_date}" />'
				}
				<c:if test="${!status.last}"> , </c:if>
				</c:forEach>

			]

		});

		var meetingrooms = [];
		<c:forEach var="meetingroom" items="${meetingroomList}" varStatus="status">
			meetingrooms.push('<p class="booking"><span class="circle ${meetingroom.color}"></span>${meetingroom.name}</p>');
		</c:forEach>
		var label = $('<div class="room_guide"></div>').append(meetingrooms.join(""));


		$(".fc-toolbar.fc-header-toolbar").append(label);
		
		<c:if test="${not empty reserve.reservation_date}">
		$('#calendar').fullCalendar('gotoDate', '${reserve.reservation_date}');
		</c:if>
	});

</script>
