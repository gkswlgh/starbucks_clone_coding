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
                        <img src="//image.istarbucks.co.kr/common/img/msr/scard/tit1.jpg" alt="스타벅스 카드 소개" />
                    </h2>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en c222">Starbucks Cards</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en c222">스타벅스 카드</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en c222">스타벅스 카드 소개</span></a></li>
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
                        <img src="//image.istarbucks.co.kr/common/img/msr/scard/scard_main_bn.jpg" alt="스타벅스만의 특별함, 스타벅스 카드를 소개합니다. 따뜻한 커피와 마음을 전하기 가장 좋은 방법! 스타벅스만의 특별한 충전식 선불카드 , 사용하면 할수록 다양한 혜택을 경험할 수 있습니다." class="w_pic">
                    </p>
                    <div class="scard_buy_inner">
                        <p class="tit1">스타벅스 카드 구매방법</p>
                        <p class="stit">매장 구매</p>
                        <p class="t1">스타벅스 카드는 스타벅스 매장에서 구매 가능합니다. (일부 매장 제외)</p>
                        <ul class="info mb20">
                            <li>충전, 재충전, 결제 가능 매장 : 스타벅스 전국 매장 (충전 불가 매장 제외)</li>
                            <li>충전 불가 매장 (결제만 가능) : 백화점 및 시즌 매장 등 일부 매장</li>
                            <li>충전 및 결제 불가 매장 (총 10개) : 시즌 매장 (대명오션월드 1,2점), 외화 매장 (용산 미8군점, 용산 타운하우스점, 오산 에어베이스점, 평택 험프리점, 대구 캠프워커점,
                                <br>군산 에어베이스점, 캠프캐롤점, 캠프케이시점)
                            </li>
                            <li>스타벅스 카드를 구매할 수 있는 가까운 매장을 확인 해 보세요.</li>
                        </ul>
                        <div class="sc_buy_wrap">
                            <ul class="clear">
                                <li>
                                    <dl class="clear">
                                        <dt><img src="//image.istarbucks.co.kr/common/img/msr/scard/sc_buy_pic1.jpg" alt></dt>
                                        <dd>
                                            <p class="p1">카드 충전</p>
                                            <p class="p2">다양한 충전방법을 통해 간편하게
                                                <br>충전이 가능합니다.</p>
                                            <p class="btn">
                                                <a href="javascript:void(0);" required="login" data-href="/my/mycard_charge.do">바로가기</a>
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
                                                <a href="javascript:void(0);" required="login" data-href="/my/mycard_info_input.do">바로가기</a>
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
                                                <a href="javascript:void(0);" required="login" data-href="/msr/sceGift/gift_step1.do">바로가기</a>
                                            </p>
                                        </dd>
                                    </dl>
                                </li>
                            </ul>
                        </div>
                        <p class="stit">온라인 구매</p>
                        <p class="t1">스타벅스 e-Gift Card는 언제 어디서나 온라인으로 구매하실 수 있습니다. 스타벅스 e-Gift Card를 통해 마음을 전해보세요.</p>
                        <ul class="info mb30">
                            <li>스타벅스 홈페이지 회원이라면 홈페이지, 모바일 애플리케이션을 통해 스타벅스 e-Gift Card를 구매하실 수 있습니다.</li>
                            <li>5천원 이상부터 구매 가능하며, 1만원 이상부터는 1만원 단위로 최대 50만원까지 가능합니다.</li>
                            <li>신용카드, 실시간 계좌이체(홈페이지, 모바일 애플리케이션)를 통해 결제할 수 있습니다.</li>
                            <li>e-mail을 통해 선물하실 수 있습니다.</li>
                        </ul>
                    </div>
                </section>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
</body>

</html>