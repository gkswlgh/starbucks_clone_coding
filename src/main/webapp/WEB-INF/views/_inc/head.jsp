<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<% 
	/* 세션 유효시간 설정 -> 모든 페이지 개별설정*/
	session.setMaxInactiveInterval(120);
%>

<!doctype html>
<html>

<head>
    
<meta charset="UTF-8" />
    <title>Starbucks Coffee Korea</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
    <!--css소스파일-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/reset.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/slick-theme.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/animate.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/style.css?time=<%=System.currentTimeMillis()%>" />
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
    <!--모바일 아이콘-->
    <link rel="apple-touch-icon" href="${pageContext.request.contextPath}/assets/img/header/logo.png" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/header/logo.png" />

</head>
<script>
    // JS에서 사이트의 ContextPath를 식별하기 위해 변수값을 생성해 둔다.
    const ROOT_URL = "${pageContext.request.contextPath}";
</script>
<!-- js소스파일:jQuery -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.animatecss.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/regex.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
<script type="text/javascript" src="//kit.fontawesome.com/79c58b9006.js"></script>
<!-- ajax 플러그인 참조 -->
<script src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>
<!-- validate 플러그인 참조 -->
<script src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>


<body>