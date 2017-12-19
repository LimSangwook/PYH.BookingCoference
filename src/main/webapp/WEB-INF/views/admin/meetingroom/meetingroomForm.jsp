<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<fieldset>
<legend></legend>

<form:form commandName="theForm" action="meetingroomSave.do">
<form:hidden path="act"/>
<form:hidden path="meetingroom_key"/>

<div id="hiddenSaveFileData"></div>
<div id="hiddenRemoveFileData"></div>		

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
				<form:input path="facility" title="주요시설" cssClass="col100" maxlength="255"/>
			</td>
		</tr>
		<tr>
			<th scope="row">색상</th>
			<td>
				<form:select path="color" title="색상" isNullCheck="true" class="rooms">
					<form:option class="room_1" value="room_1" label="색상1"/>						
					<form:option class="room_2" value="room_2" label="색상2"/>
					<form:option class="room_3" value="room_3" label="색상3"/>
					<form:option class="room_4" value="room_4" label="색상4"/>
					<form:option class="room_5" value="room_5" label="색상5"/>
					<form:option class="room_6" value="room_6" label="색상6"/>
					<form:option class="room_7" value="room_7" label="색상7"/>
					<form:option class="room_8" value="room_8" label="색상8"/>
					<form:option class="room_9" value="room_9" label="색상9"/>
					<form:option class="room_10" value="room_10" label="색상10"/>
				</form:select>
			</td>
		</tr>
	</tbody>
</table><!-- //table_basic -->
</form:form>
</fieldset>

<table class="table_form">
	<colgroup>
			<col style="width:20%;" />
			<col style="width:80%;" />
	</colgroup>
	<tbody>
		<tr>
			<th scope="row">사진</th>
			<td id="fileuploadArea">
				<jsp:include page="/WEB-INF/views/comm/attach_form_new.jsp"/>
			</td>
		</tr>
	</tbody>
</table>

<div class="btn_wrap float_right">
	<a href="meetingroomList.do" class="btn ">목록</a>
	<a href="javascript:viod(0);" class="btn primary btnSave">등록</a>
</div>

<script type="text/javascript">
$(function(){
	$('#fileuploadArea').css( "height", "+=25px" );
	var act = "${theForm.act}";
	
	// 등록/수정
	$('.btnSave').on('click',function(){
		if(formValidate()){
			if(act == 'update'){
				if(!confirm('수정하시겠습니까?')){
					return;
				}
			} else {
				if(!confirm('등록하시겠습니까?')){
					return;
				}
			}
			$('#theForm').submit();
		}
	});
	
	// 삭제
	$(".btnDelete").on("click",function(){
		if(confirm('삭제하시겠습니까?')){
			$('#deleteForm').submit();
		}
	});
	
	$('#color').change(
	    function (){
	        var color = $('option:selected',this).css('background-color');
	        $(this).css('background-color',color);
	    }
	).change();
	
});
</script>