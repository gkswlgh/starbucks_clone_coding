<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- js소스파일:jQuery -->
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/header.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.animatecss.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/contents.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/footer.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/coffee.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/my_menu.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/gift_step1_tab.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="${pageContext.request.contextPath}/assets/js/gift_step2.js?time=<%=System.currentTimeMillis()%>"></script>
<script src="js/regex.js"></script>
<!-- validate 플러그인 참조 -->
<script src="plugins/validate/jquery.validate.min.js"></script>
<script src="plugins/validate/additional-methods.min.js"></script>