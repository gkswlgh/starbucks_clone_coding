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
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">My 스타벅스카드</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">카드 충전</span></a></li>
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
                            <a href="${pageContext.request.contextPath}/" class="on">일반 충전</a>
                        </h5>
                        <article>
                            <form name="frm_NORMAL" id="frm_NORMAL" method="post">
                                <!-- 테이블 -->
                                <table class="w830 regular_charge gift_info_tbl chargeWh" summary="충전 카드 선택, 충전 금액 선택, 결제 수단 선택, 온라인 충전 시 유의 사항">
                                    <caption>충전 카드 선택, 충전 금액 선택, 결제 수단 선택, 온라인 충전 시 유의 사항에 대한 테이블</caption>
                                    <tbody>
                                        <tr>
                                            <th scope="row">충전 카드 선택
                                            </th>
                                            <td>
                                                <div class="sel_wrap">
                                                    <p class="user_sel_wrap">
                                                        <label for="cardNumber_AUTO">2021 Happy New Year</label>
                                                        <select id="cardNumber_AUTO" name="cardNumber_AUTO" class="cardNumber">
                                                            <option selected="selected" value>2021 Happy New Year</option>
                                                        </select>
                                                    </p>
                                                </div>
                                                <div class="user_card_wrap clear">
                                                    <figure>
                                                        <i class="representative_icon">
                                                            <a href="${pageContext.request.contextPath}/"></a>
                                                        </i>
                                                        <img src="https://image.istarbucks.co.kr/cardImg/20201229/007764.png" alt class="cardImgUrl">
                                                    </figure>
                                                    <p>
                                                        <strong class="en cardNumber">**** - **** - **12 - 1547</strong>
                                                        <br><br>
                                                        최종 사용일 :
                                                        <span class="balanceConfirmDate">2021-01-28 21:57:02</span>
                                                        <br>
                                                        카드 등록일 :
                                                        <span class="cardRegDate">2021-01-28 21:57:02</span>
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">충전 금액 선택 </th>
                                            <td class="clear">
                                                <div class="sel_wrap tbl_card_radio">
                                                    <div class="clear">
                                                        <p class="charge_change">
                                                            충전 후 총 카드 잔액 :
                                                            <span class="en t_006633 afterChargeBalance">0</span>
                                                            원
                                                        </p>
                                                    </div>
                                                    <div class="radio_wrap radio_wrap_mn charge_options">
                                                        <input type="radio" name="price" id="price1" value="100000">
                                                        <label for="price1">10만원</label>
                                                        <input type="radio" name="price" id="price2" value="50000">
                                                        <label for="price2">5만원</label><input type="radio" name="price" id="price3" value="30000" checked="checked">
                                                        <label for="price3">3만원</label><input type="radio" name="price" id="price4" value="10000">
                                                        <label for="price4">1만원</label>
                                                    </div>
                                                </div>
                                                <div class="clear"></div>
                                                <p class="gift_info_adding cf66">스타벅스 카드 온라인 충전은 1만원 단위로 최대 55만원까지 가능하며, 충전 후 합계 잔액이 55만원을 초과할 수 없습니다.
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">결제 수단 선택</th>
                                            <td>
                                                <div class="sel_wrap tbl_card_radio charge_options">
                                                    <span class="radio_wrap radio_wrap_mn">
                                                        <input type="radio" name="gopaymethod" id="payMethod1" value="onlycard" checked="checked">
                                                        <label for="payMethod1">신용카드</label>
                                                        <input type="radio" name="gopaymethod" id="payMethod2" value="onlybank">
                                                        <label for="payMethod2">실시간 계좌이체</label>
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
                            </form>
                            <ul class="charge_tbl_btns">
                                <li class="charge_tbl_btn1"><button type="submit" class="charge_normal">카드 충전</button></li>
                                <li class="charge_tbl_btn2"><a href="${pageContext.request.contextPath}/">취소</a></li>
                            </ul>
                        </article>
                        <h5 class="card_charge_auto">
                            <a href="${pageContext.request.contextPath}/" class>자동 충전</a>
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
                                                    <input type="radio" class="ctype1" name="autoReloadType" id="autoReloadType_1" value="2" checked="checked">
                                                    <label for="autoReloadType_1" class="ctype1">기준 하한 자동 충전</label>
                                                    <input type="radio" class="ctype2" name="autoReloadType" id="autoReloadType_2" value="1">
                                                    <label for="autoReloadType_2" class="ctype2">월 정액 자동 충전</label>
                                                </div>
                                                <p class="ctype_guide">기준 잔액의 이하로 카드의 잔액이 떨어 졌을 경우, 설정하신 충전 금액으로 자동 충전되는 서비스입니다.
                                                </p>
                                                <p class="ctype_guide hid">
                                                    매월 지정한 날짜에 설정해놓은 금액이 자동 충전되는 서비스입니다.
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">충전 카드 선택
                                            </th>
                                            <td>
                                                <div class="sel_wrap">
                                                    <p class="user_sel_wrap">
                                                        <label for="cardNumber_AUTO">2021 Happy New Year</label>
                                                        <select id="cardNumber_AUTO" class="cardNumber">
                                                            <option selected="selected" value>2021 Happy New Year</option>
                                                        </select>
                                                    </p>
                                                </div>
                                                <div class="user_card_wrap clear">
                                                    <figure>
                                                        <i class="representative_icon">
                                                            <a href="${pageContext.request.contextPath}/"></a>
                                                        </i>
                                                        <img src="https://image.istarbucks.co.kr/cardImg/20201229/007764.png" alt class="cardImgUrl">
                                                    </figure>
                                                    <p>
                                                        <strong class="en cardNumber">**** - **** - **12 - 1547</strong>
                                                        <br><br>
                                                        최종 사용일 :
                                                        <span class="balanceConfirmDate">2021-01-28 21:57:02</span>
                                                        <br>
                                                        카드 등록일 :
                                                        <span class="cardRegDate">2021-01-28 21:57:02</span>
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr class="autoReloadDay" style="display: none;">
                                            <th scope="row">자동 충전일 선택
                                                <span class="checkTxt">(최대 2개까지 선택 가능)</span></th>
                                            <td>
                                                <div class="sel_wrap tbl_card_radio charge_options ">
                                                    <span class="ez-checkbox ez-checked">
                                                        <label>
                                                            <input type="checkbox" name="autoReloadDay" value="01" checked="checked">
                                                            매월 1일
                                                        </label>
                                                        <label>
                                                            <input type="checkbox" name="autoReloadDay" value="05">
                                                            매월 5일
                                                        </label>
                                                        <label>
                                                            <input type="checkbox" name="autoReloadDay" value="10">
                                                            매월 10일
                                                        </label>
                                                        <label>
                                                            <input type="checkbox" name="autoReloadDay" value="15">
                                                            매월 15일
                                                        </label>
                                                        <label>
                                                            <input type="checkbox" name="autoReloadDay" value="20">
                                                            매월 20일
                                                        </label>
                                                        <label>
                                                            <input type="checkbox" name="autoReloadDay" value="25">
                                                            매월 25일
                                                        </label>
                                                        <label>
                                                            <input type="checkbox" name="autoReloadDay" value="99">
                                                            매월 말일
                                                        </label>
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">기준 잔액 선택</th>
                                            <td>
                                                <div class="sel_wrap tbl_card_radio charge_options">
                                                    <span class="radio_wrap radio_wrap_mn">
                                                        <label>
                                                            <input type="radio" name="lowestAmount" value="50000">
                                                            5만원
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="lowestAmount" value="30000" checked="checked">
                                                            3만원
                                                        </label>
                                                        <label>
                                                            <input type="radio" name="lowestAmount" value="10000">
                                                            1만원
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
                                                        <input type="radio" name="price" id="price1" value="100000">
                                                        <label for="price1">10만원</label>
                                                        <input type="radio" name="price" id="price2" value="50000">
                                                        <label for="price2">5만원</label><input type="radio" name="price" id="price3" value="30000" checked="checked">
                                                        <label for="price3">3만원</label><input type="radio" name="price" id="price4" value="10000">
                                                        <label for="price4">1만원</label>
                                                    </span>
                                                </div>
                                                <p class="gift_info_adding cf66">스타벅스 카드 온라인 충전은 1만원 단위로 최대 55만원까지 가능하며, 충전 후 합계 잔액이 55만원을 초과할 수 없습니다.
                                                </p>
                                                <p class="charge_will autoReloadDay" style="display: none;">
                                                    <strong class="t_006633">[2021 Happy New Year]</strong>
                                                    카드에
                                                    <strong class="t_006633">매월 1일</strong>
                                                    마다
                                                    <strong class="t_006633 totPrice">1만원</strong>
                                                    이 자동 충전 됩니다.
                                                </p>
                                                <p class="charge_will lowestAmount ">
                                                    <strong class="t_006633">[2021 Happy New Year]</strong>
                                                    카드의 잔액이
                                                    <strong class="t_006633">1만원</strong>
                                                    보다 낮을 경우
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
                                                        <input type="radio" name="gopaymethod" id="payMethod1" value="onlycard" checked="checked">
                                                        <label for="payMethod1">신용카드</label>
                                                        <input type="radio" name="gopaymethod" id="payMethod2" value="onlybank">
                                                        <label for="payMethod2">실시간 계좌이체</label>
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
                            </form>
                            <ul class="charge_tbl_btns">
                                <li class="charge_tbl_btn1"><button type="submit" class="charge_auto">설정 완료</button></li>
                                <li class="charge_tbl_btn2"><a href="${pageContext.request.contextPath}/">취소</a></li>
                            </ul>
                        </article>
                    </section>
                </fieldset>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
    <!-- 사용자스크립트 -->
    <script type="text/javascript">
    $(function() {
        /*탭*/
        $(document).on("click", ".card_charge_wrap>h5>a", function() {
            $(".card_charge_wrap>h5>a").removeClass("on");
            $(this).addClass("on");
            $(".card_charge_wrap>article").hide();
            $(this).parents().next().show();
        });

        /*일반충전*/
        $("#frm_NORMAL").submit(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            alert("충전완료");
        });


        /*자동충전*/
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
        });

        $("#frm_AUTO").submit(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            alert("설정완료");
        });
    });
    </script>
</body>

</html>