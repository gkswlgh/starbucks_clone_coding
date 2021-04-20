<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <div id="container">
        <!-- 서브타이틀 -->
        <header class="sub_tit_wrap">
            <div class="sub_tit_bg">
                <div class="sub_tit_inner">
                    <h4>
                        <img src="//image.istarbucks.co.kr/common/img/util/reward/ms_suggestion_ttl.png" alt="고객의 소리" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">고객의 소리</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="find_mem_wrap">
            <div class="find_mem_inner">
                <div class="find_mem_ttl">접수가 완료되었습니다.</div>
                <section class="find_mem_form">
                    <div class="find_mem bd_none">
                        <div class="find_mem_input_box bd_none">
                            <div class="mem_result_txt">
                                <span class="result_txt_sub">답변 완료 시 입력하신 이메일 주소로
                                    메일을 발송해 드립니다.</span>
                            </div>
                            <br />
                            <p class="btn_find_mem">
                                <a href="${pageContext.request.contextPath}/my_starbucks/voclist">내 문의 내역 확인하러 가기</a>
                            </p>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>