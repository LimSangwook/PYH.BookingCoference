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
		<h3><span class="topline"></span>회의실 예약조회</h3>
		<p>예약 시 입력하신 비밀번호나 예약번호를 입력하시면 예약하신 회의실을 확인하실 수 있습니다.<br>
		예약 확인만 가능하며 수정이나 삭제하시려면 관리자에게 문의하시기 바랍니다.</p>
	</div>

	<!-- 예약번호 혹은 비밀번호 입력 -->
	<form id="reserveMeetingroom" commandName="reserveInfo" action="reserveResult.do">
	<fieldset>
	<legend>정보입력</legend>

	<div class="finish">
		<img src="/assets/comn/img/reservation_bg.png" class="finish_img">
		<em>※ 이름과 비밀번호 혹은 예약번호를 입력해주세요.</em>
		<p class="text_right"><span class="required">*</span>는 필수 입력정보입니다.</p>
		<table class="table_form">
			<caption>회의실예약</caption>
			<colgroup>
				<col style="width:15%;">
				<col style="width:85%;">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">성명 <span class="required">*</span></th>
					<td><input type="text" name="name" class="wid200" title="성명 입력"></td>
				</tr>
				<tr>
					<th scope="row">예약번호</th>
					<td><input type="text" name="reservation_key" class="wid200" title="예약번호 입력"></td>
				</tr>
				<tr>
					<th scope="row">비밀번호 </th>
					<td><input type="password" name="reservation_pwd" class="wid200" title="비밀번호 입력"></td>
				</tr>
			</tbody>
		</table>
		<p class="text_right">
			<span>! 문의전화</span> : 033-250-8966
		</p>
	</div>

	<div class="btn_wrap">
		<button class="btn btn_point">확인</button>
	</div>

	</fieldset>
	</form>

</div><!-- //reservation -->

