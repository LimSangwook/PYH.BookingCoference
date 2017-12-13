<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<jsp:include page="/WEB-INF/views/template/adminHeader.jsp" flush="true"/>	
</head>
<body>
<div class="wrapper login">
	<div class="login_wrap">
		<div class="login_header">
			<h1><img src="/assets/admin/img/login_logo.png" alt="신재생에너지 최적화 기상서비스"><span>관리자페이지</span></h1>
			<a href="/" class="banner_home">
				<span class="ico_home"></span>
				<span class="txt">한국기후변화연구원<br>홈페이지 바로가기</span>
			</a>
		</div>
		<div class="login_body">
			<div class="login_form">
				<fieldset>
					<legend>관리자로그인</legend>
					
					<form:form commandName="theForm" action="loginProc.do">

						<h2>LOGIN</h2>
						<ul>
							<li><form:input path="user_id" name="admin_id" class="" placeholder="아이디" title="아이디 입력"/></li>
							<li><input type="password" name="passwd" class="p_textbox" placeholder="비밀번호" title="비밀번호 입력"></li>
						</ul>
						<p><input type="checkbox" name="id_save"> 아이디 기억하기</p>
						<p><button class="btn_ok" style="cursor: pointer;">LOGIN</button></p>
						<p class="info_text"><span class="ico ico_info"></span>관리자 사이트는 한국기후변화연구원에서 <br>운영하고 있습니다.</p>
						
					</form:form>

				</fieldset>
			</div>
		</div>
		<div class="login_footer">
			<div class="copy_wrap">
			<p>(24265) 강원도 춘천시 중앙로 5 / TEL : 033-254-2129 / FAX : 033-254-2014 / E-mail : kric@kric.re.kr</p>
			<p>Copyright(C) 2012 CLIMATE CHANGE RESEARCH INSTITUTE OF KOREA. All rights reserved.</p>
			</div><!-- //copy_wrap -->
		</div>
	</div>
</div>

</body>
</html><!-- //하단부분 -->