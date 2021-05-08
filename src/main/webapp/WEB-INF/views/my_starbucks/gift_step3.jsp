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
                <section class="card_gift_info_section">
                    <div class="card_gift_steps">
                        <div class="gift_bg_step3">
                            <span class="hid">스타벅스 카드 선물하기 (4단계)</span>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step1">카드 선택</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step2">정보 입력</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step_on icon_step3_on">결제 하기</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step4">결제 완료</strong>
                            </div>
                            <span class="hid">중 정보 입력 진행중</span>
                        </div>
                    </div>
                    <div class="gift_card_txt">
                        <h5 class="m0">한 번 보낸 선물은 취소할 수 없습니다. &nbsp;신중히 확인 후 결제해주세요.
                        <br /><br />
                        <span class="cf66">결제 버튼을 누르고 다음페이지로 넘어가기 까지 다소 시간이 걸립니다. &nbsp;새로고침 하지 말고 기다려주세요.</span>
                        </h5>
                    </div>
                    <div class="card_gift_payment">
                        <dl class="clear">
                            <dt>
                                <img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" class="cardImgUrl" alt="White Siren e-Gift">
                            </dt>
                            <dd>
                                <p class="reqMsg_html">${input.message}</p>
                            </dd>
                        </dl>
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
                                    <th class="fth">카드명</th>
                                    <td class="ftd cardName">White Siren e-Gift</td>
                                    <th class="fth">받는 사람</th>
                                    <td class="ftd receiverInfo">${input.to_mem_name}</td>
                                </tr>
                                <tr>
                                    <th>선물할 방법</th>
                                    <td>이메일 [ ${input.to_mem_email} ]</td>
                                    <th>선물 금액</th>
                                    <td>${input.gift_price}원</td>
                                </tr>
                                <tr>
                                    <th>보내는 사람</th>
                                    <td>${member.user_name}</td>
                                    <th>결제수단</th>
                                    <td>신용카드</td>
                                </tr>
                                <tr>
                                    <td class="ltd" colspan="4">
                                        <p>총 결제금액: <span>${input.gift_price}원</span></p>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="gift_payment_btns">
                            <ul>
                                <li class="gift_payment_btn1"><a onclick="history.back(); return false;">뒤로</a></li>
                                <li class="gift_payment_btn3"><button id="goOrder">결제하기</button></li>
                            </ul>
                        </div>
                    </div>
                    <input type="hidden" id="to_mem_email" value="${input.to_mem_email}"/>
                    <input type="hidden" id="to_mem_name" value="${input.to_mem_name}"/>
                    <input type="hidden" id="message" value="${input.message}"/>
                    <input type="hidden" id="gift_price" value="${input.gift_price}"/>
                </section>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <!-- 사용자 자바스크립트 -->
    <script type="text/javascript">
    $(function() {

    	//다음페이지
        $("#goOrder").on("click", function(e) {
	        e.preventDefault();
	    	var to_mem_email = $("#to_mem_email").val();
	    	var to_mem_name = $("#to_mem_name").val();
	    	var message = $("#message").val();
	    	var gift_price = $("#gift_price").val();
	    	
        	if (confirm('결제하시겠습니까?')) {
                $.post(ROOT_URL + "/my/rest/gift_step3", {
                	to_mem_email: to_mem_email,
                	to_mem_name: to_mem_name,
                	message: message,
                	gift_price: gift_price
                }, function(json) {
                	window.location = ROOT_URL + '/my/gift_step4/'+ json.gift_id;
                });
	        }
        });
    });
    </script>
</body>

</html>