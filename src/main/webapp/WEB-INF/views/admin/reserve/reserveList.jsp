<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<ul class="tabMenu menu_6">
	<li><a href="reserveCalendarList.do"><span>달력으로 보기</span></a></li>
	<li><a href="reserveList.do" class="active"><span>목록으로 보기</span></a></li>
</ul>
	

<fieldset>
<legend></legend>
<form:form commandName="theForm" action="userList.do" method="get">
	<div class="search_wrap search_wrap3">
		<ul>
			<li class=" title100">
				<span class="title">회의실</span>
				<form:select path="search_column" title="검색구분 선택">
					<option value="1">지하대회의실</option>
					<option value="2">3층소회의실</option>
					<option value="3">동아리실1</option>
					<option value="4">동아리실2</option>
					<option value="5">동아리실3</option>
					<option value="6">동아리실4</option>
					<option value="7">동아리실5</option>
			</form:select>
			</li>
			<li class=" title100">
				<span class="title">예약자명</span>
				<form:input path="search_name" title="예약자명 입력" cssClass="wid100"/>				
			</li>
			<li class=" title100">
				<span class="title">사용일자</span>
				<form:input path="srh_smonth" title="검색어 입력" cssClass="wid100"/>	~ <form:input path="srh_emonth" title="검색어 입력" cssClass="wid100"/>
			</li>
			<li class=" title100">
				<span class="title">예약현황</span>
				<form:radiobutton path="srh_state" id="srh_state1" value="ALL"/> <label for="srh_state1">전체</label>&nbsp;&nbsp;
				<form:radiobutton path="srh_state" id="srh_state2" value="W"/> <label for="srh_state2">신청</label>&nbsp;&nbsp;
				<form:radiobutton path="srh_state" id="srh_state3" value="Y"/> <label for="srh_state3">승인</label>&nbsp;&nbsp;
				<form:radiobutton path="srh_state" id="srh_state4" value="R"/> <label for="srh_state4">반려</label>
			</li>
		</ul>

		<a href="#" class="btn inverse btn_small"><span class="ico ico_search"></span>검색</a>
	</div><!-- //search_wrap -->
</form:form>
</fieldset>

<div class="clearfix">
	<p class="total float_left">예약자명을 클릭하시면 예약상세정보를 보실 수 있습니다.</p>
	<a href="#" class="btn btn_small white float_right"><span class="ico ico_download"></span>엑셀 다운로드</a>
</div>
<table class="table_basic">
	<caption>테이블</caption>
	<colgroup>
		<col style="width:auto;" />
	</colgroup>
	<thead>
		<tr>
			<th scope="col">예약번호</th>
			<th scope="col">회의실명</th>
			<th scope="col">예약자명</th>
			<th scope="col">행사명</th>
			<th scope="col">사용일자</th>
			<th scope="col">신청일</th>
			<th scope="col">예약현황</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="reservation" items="${reservationList}" varStatus="status">
		<tr>
				<td>${reservation.reservation_key}</td>
				<td>${reservation.meetingroom_name}</td>
				<td><a href="reserveView.do?reservation_key=${reservation.reservation_key}">${reservation.name}</a></td>
				<td>-</td>
				<td>${reservation.reservation_date}</td>
				<td>${reservation.reg_time}</td>
				<td><span class="label
				 	<c:choose>
					<c:when test="${reservation.status == 'Y'}"> success </c:when>
					<c:when test="${reservation.status == 'W'}"> primary </c:when>
					<c:when test="${reservation.status == 'R'}"></c:when>
					</c:choose>
				">${reservation.status_name}</span>	
				</td>			
		</tr>
		</c:forEach>
	</tbody>
</table><!-- //table_basic -->

<!-- 페이지 -->
<div class="pagenate_wrap float_left">
	<ul class="pagenation">
		<c:out value="${pageNavigation}" escapeXml="false"/>
	</ul>
</div><!-- //pagenate_wrap -->