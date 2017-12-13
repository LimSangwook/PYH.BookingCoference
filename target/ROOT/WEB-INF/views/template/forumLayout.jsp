<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>
		
<!doctype html>
<html lang="ko">
<head>
  <tiles:insertAttribute name="header" flush="true"/>
</head>  
<body>


	<div id="wrap">
	<!-- 헤더영역 -->
	<tiles:insertAttribute name="top" flush="true"/>
	<!-- 헤더영역 -->
			<div id="sub_container">
				<tiles:insertAttribute name="subMenu" flush="true"/>
				
				<tiles:insertAttribute name="content" flush="true"/>
			</div>
	<!-- 푸터영역 -->
		<tiles:insertAttribute name="footer" flush="true"/>
	<!-- 푸터영역 -->
    </div>
  <div class="bg_black" style="display: none;"></div>
  <script src="https://rendro.github.io/easy-pie-chart/javascripts/jquery.easy-pie-chart.js"></script>
  <script type="text/javascript">
    $(function() {
      $('.circle-graph').easyPieChart({
        scaleColor: false,
        lineWidth: 10,
        lineCap: 'butt',
        barColor: '#fff',
        trackColor: '#96b6d2',
        size: 250,
        animate: 800
      });
    });
  </script>
</body>
</html>