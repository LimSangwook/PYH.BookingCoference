<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>


<div class="popHead">
	<h1>예약정보</h1>
	<a href="#close" class="btnClose" onclick="window.close();"><span class="ico ico_close"></span>창닫기</a>
</div>
<div class="popBody">

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
				<th scope="row">회의실</th>
				<td colspan="3"><c:out value="${detail.meetingroom_name}" /></td>

			</tr>
			<tr>
				<th scope="row">신청일</th>
				<td><c:out value="${detail.reg_time}" /></td>
				<th scope="row">승인여부</th>
				<td><c:out value="${detail.status_name}" /></td>
			</tr>
		<tr>
				<th scope="row">성명</th>
				<td colspan="3"><c:out value="${detail.name}" /></td>
			</tr>

		</tbody>
	</table>

</div><!-- //popBody -->