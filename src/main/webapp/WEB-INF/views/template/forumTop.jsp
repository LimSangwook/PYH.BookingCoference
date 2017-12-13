<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
		<header>
          <div class="max1200">
            <a href="/" class="logo"><img src="/assets/comn/img/logo.png" alt="강원지방기상청"></a>
		<nav class="main_nav">
   	    <!-- GNB메뉴 -->
   	    <ul>
	   	    <c:set var="idx" value="0"/>
			<c:set var="step1Tot" value="0"/>
			<c:forEach var="step1" items="${leftMenuList}" varStatus="i">
			<c:if test="${step1.parent_menu_code eq siteLanguage}">
				<c:set var="step1Tot" value="${step1Tot + 1}"/>
			</c:if>
			</c:forEach>
			
			<c:forEach var="step1" items="${leftMenuList}" varStatus="i">
			<!-- 연결주소세팅 -->
			<c:choose>
			<c:when test="${empty step1.link_address}"><c:set var="step1LinkAddress" value="#"/></c:when>
			<c:when test="${fn:indexOf(step1.link_address,'javascript:') != -1 or fn:indexOf(step1.link_address,'http') != -1}"><c:set var="step1LinkAddress" value="${step1.link_address}"/></c:when>
			<c:otherwise><c:set var="step1LinkAddress" value="${step1.link_address}"/></c:otherwise>
			</c:choose>
			<!-- 새창열림세팅 -->
			<c:choose>
			<c:when test="${step1.is_new_window eq 'Y'}"><c:set var="step1Target" value="target='_blank'"/></c:when>
			<c:otherwise><c:set var="step1Target" value=""/></c:otherwise>
			</c:choose>
			 
			<c:if test="${step1.parent_menu_code eq siteLanguage and idx < 5}">
			
			<li>
				<a href="${step1LinkAddress}" ${step1Target} <c:if test="${depth1MenuInfo.menu_code eq step1.menu_code}">class="on"</c:if>><c:out value="${step1.menu_name}"/><span class="m_menu_ico">></span></a>
				
				<c:forEach var="step2" items="${step1.children_menu_list}" varStatus="k">
					<c:if test="${k.index eq 0}">
			    		<ul class="depth_menu <c:if test="${idx eq 0}"></c:if>">
			    	</c:if>
					
						<!-- 연결주소세팅 -->
						<c:choose>
			    		<c:when test="${empty step2.link_address}"><c:set var="step2LinkAddress" value="#"/></c:when>
			    		<c:when test="${fn:indexOf(step2.link_address,'javascript:') != -1 or fn:indexOf(step2.link_address,'http') != -1}"><c:set var="step2LinkAddress" value="${step2.link_address}"/></c:when>
			    		<c:otherwise><c:set var="step2LinkAddress" value="${step2.link_address}"/></c:otherwise>
			    		</c:choose>
			    		<c:choose>
			    		<c:when test="${step2.is_new_window eq 'Y'}"><c:set var="step2Target" value="target='_blank'"/></c:when>
			    		<c:otherwise><c:set var="step2Target" value=""/></c:otherwise>
			    		</c:choose>
			    			    		    				
						<li><a href="${step2LinkAddress}" ${step2Target} <c:if test="${depth2MenuInfo.menu_code eq step2.menu_code}">class="on"</c:if>><c:out value="${step2.menu_name}"/></a></li>
		    		
		    		<c:if test="${fn:length(step1.children_menu_list) eq k.count}">
						</ul>
					</c:if>
			    </c:forEach>
			</li>
			<c:set var="idx" value="${idx + 1}"/>
			</c:if>
			</c:forEach>
   	    </ul>
   	</nav>
   	<a href="/forum/homepage/site/html.do" class="sitemap_ico"><em class="blind">사이트맵</em></a>
     <a href="#menu" id="toggle"><span></span></a>
   </div>
   <div class="sub_bg">
     <div class="max1200">
       
     </div>
   </div>

 </header>   
 
   <!-- //헤더영역 -->