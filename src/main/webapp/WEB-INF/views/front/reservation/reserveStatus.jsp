<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
<div class="depth3_menu menu_3">
	<ul>
		<li><a href="reserveGuide.do">회의실 안내</a></li>
		<li><a href="reserveCalendar.do">회의실 예약</a></li>
		<li><a class="on" href="reserveStatusLogin.do">회의실 예약조회</a></li>
	</ul>
</div>

<div class="reservation">
	<div class="text_box">
		<h3><span class="topline"></span>회의실 온라인 예약</h3>
		<p>홈페이지를 통해서 예약된 정보 입니다.<br>신청이 완료된 것이지 승인된 것은 아니며, 최종적인 사용은 관리자에 의해 승인처리 후 가능합니다.</p>
	</div>
	
	<div class="step_style1">
		<ul>
			<li><span class="step_no">01</span><span class="step_txt">날짜, 시간, 회의실 선택</span><span class="step_arrow"></span></li>
			<li><span class="step_no">02</span><span class="step_txt">정보입력</span><span class="step_arrow"></span></li>
			<li class="active"><span class="step_no">03</span><span class="step_txt">예약완료 및 확인</li>
		</ul>
	</div>
	
	<div class="finish">
		<img src="http://localhost:8080/upload/thumb${reserveInfo.image}" class="finish_img" alt="meetingroom img" height="240" width="251">
		<table class="table_form">
		<caption>회의실예약</caption>
		<colgroup>
			<col style="width:20%;">
			<col style="width:30%;">
			<col style="width:20%;">
			<col style="width:30%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">예약번호</th>
				<td colspan="3">${reserveInfo.reservation_key}</td>
			</tr>
			<tr>
				<th scope="row">예약자성명</th>
				<td>${reserveInfo.name}</td>
				<th scope="row">소속 (기업명)</th>
				<td>${reserveInfo.firm_name}</td>
			</tr>
			<tr>
				<th scope="row">휴대전화</th>
				<td>${reserveInfo.phone_number_1}-${reserveInfo.phone_number_2}-${reserveInfo.phone_number_3}</td>
				<th scope="row">이메일</th>
				<td>${reserveInfo.email_addr_1}@${reserveInfo.email_addr_2}</td>
			</tr>
			<tr>
				<th scope="row">회의실</th>
				<td>${reserveInfo.meetingroom_name}</td>
				<th scope="row">요금</th>
				<td>${reserveInfo.total_price}원</td>
			</tr>
			<tr>
				<th scope="row">날짜</th>
				<td>${reserveInfo.reservation_date}</td>
				<th scope="row">시간</th>
				<td>${reserveInfo.total_times}</td>
			</tr>
			<tr>
				<th scope="row">추가요청사항 </th>
				<td colspan="3">
				${reserveInfo.request}
				</td>
			</tr>
		</tbody>
		</table>
		<p class="text_right">
			<span>! 문의전화</span> : 033-250-8966
		</p>

	</div><!-- //finish -->

	<div class="btn_wrap">
		<a href="/" class="btn btn_white">메인화면으로</a>
		<a href="reserveStatusLogin.do" class="btn btn_point">회의실 예약조회</a>
	</div>

</div><!-- //reservation -->