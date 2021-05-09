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
                        선물내역
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my_starbucks"><span class="en">My Starbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_egift"><span class="en">My 스타벅스 e-Gift Card</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/egift_card"><span class="en">선물내역</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <!-- 선물내역보기 -->
                <!-- 내역 상세 -->
                <section class="egiftCard_view_wrap">
                    <div class="ec_title2">
                        <p>
                            <strong>
                                선물 번호 :
                                <span class="en">${output.gift_id}</span>
                            </strong>
                        </p>
                    </div>
                    <article class="ec_view_mid clear">
                        <p class="img"><img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt="e-Gift 카드"></p>
                        <div class="info_text">
                            <ul class="info_text_ul">
                                <li>
                                    <strong>받는 사람 : </strong>
                                    ${output.to_mem_name} [ ${output.to_mem_email} ]
                                </li>
                                <li>
                                    <strong>주문 금액 : </strong>
                                    <span class="cf66">${output.gift_price}원</span>
                                </li>
                            </ul>
                            <p class="ec_message">${output.message}</p>
                        </div>
                    </article>
                </section>
                <section class="egiftCard_view_poin">
                    <ul class="text_list clear">
                        <li class="list01 clear">
                            <strong>선물 번호 : </strong>
                            <span>${output.gift_id}</span>
                        </li>
                        <li class="list02 clear">
                            <strong>결제 일시 : </strong>
                            <span class="cf66">${output.reg_date}</span>
                        </li>
                        <li class="list03 clear">
                            <strong>결제 수단 : </strong>
                            <span>신용카드</span>
                        </li>
                        <li class="list04 clear">
                            <strong>전송 시간 : </strong>
                            <span>${output.reg_date}</span>
                        </li>
                        <li class="list05 clear">
                            <strong>결제 금액 : </strong>
                            <span>${output.gift_price}원</span>
                        </li>
                    </ul>
                </section>
                <!-- 내역 상세 끝 -->
                            <div class="egiftCard_btnZone clear">
                                <p class="btn_list">
                                    <a href="${pageContext.request.contextPath}/my/egift_card">목록</a>
                                </p>
                            </div>
                <!-- 선물내역보기 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>