<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<div class="ibox float-e-margins">
		<div class="ibox-title">
				<h5>관리자예약</h5>
				<div class="ibox-tools">
						<a class="collapse-link"> <i class="fa fa-chevron-up"></i>
						</a>
				</div>
		</div>
		<div class="ibox-content" style="display: block;">
			<div class="row">
					<div class="col-md-3">
							<select class="form-control" name="facilityId" id="sel-facility-id">
							</select>
					</div>
			</div>
			

			<div id="reseve-cal"></div>
			<div class="reserve-desp"><span>대기 : 입금대기, 완료 : 예약완료</span></div>
			<input type="hidden" id="hid-facility-id" value="">
			<input type="hidden" id="weekday-price" value="">
			<input type="hidden" id="weekend-price" value="">
		
			<div class="well m-t" style="display:none">
				<form id="reserve-form" role="form" action="addReserve.do" method="post" class="form-horizontal">
					<input type="hidden" id="facility-id" name="facility-id" value="">
					<input type="hidden" id="reserve-date" name="reserve-date" value="">
					<input type="hidden" id="basic-price" name="basic-price" value="0">
					<input type="hidden" id="light-price" name="light-price" value="0">
					<input type="hidden" id="total-price" name="total-price" value="0">
					<div class="form-group">
						<label class="col-sm-2 control-label">시설명</label>
						<div class="col-sm-10">
							<label class="control-label"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">예약일자</label>
						<div class="col-sm-10">
							<label class="control-label" id="txt-reserve-date"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="txt-name">예약자명</label>
						<div class="col-sm-10">
							<input id="txt-name" name="name" placeholder="예약자명을 입력해 주세요." class="form-control" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="txt-mobile">연락처</label>
						<div class="col-sm-10">
							<input id="txt-mobile" name="mobile" placeholder="연락처를 입력해 주세요." class="form-control phone-number" value="">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="txt-mobile">이용자수</label>
						<div class="col-sm-10">
							<div class="input-group">
								<input type="text" class="form-control number" id="user-count" name="user-count" placeholder="이용자수">
								<span class="input-group-addon">명</span>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="txt-mobile">예약시간</label>
						<div class="col-sm-10" id="div-time-list">
		
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">이용금액</label>
						<div class="col-sm-10">
							<label class="control-label">시간당 이용금액 <span id="txt-use-price">0</span>원</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">결제금액</label>
						<div class="col-sm-10">
							<label class="control-label">총 결제금액 <span id="txt-total-price">0</span>원</label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">입금계좌</label>
						<div class="col-sm-10">
							<label class="control-label"></label>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="deposit-name">입금자명</label>
						<div class="col-sm-10">
							<input id="deposit-name" name="deposit-name" placeholder="입금자명을 입력해 주세요." class="form-control" value="">
						</div>
					</div>
					
					<div class="row">
					<div class="col-sm-11 col-sm-offset-1">
						<input type="button" class="btn btn-primary" id="btn-save" value="예약 등록">
					</div>
					</div>
				</form>
			</div>

		</div>
</div>

<link href='/assets/comn/css/fullcalendar.min.css' rel='stylesheet' />
<link href='/assets/comn/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />

<script src="/assets/script/fullcalendar/moment.min.js"></script>
<script src="/assets/script/fullcalendar/fullcalendar.min.js"></script>
<script src="/assets/script/fullcalendar/ko.js"></script>

<script>

	$(document).ready(function() {
		
		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: ''
			},
			defaultDate: '2017-11-12',
			navLinks: true, // can click day/week names to navigate views
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			events: [
				{
					title: 'All Day Event',
					start: '2017-11-01'
				},
				{
					title: 'Long Event',
					start: '2017-11-07',
					end: '2017-11-10'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-11-09T16:00:00'
				},
				{
					id: 999,
					title: 'Repeating Event',
					start: '2017-11-16T16:00:00'
				},
				{
					title: 'Conference',
					start: '2017-11-11',
					end: '2017-11-13'
				},
				{
					title: 'Meeting',
					start: '2017-11-12T10:30:00',
					end: '2017-11-12T12:30:00'
				},
				{
					title: 'Lunch',
					start: '2017-11-12T12:00:00'
				},
				{
					title: 'Meeting',
					start: '2017-11-12T14:30:00'
				},
				{
					title: 'Happy Hour',
					start: '2017-11-12T17:30:00'
				},
				{
					title: 'Dinner',
					start: '2017-11-12T20:00:00'
				},
				{
					title: 'Birthday Party',
					start: '2017-11-13T07:00:00'
				},
				{
					title: 'Click for Google',
					url: 'http://google.com/',
					start: '2017-11-28'
				}
			]
		});
		
	});

</script>
<style>

	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>

<body>

	<div id='calendar'></div>

</body>

