<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<ul class="tabMenu menu_6">
	<li><a href="reserveCalendarList.do" class="active"><span>달력으로 보기</span></a></li>
	<li><a href="reserveCommonList.do"><span>목록으로 보기</span></a></li>
</ul>
<div id='calendar'></div>

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
			navLinks: false,
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			eventRender: function(event, element, view) {
		        return $(event.title);
		    },		    
			events: [
				<c:forEach var="event" items="${dailyEvent}" varStatus="status">
				{
					title: '<a href="reserveCommonList.do?srh_state=<c:out value="${event.status}"/>'
						 + '&srh_smonth=<c:out value="${event.reservation_date}"/>'
						 + '&srh_emonth=<c:out value="${event.reservation_date}"/>">'
						 + '<c:out value="${event.status_name}"/>(<c:out value="${event.cnt}"/>)</a><br>',
					start: '<c:out value="${event.reservation_date}" />'
				}
				<c:if test="${!status.last}"> , </c:if>
				</c:forEach>
						
			]
		        
		});		
	});

</script>


<style>
.fc-event-container {
    text-align: center;
    vertical-align: middle;
}
</style>