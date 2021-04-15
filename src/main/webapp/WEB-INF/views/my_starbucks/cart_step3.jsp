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
                        <div class="gift_bg_step3">
                            <span class="hid">장바구니 주문하기 (4단계)</span>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step1">장바구니</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step2">주문서 입력</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step_on icon_step3_on">결제 하기</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step4">결제 완료</strong>
                            </div>
                            <span class="hid">중 결제 하기 진행중</span>
                        </div>
                    </div>
                    <div class="gift_card_txt">
                        <h5 class="m0">결제 하기 전, 최종 확인해보세요!</h5>
                    </div>
                    <table class="order_list_tbl" summary="상품정보, 수량, 가격에 대한 테이블">
                        <colgroup>
                            <col width="100">
                            <col width="500">
                            <col width="200">
                            <col width="200">
                            <col width="100">
                        </colgroup>
                        <thead>
                            <tr>
                                <th class="en">No</th>
                                <th scope="col">상품 정보</th>
                                <th scope="col" class="cart_qnt">수량</th>
                                <th scope="col" class="cart_price">
                                    <div>상품 가격</div>
                                </th>
                                <th scope="col" class="cart_selling">
                                    <div>최종 금액</div>
                                </th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr data-unit-price="25000">
                                <td>1</td>
                                <td class="cart_ttl2">
                                    <input type="hidden" data-item-name="상품이름" data-item-price="상품가격" data-item-id="상품번호">
                                    <div class="ttl2_wrap clear">
                                        <div class="ttl2_thumb">
                                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2016/04/[9200000000044]_20160415132044486.jpg" alt />
                                        </div>
                                        <div class="ttl2_cell">
                                            <a href="${pageContext.request.contextPath}/" class="ttl2_name">블렌드 어쩌구</a>
                                        </div>
                                    </div>
                                </td>
                                <td class="cart_qnt2">
                                    <label for="n0" class="hid">수량</label>
                                    <div class="qnt_box">
                                        <span>1</span>
                                    </div>
                                </td>
                                <td class="cart_price2">
                                    <span class="num">25,000</span>
                                    <i class="unit">원</i>
                                </td>
                                <td class="cart_selling2">
                                    <span class="label">최종금액</span>
                                    <span class="price">
                                        <b class="num x-row-net">25,000</b>
                                        <i class="unit">원</i>
                                    </span>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <div class="card_gift_payment cart">
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
                        <div class="gift_payment_btns cart">
                            <ul>
                                <li class="gift_payment_btn3"><a href="${pageContext.request.contextPath}/">결제하기</a></li>
                                <li class="gift_payment_btn1"><a href="${pageContext.request.contextPath}/">뒤로</a></li>
                            </ul>
                        </div>
                    </div>
                </section>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>