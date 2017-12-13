<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
		
<!doctype html>
<html lang="ko">
<head>
  <tiles:insertAttribute name="header" flush="true"/>
</head>  
<body>


<div class="wrapper">
	<!-- 헤더영역 -->
	<tiles:insertAttribute name="top" flush="true"/>
	<!-- 헤더영역 -->
	
	<!-- 콘테이너 -->
	<div id="container">
		<!-- 서브메뉴 -->
		<tiles:insertAttribute name="subMenu" flush="true"/>
		<!-- 서브메뉴 -->
		
		<section class="contents">
			<div class="max1300">
			<tiles:insertAttribute name="menuTitle" flush="true"/>
			
			<section class="description_section"> <!--description_section -->
				<tiles:insertAttribute name="content" flush="true"/>
            </section> <!-- description_section -->
            
          </div>
        </section>
      </div> <!-- container -->
	<!-- 콘테이너 -->
	
	<!-- 푸터영역 -->
		<tiles:insertAttribute name="footer" flush="true"/>
	<!-- 푸터영역 -->
</div>	
</body>
</html>