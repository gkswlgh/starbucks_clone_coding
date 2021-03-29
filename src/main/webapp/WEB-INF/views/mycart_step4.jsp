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
                            <h1 class="f_32">장바구니</h1>
                            <ul class="smap">
                                <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/"><span class="en c222">장바구니</span></a></li>
                            </ul>
                        </div>
                    </div>
                </header>
                <!-- 서브타이틀 끝 -->
                <!-- 내용 -->
                <section class="card_gift_info_section">
                    <div class="card_gift_steps">
                        <div class="gift_bg_step4">
                            <span class="hid">장바구니 주문하기 (4단계)</span>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step1">장바구니</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step2">주문서 입력</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step3">결제 하기</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step_on icon_step4_on">결제 완료</strong>
                            </div>
                            <span class="hid">중 결제 완료 진행중</span>
                        </div>
                    </div>
                    <div class="gift_card_txt">
                        <h5 class="m0"><span class="user">회원</span>님의 결제가 정상적으로 완료되었습니다!</h5>
                    </div>
                    <div class="card_gift_payment">
                        <div class="anno">
                            딜리버리 서비스 이용 시 매장 상황에 따라 40분 이상 소요될 수 있습니다.<br>
                            (40분이 지나도 도착하지 않을 시 매장으로 직접 문의 바랍니다.)
                        </div>
                        <table summary="결제하기" class="payment_tb">
                            <caption class="hid">결제하기</caption>
                            <colgroup>
                                <col width="9.0909%">
                                <col width="40.9090%">
                                <col width="9.0909%">
                                <col width="40.9090%">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th class="fth">주소지</th>
                                    <td class="ftd cardName">경기도 광주시 어쩌구</td>
                                    <th class="fth">주문한 사람</th>
                                    <td class="ftd receiverInfo">이름 [전화번호]</td>
                                </tr>
                                <tr>
                                    <th>결제 금액</th>
                                    <td>10,000원</td>
                                    <th>결제수단</th>
                                    <td>신용카드</td>
                                </tr>
                                <tr>
                                    <td class="ltd" colspan="4">
                                        <p>총 결제금액: <span>10,000원</span></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="gift_pay_done_btns">
                            <ul>
                                <li class="gift_pay_done_btn1"><a href="${pageContext.request.contextPath}/">선물 계속하기</a></li>
                                <li class="gift_pay_done_btn2"><a href="${pageContext.request.contextPath}/">선물 내역 확인하기</a></li>
                            </ul>
                        </div>
                    </div>
                </section>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
</body>

</html>