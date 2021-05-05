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
                        <h5>20000원 이상 구매시 배달비 무료</h5>
                    </div>
                    <form id="cart" action="${pageContext.request.contextPath}/shopping/order" method="post" class="cart_form">
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
                                                    <input type="checkbox" id="cart_ck_all" name="cart_ck_all" class="chkAll ez-hide" title="전체 선택">
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
					<!-- 출력 결과 -->
               		<c:choose>
			        	<c:when test="${output != null && fn:length(output) > 0}">
        					<c:forEach var="item" items="${output}" varStatus="status">
                        		<tr class="cart-item cart-item-${item.cart_id}">
                                    <td class="cart_check2">
                                        <div class="ez-checkbox">
                                            <input type="checkbox" name="cart_id" value="${item.cart_id}" class="ez-hide cart_id" title="선택">
                                        </div>
                                    </td>
                                    <td class="cart_ttl2">
                                        <input type="hidden" name="cart-data-input" data-cart-id="${item.cart_id}" data-item-name="${item.name}" data-item-price="${item.price}" data-unit-price="${item.menu_qty * item.price}" data-unit-qty="${item.menu_qty}" data-item-id="${item.menu_id}">
                                        <div class="ttl2_wrap clear">
                                            <div class="ttl2_thumb">
                                            	<img src="${item.list_img}" >
                                            </div>
                                            <div class="ttl2_cell">
                                                <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="ttl2_name">${item.name}</a>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart_qnt2">
                                        <label for="n0" class="hid">${item.menu_qty}</label>
                                        <div class="qnt_box">
                                            <input type="number" class="input_qnt" min="1" max="10" value="${item.menu_qty}" readonly>
                                            <button type="button" class="qnt-down x-change">-</button>
                                            <button type="button" class="qnt-up x-change">+</button>
                                        </div>
                                    </td>
                                    <td class="cart_price2">
                                        <span class="num">${item.price}</span>
                                        <i class="unit">원</i>
                                    </td>
                                    <td class="cart_selling2">
                                        <span class="label">판매 가격</span>
                                        <span class="price">
                                            <b class="num x-row-net">${item.menu_qty * item.price}</b>
                                            <i class="unit">원</i>
                                        </span>
                                    </td>
                                    <td class="cart_btn2">
                                        <div class="btn2_wrap">
                                            <a href="${pageContext.request.contextPath}" class="btn btn-em">바로구매</a>
                                            <button class="btn btn-cart-remove" type="button" data-add-url="${pageContext.request.contextPath}" data-item-name="${item.name}" data-item-id="${item.cart_id}">삭제</button>
                                        </div>
                                    </td>
                                </tr>
                        </c:forEach>
			        </c:when>
					<c:otherwise>
                		<tr>
                		<td colspan="6" style="padding-top: 100px; padding-bottom: 100px;">장바구니가 비어있습니다.</td>
                		</tr>
					</c:otherwise>
               	</c:choose>
                <!-- 출력 결과 끝 -->
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
                                        <b id="all-item-price" class="num x-view-price">0</b>
                                        <i class="unit">원</i>
                                    </span>
                                </div>
                                <i class="mark">+</i>
                                <div class="bill-item clear">
                                    <span class="label">배달비</span>
                                    <span class="price">
                                        <i class="inner-mark hid">+</i>
                                        <span id="del-price" class="num x-view-deliveryFee">0</span>
                                        <i class="unit">원</i>
                                    </span>
                                </div>
                                <i class="mark">=</i>
                                <div class="bill-item bill-item--total clear">
                                    <span class="label">장바구니 금액</span>
                                    <span class="price">
                                        <strong id="cart-price" class="num em x-view-payAmount">0</strong>
                                        <i class="unit">원</i>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="btn_order clear">
                            <button type="submit" id="btn-cart-remove-all" class="btn_order1 btn_delete">선택상품 삭제</button>
                            <button type="submit" class="btn_order2 btn_order">선택상품 주문</button>
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
        unitPrice(); //전체합계
        
        // 체크박스
		$(document).on("change", "#cart_ck_all", function() {
            if ($("#cart_ck_all").prop('checked')) {
                $(".cart_check2 input").prop('checked', true);
            } else {
                $(".cart_check2 input").prop('checked', false);
            }
		});
        
        // 삭제버튼
	    $(".btn-cart-remove").click(function(e) {
	        e.preventDefault();
	        var cartId = $(this).data('item-id') + '';
	        var productName = $(this).data('item-name');
	        
	        if (confirm('정말 ' + productName + '(을)를 삭제하시겠습니까?')) {

                $.post(ROOT_URL + "/rest/product/del_cart", {
                	cart_id_list: cartId
                }, function(json) {
                    $('.cart-item-' + cartId).remove();
                });
	        }

	    });
        
        // 전체삭제버튼
	    $("#btn-cart-remove-all").click(function(e) {
	        e.preventDefault();
                
    	    if (confirm('정말 선택한 상품을 전부 삭제하시겠습니까?')) {
	    	    	
				var input = '';
	        	
	        	//체크박스 받아서 반복문
	            $('input[name=cart_id]:checked').each(function(index){ 
	            	if (index != 0) {
	            		input += ',';
	            	}
	            	input += $(this).val();
	            });
	        	
	            $.post(ROOT_URL + '/rest/product/del_cart', {
	                cart_id_list: input
	            }, function(json) {
	            	if (json.rt == "OK") {
	            		location.reload();
	            	}
	            });
	            
	        }
	    });
        
        // 가격 합계 계산
        function unitPrice() {

        	var data =  document.getElementsByName("cart-data-input");
        	var money = 0;
        	var del = 5000;
        	
        	for (var i=0; i<data.length; i++) {
        		//push
        		money += Number(data[i].dataset.unitPrice);
        	}

        	if (money >= 20000) {
        		del = 0;
        	}

        	$("#all-item-price").html(money);
        	$("#del-price").html(del);
        	$("#cart-price").html(money+del);
        }
        
        
	    /**
	     * 수량증가
	     */
	    function qtyPlus() {
        	var $hid = $(this).parent().parent().prev().children().eq(0);
	        var price_one = Number($hid.data("item-price"));
	        var qty = Number($(this).prev().prev().val());
	    	var id = Number($hid.data("cart-id"));
	        if (qty >= 10) {
	            alert("한번에 10개까지만 주문 하실 수 있습니다.");
	            return;
	        }
	        qty = qty + 1;
	        var price_unit = qty * price_one;

	        //수량 input
	        $(this).prev().prev().attr("value", qty);
	        $hid.attr("data-unit-qty", qty);

	        //총금액
	        $hid.attr("data-unit-price", price_unit);
	        $(this).parent().parent().next().next().children().eq(1).children().eq(0).html(price_unit);
	        
	        //qty수정
	    	$.post(ROOT_URL + "/rest/product/edit_cart", {
	    		menu_qty : qty,
	    		cart_id : id
            }, function(json) {
                
            });

	        //전체합계
	    	unitPrice();
	    }

	    /**
	     * 수량감소
	     */
	    function qtyMinus() {
	    	var $hid = $(this).parent().parent().prev().children().eq(0);
	        var price_one = Number($hid.data("item-price"));
	        var qty = Number($(this).prev().attr("value"));
	    	var id = Number($hid.data("cart-id"));
	        if (qty == 1) {
	            alert("1개 이상 주문 하셔야 합니다.");
	            return;
	        }
	        qty = qty - 1;
	        var price_unit = qty * price_one;

	        //수량 input
	        $(this).prev().attr("value", qty);
	        $hid.attr("data-unit-qty", qty);

	        //총금액
	        $hid.attr("data-unit-price", price_unit);
	        $(this).parent().parent().next().next().children().eq(1).children().eq(0).html(price_unit);

	        //qty수정
	    	$.post(ROOT_URL + "/rest/product/edit_cart", {
	    		menu_qty : qty,
	    		cart_id : id
            }, function(json) {
                
            });
	        
	        //전체합계
	    	unitPrice();
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