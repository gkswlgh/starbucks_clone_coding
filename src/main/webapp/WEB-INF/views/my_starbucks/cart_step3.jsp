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
                                <li><a href="#none"><span class="en c222">장바구니</span></a></li>
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
                            <tr>
                                <td>1</td>
                                <td class="cart_ttl2">
                                    <div class="ttl2_wrap clear">
                                        <div class="ttl2_thumb">
                                            <img src="${cart.list_img}" alt />
                                        </div>
                                        <div class="ttl2_cell">
                                            <a class="ttl2_name">${cart.name}</a>
                                        </div>
                                    </div>
                                </td>
                                <td class="cart_qnt2">
                                    <label for="n0" class="hid">수량</label>
                                    <div class="qnt_box">
                                        <span>${cart.menu_qty}</span>
                                    </div>
                                </td>
                                <td class="cart_price2">
                                    <span class="num"><fmt:formatNumber value="${cart.price}" pattern="#,###" /></span>
                                    <i class="unit">원</i>
                                </td>
                                <td class="cart_selling2">
                                    <span class="label">최종금액</span>
                                    <span class="price">
                                        <b class="num x-row-net"><fmt:formatNumber value="${order.order_price}" pattern="#,###" /></b>
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
                                    <td class="ftd cardName">[&nbsp;${order.postcode}&nbsp;] &nbsp; ${order.addr1} &nbsp; ${order.addr2}</td>
                                    <th class="fth">주문한 사람</th>
                                    <td class="ftd receiverInfo">${member.user_name} [&nbsp;${member.phone}&nbsp;]</td>
                                </tr>
                                <tr>
                                    <th>결제 금액</th>
                                    <td><fmt:formatNumber value="${order.order_price}" pattern="#,###" />원
                <c:choose>
                    <c:when test="${cart.menu_qty * cart.price < 20000}">
                        (배송비 5000원 포함)
                    </c:when>
                    <c:otherwise>
                        (배송비 무료)
                    </c:otherwise>
                </c:choose>
                                    </td>
                                    <th>결제수단</th>
                                    <td>
				<c:choose>
                    <c:when test="${order.pay_method == 'S' && card != null}">
                        스타벅스 카드 [&nbsp;${card.card_name}&nbsp;] ,&nbsp;&nbsp; 잔액 : <fmt:formatNumber value="${card.cash}" pattern="#,###" />원
                    </c:when>
                    <c:when test="${order.pay_method == 'N'}">
                        신용카드
                    </c:when>
                </c:choose>
									</td>
                                </tr>
                                <tr>
                                    <td class="ltd" colspan="4">
                                        <p>총 결제금액: <span><fmt:formatNumber value="${order.order_price}" pattern="#,###" />원</span></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="gift_payment_btns cart">
                        <form action="${pageContext.request.contextPath}/rest/product/order" method="post" name="order_form" id="order_form">
                        	<input type="hidden" id="cart_id" name="cart_id" value="${cart.cart_id}" />
                        	<c:choose>
							<c:when test="${card != null}">
                        	<input type="hidden" id="card_id" name="card_id" value="${card.card_id}" />
                        	</c:when>
                        	</c:choose>
                        	<input type="hidden" id="pay_method" name="pay_method" value="${order.pay_method}" />
                        	<input type="hidden" id="postcode" name="postcode" value="${order.postcode}" />
                        	<input type="hidden" id="addr1" name="addr1" value="${order.addr1}" />
                        	<input type="hidden" id="addr2" name="addr2" value="${order.addr2}" />
                        	<input type="hidden" id="order_price" name="order_price" value="${order.order_price}" />
                            <ul>
                                <li class="gift_payment_btn3"><button type="submit" id="goOrder">결제하기</button></li>
                                <li class="gift_payment_btn1"><a onclick="history.back(); return false;">뒤로</a></li>
                            </ul>
						</form>
                        </div>
                    </div>
                </section>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script>
    $(function() {

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#order_form").validate({
        	// alert 함수로 에러메시지 표시하기 옵션
			onkeyup: false,
			onclick: false,
			onfocusout: false,
			showErrors: function(errorMap, errorList) {
				if(errorList.length < 1) {
					return;
				}
				alert(errorList[0].message);
			},
            /*입력검사 규칙*/
            rules: {
            	cart_id: "required",
            	pay_method: "required",
            	postcode: "required",
            	addr1: "required",
            	addr2: "required",
            	order_price: "required"
            },
            messages: {
            	cart_id: "오류. 처음부터 다시 시도해주세요.",
            	pay_method: "오류. 처음부터 다시 시도해주세요.",
            	postcode: "오류. 처음부터 다시 시도해주세요.",
            	addr1: "오류. 처음부터 다시 시도해주세요.",
            	addr2: "오류. 처음부터 다시 시도해주세요.",
            	order_price: "오류. 처음부터 다시 시도해주세요."
            }
        }); //end validate()

        $('#order_form').ajaxForm({
				// submit 전에 호출된다.
				beforeSubmit: function (arr, form, options) {
					// 현재 통신중인 대상 페이지를 로그로 출력함
					console.log(">> Ajax 통신 시작 >> " + this.url);
					
					// validation 플러그인을 수동으로 호출하여 결과를 리턴한다.
					// 검사규칙에 위배되어 false가 리턴될 경우 submit을 중단한다.
	        		return $(form).valid();
					
				},
				// 통신 성공시 호출될 함수 (파라미터는 읽어온 내용)
				success: function(json) {
					console.log(">> 성공!!!! >> " + json);
					
					if (json.rt == "OK") {
	            		var myRedirect = function(redirectUrl, arg, value) {
	              		  var form = $('<form action="' + redirectUrl + '" method="post">' +
	              				  '<input type="hidden" name="'+ arg +'" value="' + value + '"></input>' + '</form>');
	              				  $('body').append(form);
	              				  $(form).submit();
	              				};
	              		myRedirect(ROOT_URL + "/my/cart_step4", "order_id", json.order_id);
					}
				}
		});// end ajax
    });
    </script>
</body>

</html>