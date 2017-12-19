<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
  














	<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
	<title>한국기후변화연구원</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
	
	<meta name='description' content='한국기후변화연구원 서비스'>
	<meta name='keywords' content='한국기후, 기후변화'>
	
	<meta property="og:type" content="website">
	<meta property="og:title" content="한국기후변화연구원"><!-- SEO정보 : 사이트제목 -->
	<meta property="og:description" content="한국기후변화연구원 서비스"><!-- SEO정보 : 사이트내용 -->
		
		

	<!-- 네이버 노출 선호URL -->
	<link rel="canonical" href="http://www.kric.re.kr/portal/library/museumIntroduction/html.do"><!-- SEO정보 : 선호URL 추가요청 -->

	<!-- 구글 검색 노출 관련 부분 -->
	<meta name="google-site-verification" content="nJOC39OHvp-_569aJpQSFrsXkpfRadVV-HZybGojGeI" />
	<meta name="google-site-verification" content="L_pD5Id6Q7biIXX_eiD9zZsjoLpKa3vPeP5mM_KJjHE" />
	
	
	<link rel="stylesheet" href="/assets/comn/css/style.css">
	
	<script src="/assets/comn/js/jquery-1.12.4.min.js" type="text/javascript"></script>
	<script src="/assets/comn/js/slick.min.js" type="text/javascript"></script>
	<script src="/assets/comn/js/common.js" type="text/javascript"></script>
	
	<script src="/assets/plugin/jquery/jquery.number.js"></script>
	<script src="/assets/plugin/comm/common.js" type="text/javascript"></script>
	<script src="/assets/plugin/validate/form.validate.js" type="text/javascript"></script>
	<!-- Print Plugin-->
	<script src="/assets/plugin/print/jquery.print.js"></script>	

</head>  

<body>

<div class="popHead">
	<h1>예약정보</h1>
	<a href="#close" class="btnClose" onclick="window.close();"><span class="ico ico_close"></span>창닫기</a>
</div>
<div class="popBody">

	<table class="table_form">
		<caption>테이블</caption>
		<colgroup>
			<col style="width:15%">
			<col style="width:35%">
			<col style="width:15%">
			<col style="width:35%">
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">회의실</th>
				<td colspan="3">${detail.meetingroom_name}</td>

			</tr>
			<tr>
				<th scope="row">신청일</th>
				<td>${detail.reg_time}</td>
				<th scope="row">승인여부</th>
				<td>${detail.status_name}</td>
			</tr>
		<tr>
				<th scope="row">성명</th>
				<td colspan="3">${detail.name}</td>
			</tr>

		</tbody>
	</table>

</div><!-- //popBody -->

</body>
</html>