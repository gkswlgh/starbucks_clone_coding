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
            <div class="inner p0">
                <!-- 서브타이틀 -->
                <header class="sub_tit_wrap sub_tit_wrap_short2">
                    <div class="sub_tit_bg_white2">
                        <div class="sub_tit_inner_short2">
                            <h2>
                                <img src="//image.istarbucks.co.kr/common/img/menu/tit/drink_tit4.png" alt="블렌디드" />
                            </h2>
                            <ul class="smap">
                                <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/product/menu_list"><span class="en c222">MENU</span></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/product/menu_list"><span class="en c222">음료</span></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="${pageContext.request.contextPath}/product/menu_detail/${item.id}"><span class="en c222">딸기 요거트 블렌디드</span></a></li>
                            </ul>
                        </div>
                    </div>
                </header>
                <!-- 서브타이틀 끝 -->
                <!-- 내용 -->
                <div class="content02">
                    <!-- 제품 상세보기 -->
                    <div class="product_view_wrap1">
                        <div class="product_view_pic clear">
                            <div class="product_big_pic">
                                <p><a href="#none"><img src="${output.main_img}" alt="상세이미지"></a></p>
                            </div>
                            <div class="product_thum_wrap" id="product_thum_wrap">
                                <ul class="product_thum">
                                    <li><a href="#none"><img src="${output.list_img}" alt="상세이미지 1번"></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product_view_detail">
                            <div class="myAssignZone">
                                <h4>${output.name}
                                    <br />
                                    <span>${output.eng_name}</span></h4>
                                <p class="t1">${output.description}</p>
                                <c:choose>
		                        	<c:when test="${member != null}">
			                        	<input type="hidden" id="member_id" value="${member.id}"/>
			                        	<input type="hidden" id="menu_id" value="${output.id}"/>
	                        			<div class="myDrink"><a id="likeMenu" title="좋아하는 음료 등록">좋아하는 음료로 등록</a></div>
		                        	</c:when>
		                        	<c:otherwise>
		                                <div class="myDrink"><a id="likeMenuGoLogin" title="좋아하는 음료 등록">좋아하는 음료로 등록</a></div>
		                        	</c:otherwise>
		                        </c:choose>
                            </div>
                            <div class="product_view_info">
                                <div class="product_info_head">
                                    <p class="tit">제품 영양 정보</p>
                                    <div class="product_select_wrap2">
                                        <div class="selectTxt2" id="product_info01">${nutriInfo.nutri_volume}</div>
                                    </div>
                                </div>
                                <div class="product_info_content">
                                    <ul>
                                        <li class="kcal">
                                            <dl>
                                                <dt>1회 제공량 (kcal)</dt>
                                                <dd>${nutriInfo.kcal}
                                                </dd>
                                            </dl>
                                        </li>
                                        <li class="sat_FAT">
                                            <dl>
                                                <dt>포화지방 (g)</dt>
                                                <dd>${nutriInfo.fat}
                                                </dd>
                                            </dl>
                                        </li>
                                        <li class="protein">
                                            <dl>
                                                <dt>단백질 (g)</dt>
                                                <dd>${nutriInfo.protein}</dd>
                                            </dl>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li class="sodium">
                                            <dl>
                                                <dt>나트륨 (mg)</dt>
                                                <dd>${nutriInfo.salt}</dd>
                                            </dl>
                                        </li>
                                        <li class="sugars">
                                            <dl>
                                                <dt>당류 (g)</dt>
                                                <dd>${nutriInfo.sugars}</dd>
                                            </dl>
                                        </li>
                                        <li class="caffeine last">
                                            <dl>
                                                <dt>카페인 (mg)</dt>
                                                <dd>${nutriInfo.caffeine}</dd>
                                            </dl>
                                        </li>
                                    </ul>
                                </div>
                                <div class="product_factor">
                                    <p>알레르기 유발요인 : ${nutriInfo.trigger_str}</p>
                                </div>
                            </div>
                        </div>
                        <div class="product_cart clear">
                            <p>
                                <strong>총 금액 :&nbsp;
                                    <span id="ttl_price" class="ttl_price t_006633" value="${output.price}">${output.price}</span></strong>
                                원
                            </p>
                            <p>
                                <label> 수량&nbsp; </label>
                                <input id='product_count_result' name="qty" type="number" disabled value="1">
                                <button class="plus">증가</button>
                                <button class="minus">감소</button>
                            </p>
                            <br />
                            <ul class="product_cart_btns">
                                <li class="product_cart_btn1"><a href="${pageContext.request.contextPath}/" class="pay_now" id="pay_now" data-price="${output.price}" data-qty="1">바로 주문하기</a></li>
                                <li class="product_cart_btn2"><a href="${pageContext.request.contextPath}/" class="in_cart" id="in_cart" data-price="${output.price}" data-qty="1">장바구니에 담기</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="product_view_wrap2">
                        ${output.content}
                    </div>
                    <!-- 제품 상세보기 끝 -->
                </div>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {

        $(document).on("click", "button.plus", qtyPlus); // 수량증가
        $(document).on("click", "button.minus", qtyMinus); // 수량감소


        /*장바구니*/
        $("#in_cart").on("click", function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            
            
            

            //이동 - 이동할 때 상품번호랑 수량 같이
            $.post(ROOT_URL + '/rest/', {
            	member_id: member_id,
            	menu_id: menu_id
            }, function(json) {
            	if (json.rt == "OK") {
            		if (confirm("장바구니에 담겼습니다. 장바구니 페이지로 이동하시겠습니까?")) {
            			window.location = ROOT_URL + "/my/cart_step1";
            			}
            		}
            });

        });//장바구니끝
        
        //좋아하는메뉴버튼
        $("#likeMenu").click(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            
        	var member_id = $("#member_id").val();
        	var menu_id = $("#menu_id").val();
        	
            if (member_id == null || menu_id == null) {
            	alert('회원 혹은 메뉴 데이터를 확인할 수 없습니다.');
                return false;
            }

            $.post(ROOT_URL + '/rest/product/like_menu', {
            	member_id: member_id,
            	menu_id: menu_id
            }, function(json) {
            	if (json.rt == "OK") {
            		alert('좋아하는 음료로 등록되었습니다.');	}
            });
        }); //좋아하는메뉴버튼끝
        
        //로그인버튼
        $("#likeMenuGoLogin").click(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
        	
            if (confirm('로그인 후 이용하실 수 있습니다. 로그인 페이지로 이동하시겠습니까?')) {
                window.location = ROOT_URL + "/account/login";
            }
            
        }); //로그인버튼끝
    });

    /**
     * 수량증가
     */
    function qtyPlus() {
        var price_one = Number($(".pay_now").attr("data-price"));
        var qty = Number($("#product_count_result").attr("value"));
        if (qty >= 10) {
            alert("한번에 10개까지만 주문 하실 수 있습니다.");
            return;
        }

        //수량 input
        $(".pay_now").attr("data-qty", qty + 1);
        $(".in_cart").attr("data-qty", qty + 1);
        $("#product_count_result").attr("value", qty + 1);
        qty = qty + 1;

        //총금액
        var ttlPrice_tag = document.getElementById("ttl_price");
        ttlPrice = Number($(".ttl_price").attr("value")) + price_one;
        ttlPrice_tag.innerHTML = ttlPrice;
        $(".ttl_price").attr("value", ttlPrice);
    }

    /**
     * 수량감소
     */
    function qtyMinus() {
        var price_one = Number($(".pay_now").attr("data-price"));
        var qty = Number($("#product_count_result").attr("value"));
        if (qty == 1) {
            alert("1개 이상 주문 하셔야 합니다.");
            return;
        }

        //수량 input
        $(".pay_now").attr("data-qty", qty - 1);
        $(".in_cart").attr("data-qty", qty - 1);
        $("#product_count_result").attr("value", qty - 1);
        qty = qty - 1;

        //총금액
        var ttlPrice_tag = document.getElementById("ttl_price");
        ttlPrice = Number($(".ttl_price").attr("value")) - price_one;
        ttlPrice_tag.innerHTML = ttlPrice;
        $(".ttl_price").attr("value", ttlPrice);
    }
    </script>
</body>

</html>