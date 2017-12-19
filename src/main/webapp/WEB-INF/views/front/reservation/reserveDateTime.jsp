<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<div class="depth3_menu menu_3">
	<ul>
		<li><a href="reserveGuide.do">회의실 안내</a></li>
		<li><a class="on" href="reserveCalendar.do">회의실 예약</a></li>
		<li><a href="reserveStatusLogin.do">회의실 예약조회</a></li>
	</ul>
</div>

<div class="reservation">
	<div class="text_box">
		<h3><span class="topline"></span>회의실 온라인 예약</h3>
		<ul class="list01">
			<li><span class="dot_square"></span> 회의실 임대를 원하는 날짜와 시간을 확인해주세요.</li>
			<li><span class="dot_square"></span> 예약을 원하시는 날짜, 시간, 회의실을 선택하고 ‘예약하기’를 누르면 다음 단계로 진행됩니다.</li>
			<li><span class="dot_square"></span> 교육과정 혹은 장기적으로 회의실을 예약하시는 경우 에약현황을 확인하시고 담당직원(033-250-8966)에게 전화 바랍니다.</li>
		</ul>
	</div>
	
	<div class="step_style1">
		<ul>
			<li class="active"><span class="step_no">01</span><span class="step_txt">날짜, 시간, 회의실 선택</span><span class="step_arrow"></span></li>
			<li><span class="step_no">02</span><span class="step_txt">정보입력</span><span class="step_arrow"></span></li>
			<li><span class="step_no">03</span><span class="step_txt">예약완료 및 확인</li>
		</ul>
	</div>

	<div class="online_step">

		<div class="step_box step_room">
			<div class="title"><span>회의실선택</span></div>
			<div class="step_contents">
				<div class="select_list">
					<ul>
					<c:forEach var="meetingroom" items="${meetingroomList}" varStatus="status">
						<li><a href="javascript:void(0)" onclick="changeMeetingroom(this)" data="${meetingroom.meetingroom_key}" class="<c:if test='${meetingroom.room_availability == 0}'>none</c:if> <c:if test='${meetingroom.meetingroom_key == reserveInfo.meetingroom_key}'>select</c:if>">${meetingroom.meetingroom_name}</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div><!-- //step_room -->

		<div class="step_box step_date">
			<div class="title"><span>날짜선택</span></div>
			<div class="step_contents">
				<div class="date_month">
					<a href="javascript:void(0);" onclick="changeMonth(${dateList[0].reservation_year}, ${dateList[0].reservation_month}, -1)" class="ico month_prev">이전달</a>
					<p id="selectedYearMonth"><span>${dateList[0].reservation_year}</span>${dateList[0].reservation_month}</p>
					<a href="javascript:void(0);" onclick="changeMonth(${dateList[0].reservation_year}, ${dateList[0].reservation_month}, 1)"  class="ico month_next">다음달</a>
				</div>
				<div class="select_list"> 
					<ul id="datesOfMonth">
					<c:forEach var="date" items="${dateList}" varStatus="status">
						<li><a href="javascript:void(0);" onclick="changeDate(this)" data="${date.reservation_date}" class="<c:if test='${date.date_availability == 0}'>none</c:if> <c:if test='${date.selected_date == 1}'>select</c:if>">${date.reservation_day} ${date.reservation_dayofweek}</a></li>
					</c:forEach>
					</ul>
				</div>
			</div>
		</div><!-- //step_date -->

		<div class="step_box step_time">
			<div class="title"><span>시간선택</span></div>
			<div class="step_contents">
				<div class="select_list">
					<ul>
					<c:forEach var="time" items="${timeList}" varStatus="status">
						<li><a href="javascript:void(0);" data="${time.reservation_time}" class="time <c:if test='${time.time_availability == 0}'>none</c:if>">${time.reservation_term}</a></li>
					</c:forEach>
						
					</ul>
				</div>
			</div>
		</div><!-- //step_time -->

	</div><!-- //online_step -->

	<div class="reservation_desc">
		<span class="ex_none"></span> 예약불가
		<span class="ex_select"></span> 예약가능
	</div>

	<div class="btn_wrap">
		<a href="#" class="btn btn_white">예약현황 보기</a>
		<a href="javascript:void(0);" onclick="moveNext()" class="btn btn_point">다음</a>
	</div>

	
</div><!-- //reservation -->
<form:form id="retrieveForm" commandName="reserveInfo" action="reserveDateTime.do">
<form:hidden path="meetingroom_key"/>
<form:hidden path="reservation_date"/>
</form:form>

<form:form id="submitForm" commandName="reserveInfo" action="reserveUser.do">
<form:hidden path="meetingroom_key"/>
<form:hidden path="reservation_date"/>
</form:form>

<script>	
	function changeMeetingroom(obj) {
		$("input[name='meetingroom_key']").val(obj.getAttribute('data'));
		$('#retrieveForm').submit();
	}
	
	function changeDate(obj) {
		$("input[name='reservation_date']").val(obj.getAttribute('data'));
		$('#retrieveForm').submit();
	}
	
	function changeMonth(y, m, n) {
		var d = new Date( y, m, 1);
	    d.setMonth(d.getMonth()-1 + n);
	    var lastdate =    32 - ( new Date(d.getYear(),d.getMonth(),32).getDate()  );
	    var today =  new Date().getDate() ;
	    d.setDate ((today>lastdate) ? lastdate : today );
		$("input[name='reservation_date']").val(d.getFullYear()+'-'+(d.getMonth()+1)+'-'+d.getDay());
		$('#retrieveForm').submit();
	}
	
	function moveNext() {
		var reservationTime = [];
		$("a.time.select").each(function(index){
			reservationTime.push('<input name="reservation_times" type="hidden" value="' + this.getAttribute('data') + '">')	
		});
		$("#submitForm").append(reservationTime.join(""));
		$("#submitForm").submit();
	}
	
	$('.time').click(function(){
		if ($(this).hasClass("none")) {
			alert("이미 예약이 완료된 회의실 입니다.");
			return;
		}
		
		if ($(this).hasClass("select")) {
			$(this).toggleClass("select");
			return;			
		}
		
		var serial = false;
		$(".time").each(function(){
			if ($(this).hasClass("select")) {
				serial = true;
			}
		});
				
		if (serial) {
			if (!$(this).parent("li").next().children("a").hasClass("select") && !$(this).parent("li").prev().children("a").hasClass("select")) {
				alert("연속된 회의실만 선택 할 수 있습니다.");
				return;
			}			
		}
		
	    $(this).toggleClass("select");
	});
</script>