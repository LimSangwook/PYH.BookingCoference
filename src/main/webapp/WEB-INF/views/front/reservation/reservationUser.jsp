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

<form:form id="reserveMeetingroom" commandName="reserveInfo" action="reserveSave.do">
<form:hidden path="meetingroom_key"/>
<form:hidden path="reservation_date"/>
<form:hidden path="reservation_times"/>
<form:hidden path="total_price"/>
<form:hidden path="total_times"/>
<fieldset>
<legend>정보입력</legend>

	<div class="text_box">
		<h3><span class="topline"></span>회의실 온라인 예약</h3>
		<p> 한국기후변화연구원은 개인정보보호법 등 관련 법령에 의거하여, 정보주체로부터 개인정보를 수집함에 있어, 아래 내용을 안내하고 있습니다. <br>정보주체가 되는 이용자께서는 아래 내용을 읽어보신 후 동의 여부를 결정하여 주기기 바랍니다.</p>
	</div>
	
	<div class="step_style1">
		<ul>
			<li><span class="step_no">01</span><span class="step_txt">날짜, 시간, 회의실 선택</span><span class="step_arrow"></span></li>
			<li class="active"><span class="step_no">02</span><span class="step_txt">정보입력</span><span class="step_arrow"></span></li>
			<li><span class="step_no">03</span><span class="step_txt">예약완료 및 확인</li>
		</ul>
	</div>

	<h3 class="title_depth1 float_left">정보입력</h3>
	<p class="text_right float_right"><span class="required">*</span>는 필수 입력정보입니다.</p>
	<div class="section">
		<table class="table_form">
		<caption>회의실예약</caption>
		<colgroup>
			<col style="width:15%;">
			<col style="width:35%;">
			<col style="width:15%;">
			<col style="width:35%;">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">예약자성명 <span class="required">*</span></th>
				<td>
					<form:input path="name" title="예약자성명 입력" cssClass="wid200" isNullCheck="true" maxlength="20"/>
				</td>
				<th scope="row">소속 (기업명) <span class="required">*</span></th>
				<td>
					<form:input path="firm_name" title="소속 입력" cssClass="wid200" isNullCheck="true" maxlength="20"/>
				</td>
			</tr>
			<tr>
				<th scope="row">휴대전화 <span class="required">*</span></th>
				<td>
					<form:select path="phone_number_1" title="전화번호선택" isNullCheck="true">
						<option value="010" selected="selected">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</form:select> -
					<form:input path="phone_number_2" title="전화번호입력" cssClass="wid80" isNullCheck="true" maxlength="4"/>
					<form:input path="phone_number_3" title="전화번호입력" cssClass="wid80" isNullCheck="true" maxlength="4"/>
				</td>
				<th scope="row">이메일 <span class="required">*</span></th>
				<td>
					<form:input path="email_addr_1" title="이메일입력" cssClass="wid100" maxlength="30"/>
					@
					<form:select path="email_addr_2" title="이메일선택" isNullCheck="true">
						<option selected="selected">이메일 선택</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="">직접입력</option>
					</form:select>
					<form:input path="email_addr_3" title="기타 이메일입력" cssClass="wid160" maxlength="30" style="display:none;"/>
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호 <span class="required">*</span></th>
				<td>
					<input type="password" name="reservation_pwd" id="reservation_pwd" title="비밀번호 입력" class="wid160" maxlength="20" />
					<em>※ 예약확인 시 필요하니 반드시 기억해주시기 바랍니다.</em>
				</td>
				<th scope="row">비밀번호 확인 <span class="required">*</span></th>
				<td>
					<input type="password" name="reservation_pwd_confirm" id="reservation_pwd_confirm" title="비밀번호 입력" class="wid160" maxlength="20" /> 
				</td>
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
					<em>※ 필요한 물품이 있으시면 여기에 입력해주세요.</em>
					<form:textarea path="request"  title="추가요청사항 입력"  rows="5" cssClass="col100"/>
					<p class="text_right">최대 50자</p>
				</td>
			</tr>
		</tbody>
		</table>
	</div>

	<h3 class="title_depth1">개인정보 수집 및 이용 동의</h3>
	<div class="agreeBox">
		<p>1. 수집하는 개인 정보의 항목<br>
		- 성명, 연락처, 이메일</p>
		<p>2. 보유 및 이용기간<br>
		- 1년</p>
		<p>3. 개인정보의 수집 및 이용 목적<br>
		- 고객(사용자)에게 시설 이용 서비스 제공</p>
		<p>4. 동의를 거부할 권리 및 동의 거부에 따른 안내<br>
		- 고객께서는 본 안내에 따라 개인정보 수집에 대하여 거부하실 수 있는 권리가 있습니다. <br>
		- 본 개인정보 수집에 대하여 거부하시는 경우, 이용자 확인이 이루어지지 않음에 따라 본 시설을 이용하실 수 없습니다.</p>
		<p>5. 개인정보 수집 · 이용 <br>
		- 만14세 미만의 개인은 반드시 법정대리인의 동의를 받아야 하므로 신청을 불허합니다. <br>
		- 따라서 개인정보의 정보주체가 만14세 미만일 경우, 해당 법정대리인이 직접 신청해주시기 바랍니다.
	</div>
	<div class="agreeBox2">
		<input type="checkbox" name="agree_term_personal_info" id="agree_term_personal_info"> <label for="agree_1">개인정보 수집 및 이용동의에 동의합니다.</label>
	</div>

	<div class="btn_wrap">
		<a href="#" class="btn btn_white">이전</a>
		<a href="javascript:viod(0);" onclick="reserveMeetingroomSubmit()" class="btn btn_point">예약</a>
	</div>

</fieldset>
</form:form>

</div><!-- //reservation -->

<script type="text/javascript">
function reserveMeetingroomSubmit(){
	if (!$("#agree_term_personal_info").prop("checked")) {
		alert("개인정보 수집 및 이용에 동의하여 주세요.")
	}
	
	if(formValidate()){
		if(!confirm('등록하시겠습니까?')){
			return;
		}
		$('#reserveMeetingroom').submit();
	}	
}
</script>