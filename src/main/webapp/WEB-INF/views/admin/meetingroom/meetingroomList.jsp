<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
<link rel="stylesheet" href="/assets/admin/css/slick.css">
<script src="/assets/admin/js/slick.min.js" type="text/javascript"></script>
<div class="mr_list">	
	<c:forEach var="data" items="${result}" varStatus="status">
	<section>
		<div class="mr_photo">
			<div class="slider_for slickFor_mr_${status.index}" id="slickFor_mr_${status.index}">
				<c:forEach var="file" items="${data.fileList}" varStatus="substatus">
					<div><img src="http://localhost:8080/upload/thumb${file.file_path}${file.save_file_name}" alt="meetingroom img" /></div>
				</c:forEach>
			</div>
			<div class="slider_nav slickNav_mr_${status.index}">
				<c:forEach var="file" items="${data.fileList}" varStatus="j">
					<div><img src="http://localhost:8080/upload/thumb${file.file_path}${file.save_file_name}" alt="meetingroom img" /></div>
				</c:forEach>
			</div>
			<div class="slider_btn">
				<button type="button" class="slider_btn_prev slickPrev_mr_${status.index}"></button>
				<button type="button" class="slider_btn_next slickNext_mr_${status.index}"></button>
			</div>
		</div>
		<script type="text/javascript">
		$(document).ready(function(){
	
			//회의실1
			$('.slickFor_mr_${status.index}').slick({
				slidesToShow: 1, slidesToScroll: 1, arrows: false, dots: false, fade: true, speed: 100, cssEase: 'linear', 
				asNavFor: '.slickNav_mr_${status.index}'
			});
			$('.slickNav_mr_${status.index}').slick({
				slidesToShow: 3, slidesToScroll: 1, arrows: false, dots: false, infinite: true, touchMove:true, focusOnSelect: true,
				asNavFor: '.slickFor_mr_${status.index}'
			});
			$('.slickPrev_mr_${status.index}').on('click', function(){
				$(".slickFor_mr_${status.index}").slick('slickPrev');
			});
			$('.slickNext_mr_${status.index}').on('click', function(){
				$(".slickFor_mr_${status.index}").slick('slickNext');
			});
		});
		</script>
		<div class="mr_con">
			<dl>
				<dt>${data.name} <span class="label <c:if test="${1 eq data.publish}">primary</c:if>" >${data.publish_name}</span> </dt>
				<dd>
					<ul>
						<li><span class="title">실형태</span> ${data.type}</li>
						<li><span class="title">평수</span> ${data.size}평</li>
						<li><span class="title">수용인원</span> 최대 ${data.max_capacity}명</li>
						<li><span class="title">금액</span> 시간당 ${data.hourly_price}원</li>
						<li><span class="title">주요시설</span> ${data.facility}</li>
					</ul>
					<div class="btn_wrap">
						<a href="meetingroomForm.do?meetingroom_key=${data.meetingroom_key}" class="btn btn_xsmall">수정</a>
						<a href="javascript:void(0);" onclick="deleteMeetingroom('${data.meetingroom_key}')" class="btn btn_xsmall">삭제</a>
					</div>
				</dd>
			</dl>
		</div>
	</section>
	</c:forEach>
</div>

<!-- 페이지 -->
<div class="pagenate_wrap float_left">
	<ul class="pagenation">
		<c:out value="${pageNavigation}" escapeXml="false"/>
	</ul>
</div><!-- //pagenate_wrap -->

<div class="btn_wrap float_right">
	<a href="meetingroomForm.do" class="btn primary">등록</a>
</div>


<form:form id="deleteForm" commandName="theForm" action="meetingroomSave.do">
<form:hidden path="act" id="deleteAct" value="delete"/>
<form:hidden path="meetingroom_key"/>
</form:form>

<script>	
	function deleteMeetingroom(meetingroomKey){
		if(confirm('삭제하시겠습니까?')){
			$("input[name='meetingroom_key']").val(meetingroomKey);
			$('#deleteForm').submit();
		}
	}
</script>