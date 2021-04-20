<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<div id="container"></div>
    <div class="find_mem_wrap">
        <div class="find_mem_inner">
            <div class="find_mem_ttl">아이디 찾기</div>
            <section class="find_mem_form">
                <div class="find_mem_result">
                    <div class="find_mem_sally"></div>
                </div>
                <div class="find_mem bd_none">
                    <strong>아이디 확인</strong>
                    <div class="find_mem_input_box bd_none">
                        <div class="mem_result_txt">
                            <span class="result_txt_sub">사용자님의 아이디는 ${output.user_id}입니다.
                            </span>
                        </div>
                        <p class="btn_find_mem">
                            <button id="goLogin">로그인 페이지로 이동</button>
                        </p>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {
    	
    	// .로그인 페이지로 이동.
    	$("#goLogin").click(function(e) {
            window.location = ROOT_URL + '/account/login';
	    });
    	
    });
    </script>
</body>

</html>