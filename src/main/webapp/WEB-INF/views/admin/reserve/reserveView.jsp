<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<fieldset>
<legend></legend>
<form:form commandName="reserveInfo" action="reserveUpdate.do" method="post">
<form:hidden path="reservation_key"/>

<div class="section">
	<h3 class="tit-h3">예약정보</h3>
	<table class="table_form">
		<caption>테이블</caption>
		<colgroup>
			<col style="width:15%">
			<col style="width:85%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">신청일</th>
				<td>${reserveInfo.reg_time}</td>
			</tr>
			<tr>
				<th scope="row">승인여부</th>
				<td>
					<form:select path="status" title="검색구분 선택">
						<form:option value="W">신청</form:option>
						<form:option value="A">승인</form:option>
						<form:option value="R">반려</form:option>
					</form:select>&nbsp;&nbsp;
					<em>※ 예약현황 변경 시 예약자에게  SMS 발송됩니다.</em>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="section">
	<h3 class="tit-h3">예약자정보</h3>
	<table class="table_form">
		<caption>테이블</caption>
		<colgroup>
			<col style="width:15%">
			<col style="width:35%">
			<col style="width:15%">
			<col style="width:35%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">성명</th>
				<td>${reserveInfo.name}</td>
				<th scope="row">소속</th>
				<td>${reserveInfo.firm_name}</td>
			</tr>
			<tr>
				<th scope="row">휴대폰번호</th>
				<td>${reserveInfo.phone_number_1}-${reserveInfo.phone_number_2}-${reserveInfo.phone_number_3}</td>
				<th scope="row">이메일</th>
				<td>${reserveInfo.email_addr_1}@${reserveInfo.email_addr_2}</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="section">
	<h3 class="tit-h3">회의실정보</h3>
	<table class="table_form">
		<caption>테이블</caption>
		<colgroup>
			<col style="width:15%">
			<col style="width:35%">
			<col style="width:15%">
			<col style="width:35%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">회의실명</th>
				<td>${reserveInfo.meetingroom_name}</td>
				<th scope="row">날짜</th>
				<td>${reserveInfo.reservation_date}</td>
			</tr>
			<tr>
				<th scope="row">시간</th>
				<td>???????</td>
				<th scope="row">요금</th>
				<td>${reserveInfo.total_price}원</td>
			</tr>
			<tr>
				<th scope="row">행사명</th>				
				<td colspan="3"><form:input path="event_name" title="검색어 입력" cssClass="wid300"/></td>
			</tr>
			<tr>
				<th scope="row">추가요청사항</th>
				<td colspan="3"><form:textarea path="request"  title="추가요청사항 입력"  cssClass="col100"/></td>				
			</tr>
		</tbody>
	</table>
</div>

<div class="btn_wrap textAlign_right">
	<a href="reserveList.do" class="btn ">목록</a>
	<button type="submit" class="btn primary">확인</button>
</div>

</form:form>
</fieldset>
