<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

	<c:forEach var="step1" items="${leftMenuList}">
		<c:if test="${step1.menu_code eq depth1MenuInfo.menu_code}">
			<c:set var="depth1Name" value="${step1.menu_name}"/>
			<!-- 연결주소 설정 -->
			<c:choose>
				<c:when test="${empty step1.link_address}"><c:set var="step1LinkAddress" value="#"/></c:when>
				<c:when test="${fn:indexOf(step1.link_address,'javascript:') != -1 or fn:indexOf(step1.link_address,'http') != -1}">
					<c:set var="step1LinkAddress" value="${step1.link_address}"/>
				</c:when>
				<c:otherwise>
					<c:set var="step1LinkAddress" value="${step1.link_address}"/>
				</c:otherwise>
	   		</c:choose>
			<!-- 새창열림 설정 -->
	   		<c:choose>
	   			<c:when test="${step1.is_new_window eq 'Y'}">
					<c:set var="step1Target" value="target='_blank'"/>
				</c:when>
	   			<c:otherwise>
					<c:set var="step1Target" value=""/>
				</c:otherwise>
	   		</c:choose>
	   		
			<c:forEach var="step2" items="${step1.children_menu_list}" varStatus="i">
				<c:if test="${step2.menu_code eq depth2MenuInfo.menu_code}">
					<!-- 연결주소 설정 -->
					<c:choose>
						<c:when test="${empty step2.link_address}"><c:set var="step2LinkAddress" value="#"/></c:when>
						<c:when test="${fn:indexOf(step2.link_address,'javascript:') != -1 or fn:indexOf(step2.link_address,'http') != -1}">
							<c:set var="step2LinkAddress" value="${step2.link_address}"/>
						</c:when>
						<c:otherwise>
							<c:set var="step2LinkAddress" value="${step2.link_address}"/>
						</c:otherwise>
		    		</c:choose>
					<!-- 새창열림 설정 -->
		    		<c:choose>
		    			<c:when test="${step2.is_new_window eq 'Y'}">
							<c:set var="step2Target" value="target='_blank'"/>
						</c:when>
		    			<c:otherwise>
							<c:set var="step2Target" value=""/>
						</c:otherwise>
		    		</c:choose>
	    			<c:set var="depth2Name" value="${step2.menu_name}"/>
	    		</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>	


		  <div class="sub_gnb"> <!-- sub_gnb-->
            <div class="max1200">
              <ul>
                <li><a href="/"><span class="home_ico"></span> HOME</a></li>
                <li><a href="${step1LinkAddress}" ${step1Target}> <span><c:out value="${depth1Name}"/></span></a></li>
                <li><a href="${step2LinkAddress}" ${step2Target}> <span><c:out value="${depth2Name}"/></span></a></li>
              </ul>
            </div>  
          </div><!-- sub_gnb-->
          