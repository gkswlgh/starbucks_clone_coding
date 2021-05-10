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
        <header class="sub_tit_wrap sub_tit_wrap_short">
            <div class="sub_tit_bg_white">
                <div class="sub_tit_inner_short">
                    <h2>
                        <img src="//image.istarbucks.co.kr/common/img/msr/sceGift/egift_information_tit_20170823.jpg" alt="스타벅스 e-Gift Card 소개" />
                    </h2>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_card"><span class="en c222">Starbucks Cards</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_egift"><span class="en c222">스타벅스 e-Gift Card</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_egift"><span class="en c222">스타벅스 e-Gift Card 소개</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="wrapper">
            <div class="inner_card">
                <section class="scard_section scard_buy_section">
                    <p class="scard_visual">
                        <img src="//image.istarbucks.co.kr/common/img/msr/sceGift/egift_information_bar_20170823.png" alt="스타벅스만의 특별함, 스타벅스 카드를 소개합니다. 따뜻한 커피와 마음을 전하기 가장 좋은 방법! 스타벅스만의 특별한 충전식 선불카드 , 사용하면 할수록 다양한 혜택을 경험할 수 있습니다." class="w_pic">
                    </p>
                    <div class="scard_buy_inner">
                        <p class="tit1">스타벅스 <span class="en">e-Gift Card</span>란?
                        </p>
                        <p class="s_titl">
                            <span class="f_22 t_006633"><strong>축하, 감사, 응원 등 메시지와 함께 스타벅스 카드를 선물 할 수 있는 가장 빠르고, 간편한 방법!</strong></span><br><br>
                            홈페이지를 통해 스타벅스 카드
                            <span><a href="javascript:void(0);" required="login" class="t_006633 en" data-href="/my/gift_step1">[e-Gift Card 구매·선물]</a></span>이 가능합니다.<br><br><br>
                            스타벅스 카드 선물을 위해 실물 카드를 직접 구매 및 전달해야 하는 번거로움 없이 웹에서
                            선물하시려는 e-Mail으로 즉시 또는 예약(원하시는 날짜와 시간 지정)전송하실 수 있습니다.<br><br>
                            <strong class="cf66">※ 스타벅스 홈페이지 회원만 이용 가능하며, 자신에게도 선물하실 수 있습니다.</strong>
                        </p>
                        <div class="egift_stit">
                            <p class="stit">Step 1. 카드 선택</p>
                            <p class="t1" style="color: #333">카드 디자인을 선택하고
                                메시지를 작성해 주세요.</p>
                            <p class="stit">Step 2. 정보 입력</p>
                            <p class="t1" style="color: #333">선물하실 금액, 날짜,
                                전송방법(휴대폰 MMS 또는 e-mail)을
                                선택해 주세요.</p>
                            <p class="stit">Step 3. 결제</p>
                            <p class="t1" style="color: #333">결제수단 (신용카드, 실시간 계좌이체, 휴대폰 소액결제)을 선택하고 결제해 주세요.</p>
                            <p class="stit">Step 4. 결제 완료</p>
                            <p class="t1" style="color: #333">선물이 완료되었습니다.
                                선물내역을 확인해 주세요.</p>
                        </div>
                        <p class="tit1">스타벅스 <span class="en">e-Gift Card </span>사용 방법</p>
                        <p class="s_titl">
                            <span class="f_22 t_006633">온라인 혹은 오프라인 스타벅스 매장에서 사용할 수 있는 e-스타벅스 카드입니다.</span><br><br>
                            스타벅스 e-Gift Card는 실물 카드로 교환 하면 회원가입 없이도 즉시 사용할 수 있습니다. <br><br>스타벅스 회원이라면
                            <span><a href="javascript:void(0);" required="login" class="t_006633 en" data-href="/my/mycard_info_input">[카드 등록]</a></span>후, 더욱 편리하게 사용하세요.
                        </p>
                        <div class="sc_buy_wrap2">
                            <ul class="clear">
                                <li>
                                    <dl class="clear">
                                        <dt><img src="//image.istarbucks.co.kr/common/img/msr/scard/sc_buy_pic1.jpg" alt></dt>
                                        <dd>
                                            <p class="p1">카드 충전</p>
                                            <p class="p2">다양한 충전방법을 통해 간편하게
                                                <br>충전이 가능합니다.</p>
                                            <p class="btn">
                                                <a href="${pageContext.request.contextPath}/my/mycard_charge">바로가기</a>
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl class="clear">
                                        <dt><img src="//image.istarbucks.co.kr/common/img/msr/scard/sc_buy_pic2.jpg" alt></dt>
                                        <dd>
                                            <p class="p1">카드 등록</p>
                                            <p class="p2">카드 등록 후 리워드 서비스를 누리고
                                                <br>사용내역도 조회해보세요.</p>
                                            <p class="btn">
                                                <a href="${pageContext.request.contextPath}/my/mycard_info_input">바로가기</a>
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                                <li class="last">
                                    <dl class="clear">
                                        <dt><img src="//image.istarbucks.co.kr/common/img/msr/scard/sc_buy_pic2.jpg" alt></dt>
                                        <dd>
                                            <p class="p3">스타벅스 e-Gift Card
                                                <br>선물하기</p>
                                            <p class="g_btn">
                                                <a href="${pageContext.request.contextPath}/my/gift_step1">바로가기</a>
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                            </ul>
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