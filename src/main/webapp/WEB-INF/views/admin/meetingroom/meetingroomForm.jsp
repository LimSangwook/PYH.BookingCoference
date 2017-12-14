<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<fieldset>
<legend></legend>
<form:form commandName="theForm" action="userSave.do">

	<table class="table_form">
	<caption>회의실 등록</caption>
	<colgroup>
			<col style="width:20%;" />
			<col style="width:80%;" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">회의실명</th>
			<td>
				<form:input path="name" title="회의실명" cssClass="wid300" isNullCheck="true" maxlength="50"/>
			</td>
		</tr>
		<tr>
			<th scope="row">노출여부</th>
			<td>
				<form:select path="publish" title="노출여부 선택" isNullCheck="true">
					<form:option value="1" label="노출"/>
					<form:option value="0" label="비노출"/>
				</form:select>
			</td>
		</tr>
		<tr>
			<th scope="row">실 형태</th>
			<td>
				<form:input path="type" title="실 형태" cssClass="wid300" maxlength="30"/>
			</td>
		</tr>
		<tr>
			<th scope="row">평수</th>
			<td>
				<form:input path="size" title="평수" cssClass="wid100 textAlign_right" maxlength="3"/> 평
			</td>
		</tr>
		<tr>
			<th scope="row">최대수용인원</th>
			<td>
				<form:input path="max_capacity" title="최대수용인원" cssClass="wid100 textAlign_right" maxlength="3"/> 명
			</td>
		</tr>
		<tr>
			<th scope="row">금액</th>
			<td>
				<form:input path="hourly_price" title="금액" cssClass="wid100 textAlign_right" maxlength="8"/> 원
			</td>
		</tr>
		<tr>
			<th scope="row">주요시설</th>
			<td>
				<form:input path="facility" title="주요시설" cssClass="col100" maxlength="8"/>
			</td>
		</tr>
		<tr>
			<th scope="row">사진</th>
			<td>
				<div class="uploadBox">
					<div class="preview">
						<p><img src="../../comn/img/noPhoto2.png" alt="썸네일이미지"></p>
						<a href="#" class="btn btn_xsmall">파일찾기</a>
					</div>
					<div class="fileList">
						<ul>
							<li><a href="#">image.png</a><span class="">(9.04MB)</span> <a href="#" class="btn btn_xsmall">삭제</a></li>
							<li class="on"><a href="#">image.png</a><span class="">(9.04MB)</span> <a href="#" class="btn btn_xsmall">삭제</a></li>
							<li><a href="#">image.png</a><span class="">(9.04MB)</span> <a href="#" class="btn btn_xsmall">삭제</a></li>
							<li><a href="#">image.png</a><span class="">(9.04MB)</span> <a href="#" class="btn btn_xsmall">삭제</a></li>
							<li><a href="#">image.png</a><span class="">(9.04MB)</span> <a href="#" class="btn btn_xsmall">삭제</a></li>
						</ul>
					</div>
				</div><!-- //uploadBox -->
			</td>
		</tr>
	</tbody>
</table><!-- //table_basic -->

<div class="btn_wrap float_right">
	<a href="room.html" class="btn ">목록</a>
	<button type="submit" class="btn primary">등록</button>
</div>

</form:form>
</fieldset>