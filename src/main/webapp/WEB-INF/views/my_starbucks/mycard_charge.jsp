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
        <header class="sub_tit_wrap">
            <div class="sub_tit_bg">
                <div class="sub_tit_inner">
                    <h4>
                        <img src="//image.istarbucks.co.kr/common/img/util/cha_card_ttl.png" alt="카드충전" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my_starbucks"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_card"><span class="en">My 스타벅스 카드</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/mycard_charge"><span class="en">카드 충전</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class=" cont ">
            <div class="cont_inner">
                <fieldset>
                    <legend class="hid">카드 충전폼</legend>
                    <section class="card_charge_wrap">
                        <h5 class="card_charge_regular">
                            <a class="on">일반 충전</a>
                        </h5>
                        <article>
                            <form action="${pageContext.request.contextPath}/" name="frm_NORMAL" id="frm_NORMAL" method="post">
                                <!-- 테이블 -->
                                <table class="w830 regular_charge gift_info_tbl chargeWh" summary="충전 카드 선택, 충전 금액 선택, 결제 수단 선택, 온라인 충전 시 유의 사항">
                                    <caption>충전 카드 선택, 충전 금액 선택, 결제 수단 선택, 온라인 충전 시 유의 사항에 대한 테이블</caption>
                                    <tbody>
                                        <tr> 
                                            <th scope="row">충전 카드 선택
                                            </th>
                                            <td>
                                                <c:choose>
							        			<c:when test="${cardList != null && fn:length(cardList) > 0}">
                                                <div class="sel_wrap">
                                                    <p class="user_sel_wrap">
                                                        <select id="cardNumber" name="cardNumber" class="cardNumber">
                                                            <c:forEach var="item" items="${cardList}" varStatus="status">
					                                              <option class="trs_card"  data-cash="${item.cash}" value="${item.card_id}">${item.card_name}</option>
										           		 	</c:forEach>
                                                        </select>
                                                    </p>
                                                </div>
                                                <c:forEach var="item" items="${cardList}" varStatus="status">
                                                <div class="user_card_wrap_1 user_card_wrap clear" data-cash="${item.cash}" data-card-id="${item.card_id}">
                                                    <figure>
                                                        <img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt class="cardImgUrl">
                                                    </figure>
                                                    <p>
                                                        <strong class="en cardNumber">**** - **** - **** - ${fn:substring(item.card_num, 12, 16)}</strong>
                                                        <br><br>
                                                        최종 사용일 :
                                                        <span class="balanceConfirmDate">${item.edit_date}</span>
                                                        <br>
                                                        카드 등록일 :
                                                        <span class="cardRegDate">${item.reg_date}</span>
                                                    </p>
					                                <p class="my_ms_card_detail_price">
					                                    잔액
					                                    <strong class="en t_0d5f34"> <fmt:formatNumber value="${item.cash}" pattern="#,###" /></strong>
					                                    원
					                                </p>
                                                </div>
                                                </c:forEach>
					                            </c:when>
										    	</c:choose>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">충전 금액 선택 </th>
                                            <td class="clear">
                                                <div class="sel_wrap tbl_card_radio">
                                                    <div class="clear">
                                                        <p class="charge_change">
                                                            충전 후 총 카드 잔액 :
                                                            <span id="afterChargeBalance" class="en t_006633 afterChargeBalance">0</span>
                                                            원
                                                        </p>
                                                    </div>
                                                    <div class="radio_wrap radio_wrap_mn charge_options">
                                                        <input type="radio" name="price" id="price0" value="300000">
                                                        <label for="price0">30만원</label>
                                                        <input type="radio" name="price" id="price1" value="100000">
                                                        <label for="price1">10만원</label>
                                                        <input type="radio" name="price" id="price2" value="50000">
                                                        <label for="price2">5만원</label><input type="radio" name="price" id="price3" value="30000" checked>
                                                        <label for="price3">3만원</label><input type="radio" name="price" id="price4" value="10000">
                                                        <label for="price4">1만원</label>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">결제 수단 선택</th>
                                            <td>
                                                <div class="sel_wrap tbl_card_radio charge_options">
                                                    <span class="radio_wrap radio_wrap_mn">
                                                        <input type="radio" name="gopaymethod" value="onlycard" checked>
                                                        <label for="payMethod1">신용카드</label>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">온라인 충전 시
                                                <br>유의사항</th>
                                            <td>
                                                <ul class="gift_info_adding2">
                                                    <li>
                                                        <span class="gift_info_add_fb">온라인 충전은 회원님의 편의를 위해 다음의 2가지 방법으로 제공됩니다.</span>
                                                        <ul>
                                                            <li>
                                                                일반 충전 : 필요시 마다 충전금액과 결제수단 등의 정보를 입력하여 즉시 충전
                                                            </li>
                                                            <li>
                                                                자동 충전 : 카드별로 자동충전방법, 충전금액, 결제수단 등을 미리 설정해두고 설정값에 따라 자동 충전(카드번호 등
                                                                결제수단 정보는 거래승인을 위해서 최초 신청시에만 입력을 받게되며 신청이 완료된 후 저장되지 않습니다.)</li>
                                                        </ul>
                                                    </li>
                                                    <li>카드 충전금액의 유효기간은 스타벅스 카드의 마지막 거래발생일로부터 5년 입니다.</li>
                                                    <li>재충전 이후 거래 이력이 없는 경우, 충전일로부터 최대 7일 내 온라인에서 충전 취소가 가능합니다.</li>
                                                    <li>미성년자(만 14세 미만)는 온라인 충전을 하실 수 없습니다.</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- 테이블 끝 -->
                            <ul class="charge_tbl_btns">
                                <li class="charge_tbl_btn1"><button type="submit" class="charge_normal">카드 충전</button></li>
                                <li class="charge_tbl_btn2"><a href="${pageContext.request.contextPath}/mypage">취소</a></li>
                            </ul>
                            </form>
                        </article>
                        <h5 class="card_charge_auto">
                            <a class>자동 충전</a>
                        </h5>
                        <article style="display: none;">
                            <form name="frm_AUTO" id="frm_AUTO" method="post">
                                <!-- 테이블 -->
                                <table class="w830 lowest_limit chargeWh gift_info_tbl" summary="충전 유형 선택 , 충전 카드 선택, 자동 충전일 선택, 자동 충전 금액 선택, 결제 수단 선택, 온라인 충전 시 유의 사항">
                                    <caption>충전 유형 선택 , 충전 카드 선택, 자동 충전일 선택, 자동 충전 금액 선택, 결제 수단 선택, 온라인 충전 시 유의 사항에 대한 테이블</caption>
                                    <tbody>
                                        <tr>
                                            <th scope="row">충전 유형 선택</th>
                                            <td>
                                                <div class="sel_wrap tbl_radio_wrap ">
                                                    <input type="radio" class="ctype" name="autoReloadType" id="autoReloadType" value="1" checked>
                                                    <label for="autoReloadType" class="ctype">월 정액 자동 충전</label>
                                                </div>
                                                <p class="ctype_guide">
                                                    매월 지정한 날짜에 설정해놓은 금액이 자동 충전되는 서비스입니다.
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">충전 카드 선택
                                            </th>
                                            <td>
                                                <c:choose>
							        			<c:when test="${cardList != null && fn:length(cardList) > 0}">
                                                <div class="sel_wrap">
                                                    <p class="user_sel_wrap">
                                                        <select id="cardNumber_AUTO" name="cardNumber" class="cardNumber">
                                                            <c:forEach var="item" items="${cardList}" varStatus="status">
					                                              <option class="trs_card_AUTO"  data-cash="${item.cash}" value="${item.card_id}">${item.card_name}</option>
										           		 	</c:forEach>
                                                        </select>
                                                    </p>
                                                </div>
                                                <c:forEach var="item" items="${cardList}" varStatus="status">
                                                <div class="user_card_wrap_AUTO user_card_wrap clear" data-cash="${item.cash}" data-card-id="${item.card_id}">
                                                    <figure>
                                                        <img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt class="cardImgUrl">
                                                    </figure>
                                                    <p>
                                                        <strong class="en cardNumber">**** - **** - **** - ${fn:substring(item.card_num, 12, 16)}</strong>
                                                        <br><br>
                                                        최종 사용일 :
                                                        <span class="balanceConfirmDate">${item.edit_date}</span>
                                                        <br>
                                                        카드 등록일 :
                                                        <span class="cardRegDate">${item.reg_date}</span>
                                                    </p>
					                                <p class="my_ms_card_detail_price">
					                                    잔액
					                                    <strong class="en t_0d5f34"> <fmt:formatNumber value="${item.cash}" pattern="#,###" /></strong>
					                                    원
					                                </p>
                                                </div>
                                                </c:forEach>
					                            </c:when>
										    	</c:choose>
                                            </td>
                                        </tr>
                                        <tr class="autoReloadDay">
                                            <th scope="row">자동 충전일 선택</th>
                                            <td>
                                                <div class="sel_wrap tbl_card_radio charge_options ">
                                                    <span class="ez-checkbox ez-checked">
                                                        <label>
                                                            <input type="radio" name="autoReloadDay" value="1" checked="checked">
                                                            매월 1일
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="autoReloadDay" value="5">
                                                            매월 5일
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="autoReloadDay" value="10">
                                                            매월 10일
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="autoReloadDay" value="15">
                                                            매월 15일
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="autoReloadDay" value="20">
                                                            매월 20일
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="autoReloadDay" value="25">
                                                            매월 25일
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="autoReloadDay" value="99">
                                                            매월 말일
                                                        </label>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">자동 충전 금액 선택 </th>
                                            <td class="clear">
                                                <div class="sel_wrap tbl_card_radio charge_options">
                                                    <span class="radio_wrap radio_wrap_mn">
                                                        <input type="radio" name="priceA" id="price0_AUTO" value="300000">
                                                        <label for="price0_AUTO">30만원</label>
                                                        <input type="radio" name="priceA" id="price1_AUTO" value="100000">
                                                        <label for="price1_AUTO">10만원</label>
                                                        <input type="radio" name="priceA" id="price2_AUTO" value="50000">
                                                        <label for="price2_AUTO">5만원</label><input type="radio" name="priceA" id="price3_AUTO" value="30000" checked="checked">
                                                        <label for="price3_AUTO">3만원</label><input type="radio" name="priceA" id="price4_AUTO" value="10000">
                                                        <label for="price4_AUTO">1만원</label>
                                                    </span>
                                                </div>
                                                <p class="charge_will autoReloadDay">
                                                    <strong class="t_006633 chargeCardName">[2021 Happy New Year]</strong>
                                                    카드에
                                                    <strong class="t_006633 chargeDate">매월 1일</strong>
                                                    마다
                                                    <strong class="t_006633 totPrice">1만원</strong>
                                                    이 자동 충전 됩니다.
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">결제 수단 선택</th>
                                            <td>
                                                <div class="sel_wrap tbl_card_radio charge_options">
                                                    <span class="radio_wrap radio_wrap_mn">
                                                        <input type="radio" name="gopaymethod" id="payMethod1_AUTO" value="onlycard" checked="checked">
                                                        <label for="payMethod1_AUTO">신용카드</label>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">온라인 충전 시
                                                <br>유의사항</th>
                                            <td>
                                                <ul class="gift_info_adding2">
                                                    <li>
                                                        <span class="gift_info_add_fb">온라인 충전은 회원님의 편의를 위해 다음의 2가지 방법으로 제공됩니다.</span>
                                                        <ul>
                                                            <li>
                                                                일반 충전 : 필요시 마다 충전금액과 결제수단 등의 정보를 입력하여 즉시 충전
                                                            </li>
                                                            <li>
                                                                자동 충전 : 카드별로 자동충전방법, 충전금액, 결제수단 등을 미리 설정해두고 설정값에 따라 자동 충전(카드번호 등
                                                                결제수단 정보는 거래승인을 위해서 최초 신청시에만 입력을 받게되며 신청이 완료된 후 저장되지 않습니다.)</li>
                                                        </ul>
                                                    </li>
                                                    <li>카드 충전금액의 유효기간은 스타벅스 카드의 마지막 거래발생일로부터 5년 입니다.</li>
                                                    <li>재충전 이후 거래 이력이 없는 경우, 충전일로부터 최대 7일 내 온라인에서 충전 취소가 가능합니다.</li>
                                                    <li>미성년자(만 14세 미만)는 온라인 충전을 하실 수 없습니다.</li>
                                                </ul>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <!-- 테이블 끝 -->
                            <ul class="charge_tbl_btns">
                                <li class="charge_tbl_btn1"><button type="submit" class="charge_auto">설정 완료</button></li>
                                <li class="charge_tbl_btn2"><a href="${pageContext.request.contextPath}/mypage">취소</a></li>
                            </ul>
                            </form>
                        </article>
                    </section>
                </fieldset>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <!-- 사용자스크립트 -->
    <script type="text/javascript">
    $(function() {
    	/*페이지 로드 시*/
    	CardShow();
    	CardShow_AUTO();
    	
        /*카드 선택시 */
        $(document).on("change", "#cardNumber", CardShow);
        /*충전금액 선택시 */
        $(document).on("change", "input[name='price']", chargeSum);
        
        /*카드 정보 보이기*/
        function CardShow() {
            var nIdx = document.getElementById("cardNumber").selectedIndex;
            $(".user_card_wrap_1").hide();
			$(".user_card_wrap_1").eq(nIdx).show();
			chargeSum();
        }
        
        /*충전금액 합계 구하기*/
        function chargeSum() {
            var nIdx = document.getElementById("cardNumber").selectedIndex;
			//카드잔액
			var tmp = Number($(".trs_card").eq(nIdx).data("cash"));
			//충전금액
            var tmp2 = Number($("input[name='price']:checked").val());
			//합계
			var sum = tmp + tmp2;
			$("#afterChargeBalance").html(sum);
        }
        

        
        /*AUTO 카드 선택시 */
        $(document).on("change", "#cardNumber_AUTO", CardShow_AUTO);
        /*AUTO 자동충전일 선택시 */
        $(document).on("change", "input[name='autoReloadDay']", chargeSum_AUTO);
        /*AUTO 충전금액 선택시 */
        $(document).on("change", "input[name='priceA']", chargeSum_AUTO);
        
        /*AUTO 카드 정보 보이기 */
        function CardShow_AUTO() {
            var nIdx = document.getElementById("cardNumber_AUTO").selectedIndex;
            $(".user_card_wrap_AUTO").hide();
			$(".user_card_wrap_AUTO").eq(nIdx).show();
			var cardName = $(".trs_card_AUTO").eq(nIdx).text();
			//카드이름html
			$(".chargeCardName").html("[" + cardName + "]");
			chargeSum_AUTO();
        }
        
        /*AUTO 충전 설명문 변경*/
        function chargeSum_AUTO() {
            var nIdx = document.getElementById("cardNumber_AUTO").selectedIndex;
			//충전금액
            var cash = Number($("input[name='priceA']:checked").val());
			cash = cash / 10000;
			$(".totPrice").html(cash + "만원");
			//충전일
			var date = $("input[name='autoReloadDay']:checked").val();
			if (date == "99") {
				date = "말";
			}
			$(".chargeDate").html("매월 " + date + "일");
        }

        
        
        /*탭*/
        $(document).on("click", ".card_charge_wrap>h5>a", function() {
            $(".card_charge_wrap>h5>a").removeClass("on");
            $(this).addClass("on");
            $(".card_charge_wrap>article").hide();
            $(this).parents().next().show();
        });

        /*자동충전
        $("input[name=autoReloadType]").click(function() {
            // 기준하한
            if ($(this).val() == 2) {
                $(".autoReloadDay").hide();
                $(".autoReloadDay").next().show();
                // 월정액
            } else if ($(this).val() == 1) {
                $(".autoReloadDay").next().hide();
                $(".autoReloadDay").show();
            }
        });*/
        
        //일반충전
        $("#frm_NORMAL").submit(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            var nIdx = document.getElementById("cardNumber").selectedIndex;
            var card_id = Number($(".trs_card").eq(nIdx).val());
            var cash = Number($("input[name='price']:checked").val());
            
			$.post(ROOT_URL + '/my/rest/charge', {
            	card_id: card_id,
            	cash: cash
            }, function(json) {
            	if (json.rt == "OK") {
                    alert("카드가 충전되었습니다. 충전된 카드 상세 페이지로 이동합니다.");
            		window.location = ROOT_URL + "/my/mycard_view/"+json.card_id;
            	}
            });
        });

        //자동충전
        $("#frm_AUTO").submit(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            alert("설정완료");
        });
    });
    </script>
</body>

</html>