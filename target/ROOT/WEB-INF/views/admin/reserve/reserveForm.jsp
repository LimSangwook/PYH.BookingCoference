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

<script src="/js/fullcalendar/moment.min.js"></script>
<script src="/js/fullcalendar/fullcalendar.min.js"></script>
<script src="/js/fullcalendar/ko.js"></script>
<script>
	$(function(){
		 var default_price;
		// 시설선택 변경 
		$("#sel-facility-id").change(function(event) {
			var id = $(this).val();
            $(location).attr("href", "addReserve.do?id=" + id);
		})

		// 저장 
		$("#btn-save").click(function(event) {
			event.preventDefault();
			if ($("#txt-name").val() == "") {
				alert("예약자명을 입력하세요.");
				$("#txt-name").focus();
				return;
			}
			if ($("#txt-mobile").val() == "") {
				alert("연락처를 입력하세요.");
				$("#txt-mobile").focus();
				return;
			}
			if ($("#user-count").val() == "") {
				alert("이용자수를 입력하세요.");
				$("#user-count").focus();
				return;
			}
			if ($(".input-time:checked").length <= 0) {
				alert("예약시간을 하나 이상 선택하세요.");
				$(".input-time:enabled:first").focus();
				return;
			}
			if ($("#deposit-name").val() == "") {
				alert("입금자명을 입력하세요.");
				$("#deposit-name").focus();
				return;
			}
			$("#reserve-form").submit();
		})

    	// 서버 날짜 구하기 
    	$.get("/getDate.do", function(data) {
            // 공휴일
			var holidayDates = new Array();
			var holidayNames = new Array();
            $.each(data.holidayList, function(index, entry) {
            	holidayNames.push(entry.name);
            	holidayDates.push(entry.date);
            })

			$("#reseve-cal").fullCalendar({
				timezone: "local",
				header: {
					left: "",
					//center: "myPrev, title, myNext",
					center: "prev, title, next",
					right: ""
				},
	            //eventBackgroundColor: "#768ffd",
	            height: "auto",
	            eventLimit: true,
	            views: {
	            	month: {
	            		eventLimit: 5
	            	}
	            },
	            //aspectRatio: 2.5,
	            eventLimitText: "개",
	            allDay: false,
	            displayEventTime: false,
	            defaultView: "month",
	            showNonCurrentDates: false,  // 이번 달 날짜만 나오게 
	            //editable: true,
	            selectable: true,
	            //unselectAuto: false,
	            events: function (start, end, timezone, callback) {
	            	// 예약금액 초기화하고 화면 숨김 
	            	$(".well").hide();
	    			$("#basic-price").val(0);
	    			$("#light-price").val(0);
	    			$("#total-price").val(0);    			
	    			$("#txt-total-price").text(0);
	
	    			$.ajax({
	                    type: "get",
	                    cache: false,
	                    url: "/cuc/reserveList.do",
	                    dataType: 'json',
	                    contentType: "application/json; charset=utf-8",
	                    data: {
							id: $("#hid-facility-id").val(),                 	
	                        start: start.format(),
	                        end: end.format()
	                    },
	                    success: function (data) {
	                    	// 예약시간 정보 다시 읽어오기
	                    	var html = "";
	                        $.each(data.timeDivList, function (index, entry) {
	                        	html += "<div class='checkbox'>";
	                        	html += "<label><input type='checkbox' class='input-time' id='input-time" + entry.id + "' name='times' value='" + entry.id + "' data-lighting='" + entry.lightingPrice + "'>";
	                        	html += entry.name;
	                        	if (entry.lightingPrice > 0) {
	                        		html += "(야간조명 사용료 : " + addComma(entry.lightingPrice) + ")";
	                        	}
	                        	html += "</label></div>";
	                        });
	                    	$("#div-time-list").html(html);
	                    	$(".input-time").on("click", function(event) {
	                 			var cnt = $(".input-time:checked").length;
	                			var price = default_price * 2;
	                			var basic_price = cnt * price;
	                			var lighting_price = parseInt($("#light-price").val());
	                			var lighting = parseInt($(this).data("lighting"));
	                			if (lighting > 0) {
		                			if ($(this).is(":checked"))
		                				lighting_price += lighting;
		                			else
		                				lighting_price -= lighting;
	                			}
	                			var total_price = basic_price + lighting_price;
	                			$("#basic-price").val(basic_price);
	                			$("#light-price").val(lighting_price)
	                			$("#total-price").val(total_price);
	                			// 화면에 금액 표시 
	                			$("#txt-total-price").text(addComma(total_price));
	                		});
	                    	
	                    	// 예약정보 설정 
	                    	var events = [];
	                        $.each(data.reserveList, function (index, entry) {
								var url = "viewReserve.do?id=" + entry.id;
	                        	if (entry.status == 1) {
		                             events.push({
		                                 id: entry.id,
		                                 title: entry.title,
		                                 start: entry.start,
		                                 color: "#777777",
		                                 url: url,
		                                 timeid: entry.timeid
		                             });
	                        	}
	                        	else {
		                             events.push({
		                                 id: entry.id,
		                                 title: entry.title,
		                                 start: entry.start,
		                                 color: "#ff4444",
		                                 url: url,
		                                 timeid: entry.timeid
		                             });
	                        	}
	                        });
	                        callback(events);
	                    },
	                    error: function (data) {
	                        alert("서버 오류 발생" + data);
	                    }
	                });
	            },
	            dayRender: function (date, cell) {
	                // 공휴일 표시 
	                var i = 0;
	                var this_date = moment(date.format("YYYY-MM-DD"), "YYYY-MM-DD");
	                holidayDates.forEach(function(value) {
		                var holiday_date = moment(value, "YYYY-MM-DD");
		                if (holiday_date.isSame(this_date)) {
		                	$(cell).append("<div class='fc-holiday'>" + holidayNames[i] + "</div>");
		                }
		                i++;
	            	})
	            },
	            dayClick: function (date, jsEvent, view) {
	        		// 계산금액 초기화 
	    			$("#basic-price").val(0);
	    			$("#light-price").val(0);
	    			$("#total-price").val(0);    			
	    			$("#txt-total-price").text(0);
	            	// 공휴일 체크 
	            	var isHoliday = false;
	                var this_date = moment(date.format("YYYY-MM-DD"), "YYYY-MM-DD");
	                holidayDates.forEach(function(value) {
		                var holiday_date = moment(value, "YYYY-MM-DD");
		                if (holiday_date.isSame(this_date))
		                	isHoliday = true;
	            	})
	            	// 휴일요금 적용 : 토요일,일요일
	            	if ((date.weekday() == 0) || (date.weekday() == 6) || isHoliday)
	            		default_price =  parseInt($("#weekend-price").val());
	            	else
	            		default_price =  parseInt($("#weekday-price").val());
	        		$("#txt-use-price").text(addComma(default_price));
	            		
	            	// 클릭한 날짜의 이벤트 구하기
	            	var dayEvents = $("#reseve-cal").fullCalendar('clientEvents', function(event) {
	            		return moment(event.start).isSame(date,'day');
	            	});
	               	$(".input-time").prop("checked", false);
	            	$(".input-time").prop("disabled", false);
	            	$(".input-time").parent().css("text-decoration", "none");
	            	$(".input-time").parent().css("color", "#5f5e5e");
	            	$.each(dayEvents, function(index, entry) {
	            		$("#input-time" + entry.timeid).prop("disabled", true);
	            		$("#input-time" + entry.timeid).parent().css("text-decoration", "line-through");
	            		$("#input-time" + entry.timeid).parent().css("color", "#f62222");
	            		$("#input-time" + entry.timeid).parent().css("cursor", "default");
	            	});
	            	var reserveDate = date.format("YYYY-MM-DD");
	            	$(".well").show();
	            	$("#txt-reserve-date").text(reserveDate);
	            	$("#reserve-date").val(reserveDate);
	            },
			})
			
    	})
	})
</script>
