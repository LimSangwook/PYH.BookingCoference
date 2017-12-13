<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<c:if test="${!empty boardConfig.top_content}">
	<c:out value="${boardConfig.top_content}" escapeXml="false"/>
</c:if>

<c:if test="${depth1MenuInfo.menu_code eq 'brand'}">
<div class="brand_content">
</c:if>