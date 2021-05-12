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
                            <h1 class="f_32">주문 상세</h1>
                            <ul class="smap">
                                <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home.png" alt="홈으로" /></a></li>
                                <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow.png" class="arrow" alt="하위메뉴" /></li>
                                <li><a href="#none"><span class="en c222">주문 상세</span></a></li>
                            </ul>
                        </div>
                    </div>
                </header>
                <!-- 서브타이틀 끝 -->
                <!-- 내용 -->
                    <div class="gift_card_txt">
                        <h5 class="m0">주문 내역 상세 페이지입니다.</h5>
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
          <c:choose>
	        <c:when test="${output != null && fn:length(output) > 0}">
				<c:forEach var="item" items="${output}" varStatus="status">
                            <tr>
                                <td>1</td>
                                <td class="cart_ttl2">
                                    <div class="ttl2_wrap clear">
                                        <div class="ttl2_thumb">
                                            <img src="${item.list_img}" alt />
                                        </div>
                                        <div class="ttl2_cell">
                                            <a class="ttl2_name">${item.name}</a>
                                        </div>
                                    </div>
                                </td>
                                <td class="cart_qnt2">
                                    <label for="n0" class="hid">수량</label>
                                    <div class="qnt_box">
                                        <span>${item.menu_qty}</span>
                                    </div>
                                </td>
                                <td class="cart_price2">
                                    <span class="num"><fmt:formatNumber value="${item.price}" pattern="#,###" /></span>
                                    <i class="unit">원</i>
                                </td>
                                <td class="cart_selling2">
                                    <span class="label">최종금액</span>
                                    <span class="price">
                                        <b class="num x-row-net"><fmt:formatNumber value="${item.price * item.menu_qty}" pattern="#,###" /></b>
                                        <i class="unit">원</i>
                                    </span>
                                </td>
                                <td></td>
                            </tr>
			  </c:forEach>
              </c:when>
            </c:choose>
                        </tbody>
                    </table>
                <div class="suggestion_btnZone" style="height:100px;">
                    <p class="btn_list">
                        <a href="${pageContext.request.contextPath}/my/order_list">뒤로가기</a>
                    </p>
                </div>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
</body>

</html>