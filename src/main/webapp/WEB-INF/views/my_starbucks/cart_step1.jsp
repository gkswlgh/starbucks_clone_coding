<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                <section class="card_gift_section">
                    <div class="card_gift_steps">
                        <div class="gift_bg_step1">
                            <span class="hid">장바구니 주문하기 (4단계)</span>
                            <div class="gift_step_each">
                                <strong class="icon_step_on icon_step1_on">장바구니</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step2">주문서 입력</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step3">결제 하기</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step4">결제 완료</strong>
                            </div>
                            <span class="hid">중 장바구니 진행중</span>
                        </div>
                    </div>
                    <div class="gift_card_txt">
                        <h5>장바구니에 담긴 주문 내역을 확인 후 결제를 진행해 주세요.</h5>
                    </div>
                    <form id="cart" action="#" class="cart_form">
                        <div class="order">
                            <div class="order_tbl_wrap">
                                <h6 class="hid">상품 목록</h6>
                                <table class="order_list_tbl" summary="상품정보, 수량, 가격에 대한 테이블">
                                    <colgroup>
                                        <col width="50">
                                        <col width="450">
                                        <col width="150">
                                        <col width="150">
                                        <col width="150">
                                        <col width="150">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th scope="col" class="cart_check">
                                                <div class="ez-checkbox">
                                                    <input type="checkbox" name="cart_ck_all" class="chkAll ez-hide" title="전체 선택">
                                                </div>
                                            </th>
                                            <th scope="col">상품 정보</th>
                                            <th scope="col" class="cart_qnt">수량</th>
                                            <th scope="col" class="cart_price">
                                                <div>상품 가격</div>
                                            </th>
                                            <th scope="col" class="cart_selling">
                                                <div>판매 가격</div>
                                            </th>
                                            <th scope="col" class="cart_btn"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="cart_check2">
                                                <div class="ez-checkbox">
                                                    <input type="checkbox" name="cart_ck2" value="선택상품번호" class="ez-hide" title="선택">
                                                </div>
                                            </td>
                                            <td class="cart_ttl2">
                                                <input type="hidden" data-item-name="상품이름" data-item-price="25000" data-unit-price="25000" data-unit-qty="1" data-item-id="상품번호">
                                                <div class="ttl2_wrap clear">
                                                    <div class="ttl2_thumb">
                                                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2016/04/[9200000000044]_20160415132044486.jpg" >
                                                    </div>
                                                    <div class="ttl2_cell">
                                                        <a href="${pageContext.request.contextPath}/" class="ttl2_name">블렌드 어쩌구</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="cart_qnt2">
                                                <label for="n0" class="hid">수량</label>
                                                <div class="qnt_box">
                                                    <input type="number" id="n0" class="input_qnt" min="1" max="10" value="1" readonly>
                                                    <button type="button" class="qnt-down x-change">-</button>
                                                    <button type="button" class="qnt-up x-change">+</button>
                                                </div>
                                            </td>
                                            <td class="cart_price2">
                                                <span class="num">25,000</span>
                                                <i class="unit">원</i>
                                            </td>
                                            <td class="cart_selling2">
                                                <span class="label">판매 가격</span>
                                                <span class="price">
                                                    <b class="num x-row-net">25,000</b>
                                                    <i class="unit">원</i>
                                                </span>
                                            </td>
                                            <td class="cart_btn2">
                                                <div class="btn2_wrap">
                                                    <a href="바로구매(파라미터로 상품번호전달)" class="btn btn-em">바로구매</a>
                                                    <button class="btn x-btn-add-wish" type="button" data-add-url="성공여부json반환하는데이터추가url" data-item-name="블랜드 어쩌구">위시리스트</button>
                                                    <button class="btn x-remove" type="button" data-add-url="성공여부json반환하는데이터삭제url" data-item-name="블랜드 어쩌구" data-item-id="16623">삭제</button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="cart_check2">
                                                <div class="ez-checkbox">
                                                    <input type="checkbox" name="cart_ck2" value="선택상품번호" class="ez-hide" title="선택">
                                                </div>
                                            </td>
                                            <td class="cart_ttl2">
                                                <input type="hidden" data-item-name="상품이름" data-item-price="25000" data-unit-price="25000" data-unit-qty="1" data-item-id="상품번호">
                                                <div class="ttl2_wrap clear">
                                                    <div class="ttl2_thumb">
                                                        <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2016/04/[9200000000044]_20160415132044486.jpg" >
                                                    </div>
                                                    <div class="ttl2_cell">
                                                        <a href="${pageContext.request.contextPath}/" class="ttl2_name">블렌드 어쩌구</a>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="cart_qnt2">
                                                <label for="n0" class="hid">수량</label>
                                                <div class="qnt_box">
                                                    <input type="number" id="n0" class="input_qnt" min="1" max="10" value="1" readonly>
                                                    <button type="button" class="qnt-down x-change">-</button>
                                                    <button type="button" class="qnt-up x-change">+</button>
                                                </div>
                                            </td>
                                            <td class="cart_price2">
                                                <span class="num">25,000</span>
                                                <i class="unit">원</i>
                                            </td>
                                            <td class="cart_selling2">
                                                <span class="label">판매 가격</span>
                                                <span class="price">
                                                    <b class="num x-row-net">25,000</b>
                                                    <i class="unit">원</i>
                                                </span>
                                            </td>
                                            <td class="cart_btn2">
                                                <div class="btn2_wrap">
                                                    <a href="바로구매(파라미터로 상품번호전달)" class="btn btn-em">바로구매</a>
                                                    <button class="btn x-btn-add-wish" type="button" data-add-url="성공여부json반환하는데이터추가url" data-item-name="블랜드 어쩌구">위시리스트</button>
                                                    <button class="btn x-remove" type="button" data-add-url="성공여부json반환하는데이터삭제url" data-item-name="블랜드 어쩌구" data-item-id="16623">삭제</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="bill">
                            <h6 class="hid">장바구니 금액</h6>
                            <div class="bill-box">
                                <div class="bill-item clear">
                                    <span class="label">상품 가격</span>
                                    <span class="price">
                                        <b class="num x-view-price">25,000</b>
                                        <i class="unit">원</i>
                                    </span>
                                </div>
                                <i class="mark">+</i>
                                <div class="bill-item clear">
                                    <span class="label">배달비</span>
                                    <span class="price">
                                        <i class="inner-mark hid">+</i>
                                        <span class="num x-view-deliveryFee">5,000</span>
                                        <i class="unit">원</i>
                                    </span>
                                </div>
                                <i class="mark">=</i>
                                <div class="bill-item bill-item--total clear">
                                    <span class="label">장바구니 금액</span>
                                    <span class="price">
                                        <strong class="num em x-view-payAmount">25,000</strong>
                                        <i class="unit">원</i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="btn_order clear">
                            <button type="submit" class="btn_order1 btn_order_select">선택상품 주문</button>
                            <button type="submit" class="btn_order2 btn_order_all">전체상품 주문</button>
                        </div>
                    </form>
                </section>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {
        $(document).on("click", "button.qnt-up", qtyPlus); // 수량증가
        $(document).on("click", "button.qnt-down", qtyMinus); // 수량감소

        /*수량증가랑 수량감소 아예 this로 싹 다 다시 짜야함.*/
        /**
         * 수량증가
         */
        function qtyPlus() {
            var price_one = Number($(this).parents().parents().prev().children().eq(0).data("item-price"));
            var qty = Number($(this).parents().children().attr("value"));
            if (qty >= 10) {
                alert("한번에 10개까지만 주문 하실 수 있습니다.");
                return;
            }

            //수량 input
            $(this).parents().parents().prev().children().eq(0).attr("data-unit-qty", qty + 1);
            $(this).prev().prev().attr("value", qty + 1);
            qty = qty + 1;

            //총금액
            var ttlPrice_tag = $(this).parents().parents().next().next().children().next().children().eq(0);
            ttlPrice = Number($(this).parents().parents().prev().children().eq(0).data("unit-price")) + price_one;
            $(this).parents().parents().prev().children().eq(0).attr("data-unit-price", ttlPrice);
            ttlPrice_tag.html(ttlPrice);
        }

        /**
         * 수량감소
         */
        function qtyMinus() {
            var price_one = Number($(this).parents().parents().prev().children().eq(0).data("item-price"));
            var qty = Number($(this).parents().children().attr("value"));
            if (qty == 1) {
                alert("1개 이상 주문 하셔야 합니다.");
                return;
            }

            //수량 input
            $(this).parents().parents().prev().children().eq(0).attr("data-unit-qty", qty - 1);
            $(this).prev().attr("value", qty - 1);
            qty = qty - 1;

            //총금액
            var ttlPrice_tag = $(this).parents().parents().next().next().children().next().children().eq(0);
            ttlPrice = Number($(this).parents().parents().prev().children().eq(0).data("unit-price")) - price_one;
            $(this).parents().parents().prev().children().eq(0).attr("data-unit-price", ttlPrice);
            ttlPrice_tag.html(ttlPrice);
        }


        $("#cart").submit(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            alert("주문서 입력 화면으로 넘어갑니다.");
        });
    });
    </script>
</body>

</html>