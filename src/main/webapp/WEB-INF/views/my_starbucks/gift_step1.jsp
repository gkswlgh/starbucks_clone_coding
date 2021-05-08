<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <div id="container">
        <div class="wrapper">
            <div class="gift_inner">
                <!-- 서브타이틀 -->
                <header class="sub_tit_wrap sub_tit_wrap_short2">
                    <div class="sub_tit_bg_white2">
                        <div class="sub_tit_inner_short2">
                            <h2>
                                <img src="//image.istarbucks.co.kr/common/img/msr/sceGift/gift_ttl.png" alt="선물하기" />
                            </h2>
                            <ul class="smap">
                                <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/starbucks_card/about_card"><span class="en c222">Starbucks Cards</span></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/starbucks_card/about_egift"><span class="en c222">스타벅스 e-Gift Card</span></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/my/gift_step1"><span class="en c222">선물하기</span></a></li>
                            </ul>
                        </div>
                    </div>
                </header>
                <!-- 서브타이틀 끝 -->
                <!-- 내용 -->
                <section class="card_gift_section">
                    <div class="card_gift_steps">
                        <div class="gift_bg_step1">
                            <span class="hid">스타벅스 카드 선물하기 (4단계)</span>
                            <div class="gift_step_each">
                                <strong class="icon_step_on icon_step1_on">카드 선택</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step2">정보 입력</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step3">결제 하기</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step4">결제 완료</strong>
                            </div>
                            <span class="hid">중 카드 선택 진행중</span>
                        </div>
                    </div>
                    <div class="gift_card_txt">
                        <h5>카드를 클릭해서 정보 입력 페이지로 넘어가세요.</h5>
                    </div>
                    <div class="gift_card_list_wrap">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/my/gift_step2" class="goStep2"><img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt="Sweet Valentine"><span class="en">White Siren e-Gift</span></a></li>
                        </ul>
                    </div>
                </section>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <!-- 사용자 자바스크립트 -->
    <script type="text/javascript">
    </script>
</body>

</html>