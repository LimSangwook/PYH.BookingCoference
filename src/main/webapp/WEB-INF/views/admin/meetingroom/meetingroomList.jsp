<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<div class="mr_list">	
	<c:forEach var="data" items="${result}" varStatus="i">
	<section>
		<div class="mr_photo">
			<div class="slider_for slickFor_mr_1">
				<div><img src="../../comn/img/meetingroom_1.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_2.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_3.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_4.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_5.jpg" alt="" /></div>
			</div>
			<div class="slider_nav slickNav_mr_1">
				<div><img src="../../comn/img/meetingroom_1.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_2.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_3.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_4.jpg" alt="" /></div>
				<div><img src="../../comn/img/meetingroom_5.jpg" alt="" /></div>
			</div>
			<div class="slider_btn">
				<button type="button" class="slider_btn_prev slickPrev_mr_1"></button>
				<button type="button" class="slider_btn_next slickNext_mr_1"></button>
			</div>
		</div>
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
						<a href="#" class="btn btn_xsmall">삭제</a>
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