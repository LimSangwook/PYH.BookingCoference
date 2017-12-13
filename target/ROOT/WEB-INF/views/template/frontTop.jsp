<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<header>
	<div class="max1300">
    	<a href="/" class="logo"><img src="/assets/comn/img/logo.png" alt="한국기후변화연구원"></a>
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

			<c:if test="${step1.parent_menu_code eq siteLanguage and idx < 7}">
			
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
        <a href="" class="change_lang">English</a>
        <a href="#a" class="main_search"><em class="blind">검색</em></a>
        <a href="/front/homepage/site/html.do" class="sitemap_ico"><em class="blind">사이트맵</em></a>
        <a href="#menu" id="toggle"><span></span></a>
      </div>
      <div class="sub_bg">
        <div class="">
          <div id="view_text"></div>
          <img class="sub_bg_img" src="/assets/comn/img/sub_bg_img.png" alt="그림">
        </div>
      </div>
 	</header>   
     <section class="search_section" style="display: none;">
        <div class="max1300">
          <div class="search_layout">
            <div class="search_select">
              <select class="col100" name="">
                <option value="">전체</option>
                <option value="">기타</option>
              </select>
            </div>
            <div class="search_text">
              <input type="text" name="" value="" class="col100" placeholder="검색어를 입력해 주세요.">
            </div>
            <div class="all_search">
              <button type="button" name="button" class="col100"><span></span>검색</button>
            </div>
          </div>
          <a href="#a" class="search_close"></a>
        </div>
      </section>
   <!-- //헤더영역 -->