<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>



<c:choose>
<c:when test="${reserveInfo.size() < 1}">
<div class="text_box text_center">회의실 예약내역이 없습니다.</div>
</c:when>
<c:otherwise>


<div class="finish">

	<img src="/assets/comn/img/reservation_bg.png" class="finish_img">
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
			<th scope="row">예약자성명</th>
			<td>${reserveInfo[0].name}</td>
			<th scope="row">소속 (기업명)</th>
			<td>${reserveInfo[0].firm_name}</td>
		</tr>
		<tr>
			<th scope="row">휴대전화</th>
			<td>${reserveInfo[0].phone_number_1}-${reserveInfo[0].phone_number_2}-${reserveInfo[0].phone_number_3}</td>
			<th scope="row">이메일</th>
			<td>${reserveInfo[0].email_addr_1}@${reserveInfo[0].email_addr_2}</td>
		</tr>
		<tr>
			<th scope="row">회의실</th>
			<td>${reserveInfo[0].meetingroom_name}</td>
			<th scope="row">요금</th>
			<td>${reserveInfo[0].total_price}원</td>
		</tr>
		<tr>
			<th scope="row">날짜</th>
			<td>${reserveInfo[0].reservation_date}</td>
			<th scope="row">시간</th>
			<td>
				<c:forEach var="reserve" items="${reserveInfo}" varStatus="status">
				${reserve.reservation_term}<br>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th scope="row">처리상태</th>
			<td>${reserveInfo[0].status}</td>
			<th scope="row">승인시간</th>
			<td>${reserveInfo[0].status_time}</td>
		</tr>
		<!-- 승인대기, 거절 상태
		<tr>
			<th scope="row">처리상태</th>
			<td>승인대기</td>
			<th scope="row">승인시간</th>
			<td>-</td>
		</tr>
		<tr>
			<th scope="row">처리상태</th>
			<td>승인대기</td>
			<th scope="row">승인시간</th>
			<td>-</td>
		</tr>
		-->
		<tr>
			<th scope="row">추가요청사항 </th>
			<td colspan="3">
			${reserveInfo[0].request}
			</td>
		</tr>
	</tbody>
	</table>
	<p class="text_right">
		<span>! 문의전화</span> : 033-250-8966
	</p>

</div><!-- //finish -->
</c:otherwise>
</c:choose>