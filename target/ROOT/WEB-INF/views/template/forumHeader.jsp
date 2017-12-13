<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/comm/taglib.jsp"%>

<c:set var="GLOBAL_USER_NAME" value="${sessionScope.YWMUSEUM_LOGIN_SESSION_KEY.user_name}" scope="application"/>
<c:set var="GLOBAL_USER_ID" value="${sessionScope.YWMUSEUM_LOGIN_SESSION_KEY.user_id}" scope="application"/>
<c:set var="GLOBAL_USER_AUTH" value="${sessionScope.YWMUSEUM_LOGIN_SESSION_KEY.auth_level}" scope="application"/>
<c:set var="CTX" value="${pageContext.request.contextPath}" scope="application"/>

<c:set var="GLOBAL_SITE_TITLE">
<c:forEach var="data" items="${menuLocationList}" varStatus="i">
	<c:if test="${i.index > 0}">&gt;</c:if>
	${data.menu_name}			
</c:forEach>
</c:set>

	<meta charset="utf-8">
  	<title></title>
  	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">	
	
	
	<meta name='description' content='<c:out value="${GOBAL_SITE_SEO_INFO.content}"/>'>
	<meta name='keywords' content='<c:out value="${GOBAL_SITE_SEO_INFO.keyword}"/>'>
	
	<meta property="og:type" content="website">
	<meta property="og:title" content="<c:out value="${GOBAL_SITE_SEO_INFO.title}"/>"><!-- SEO정보 : 사이트제목 -->
	<meta property="og:description" content="<c:out value="${GOBAL_SITE_SEO_INFO.content}"/>"><!-- SEO정보 : 사이트내용 -->
		
	<c:if test="${linkAddress eq 'index'}">
		<meta property="og:image" content="<c:out value="${GOBAL_SITE_SEO_INFO.homepage}"/>/assets/portal/images/common/logo_portal.gif"><!-- SEO정보 : 로고URL 추가요청 -->
		<meta property="og:url" content="<c:out value="${GOBAL_SITE_SEO_INFO.homepage}"/>"><!-- SEO정보 : 홈페이지주소 -->
	</c:if>
	
	<link rel="stylesheet" href="/assets/comn/css/style.css">
	<script src="/assets/comn/js/jquery-1.12.4.min.js" type="text/javascript"></script>
	<script src="/assets/comn/js/slick.min.js" type="text/javascript"></script>
	<script src="/assets/comn/js/common.js" type="text/javascript"></script>
	
	<script src="/assets/plugin/jquery/jquery.number.js"></script>
	<script src="/assets/plugin/comm/common.js" type="text/javascript"></script>
	<script src="/assets/plugin/validate/form.validate.js" type="text/javascript"></script>
	<!-- Print Plugin-->
	<script src="/assets/plugin/print/jquery.print.js"></script>	

<script type="text/javascript">
//로그인아이디
var GLOBAL_USER_ID = "${GLOBAL_USER_ID}";
var ctx = "${CTX}";
//업로드서버경로
var uploadDefaultUrl = "${uploadDefaultUrl}"; 
//섬네일 이미지 기본폴더명
var uploadImgThumbDir = "${uploadImgThumbDir}";
//에디터 이미지 기본폴더명
var uploadImgEditorDir = "${uploadImgEditorDir}";
//sns 페이스북 API 키
var snsFacebookApiKey = "${snsFacebookApiKey}";
// sns 카카오톡 API 키
var snsKakaoApiKey ="${snsKakaoApiKey}";
// 모바일접근여부
var isMobileAccess = "${isMobileAccess}";

// 로그아웃
function fnLogout(){	
	window.location.href = ctx+"/portal/logout.do";
}

//ajaxRes
var ajaxRes;
function ajaxCall(data, url){
	ajaxRes = $.ajax({
		data:data,
		url : url,
		type:"post",
		dataType:"json",
		beforeSend: function(){
			// beforeSend
		},
		error: function(e) {
			alert("일시적인 오류가 발생하였습니다.");
		},		
		complete: function(){
			// complete
		}
	});
}
jQuery(function(){
	// 프린트
	jQuery('.btnPrint').on('click', function(e) {
		e.preventDefault();
		jQuery("#printArea").print();
  	});
});
</script>