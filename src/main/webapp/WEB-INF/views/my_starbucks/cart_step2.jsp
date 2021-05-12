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
                        <div class="gift_bg_step2">
                            <span class="hid">장바구니 주문하기 (4단계)</span>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step1">장바구니</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step_on icon_step2_on">주문서 입력</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step3">결제 하기</strong>
                            </div>
                            <div class="gift_step_each">
                                <strong class="icon_step icon_step4">결제 완료</strong>
                            </div>
                            <span class="hid">중 주문서 입력 진행중</span>
                        </div>
                    </div>
                    <div class="gift_card_txt">
                        <h5 class="m0">주문서 입력을 해주세요.</h5>
                    </div>
                    <!-- form -->
                    <form action="${pageContext.request.contextPath}/my/cart_step3" method="post" id="frmUpload" name="frmUpload">
                        <input type="hidden" name="cart_id" value="${output.cart_id}">
                        <fieldset>
                            <legend class="hid">주문서 입력을 해주세요.</legend>
                            <!-- 테이블 -->
                            <div class="wrapper">
                                <div class="inner w1100 p0 ma">
                                    <div class="w1100 m0">
                                        <table id="gift_info_tbl" class="gift_info_tbl" summary="선물할 카드, 선물할 방법, 받는 사람, 메시지 입력, 금액 선택, 전송방법, 결제 수단 선택, 유의사항">
                                            <caption>선물할 카드, 선물할 방법, 받는 사람, 메시지 입력, 금액 선택, 전송방법, 결제 수단 선택, 유의사항에 대한 테이블</caption>
                                            <colgroup>
                                                <col width="18.1818%" />
                                                <col width="81.8182%" />
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">배송지 입력</th>
                                                    <td>
                                                        <div class="shop-inner shop_delibary_controll">
                                                            <div class="shop-item shop-max">
                                                                <span class="label hid">배송지선택</span>
                                                                <div class="shop-item-inner">
                                                                    <div class="adr-wrap adr_inputbox">
                                                                        <input type="button" class="btn-em btn--narrow" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                                                                        <input type="text" value="${member.postcode}" name="zip" class="input--wide" id="sample6_postcode" placeholder="우편번호 찾기를 해주세요." data-validation="required" data-validation-error-msg="우편번호 찾기를 해주세요." readonly>
                                                                        <input type="text" value="${member.addr1}" name="address" class="input--wide input_address" id="sample6_address" placeholder="주소지를 입력해주세요." data-validation="required" data-validation-error-msg="주소지를 입력해주세요." readonly>
                                                                        <input type="text" value="${member.addr2}" name="addressDetail" id="sample6_detailAddress" class="input--wide input_address" placeholder="상세주소를 입력해주세요." data-validation="required" data-validation-error-msg="상세주소를 입력해주세요.">
                                                                    </div>
                                                                    <div class="checkbox clean">
                                                                        <input id="add_addr" name="add_addr" type="checkbox" value="Y" checked/> <label class="c666" for="add_addr">해당 정보를 나의 배송지에 추가 </label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">휴대번호 입력 (회원 정보)</th>
                                                    <td>
                                                        <div class="sel_wrap">
                                                            <p class="phone_sel_wrap">
			                                                    <label for="phone1">010</label> <select id="phone1" name="phone1" disabled>
																<option value="010"
																	<c:if test="${fn:substringBefore(member.phone, ')') == '010'}">selected</c:if>>010</option>
																<option value="011"
																	<c:if test="${fn:substringBefore(member.phone, ')') == '011'}">selected</c:if>>011</option>
																<option value="016"
																	<c:if test="${fn:substringBefore(member.phone, ')') == '016'}">selected</c:if>>016</option>
																<option value="017"
																	<c:if test="${fn:substringBefore(member.phone, ')') == '017'}">selected</c:if>>017</option>
																<option value="018"
																	<c:if test="${fn:substringBefore(member.phone, ')') == '018'}">selected</c:if>>018</option>
																<option value="109"
																	<c:if test="${fn:substringBefore(member.phone, ')') == '019'}">selected</c:if>>019</option>
															</select>
			                                                </p>
			                                                <p class="cell_hyphen">-</p>
			                                                <input type="text" class="cellphone_input" id="phone2" name="phone2" maxlength="4" ref="num"
			                                                value="${fn:substringBefore(fn:substringAfter(member.phone, ')'), '-')}" disabled/>
			                                                <p class="cell_hyphen">-</p>
			                                                <input type="text" class="cellphone_input" id="phone3" name="phone3" maxlength="4" ref="num" 
			                                                value="${fn:substringAfter(member.phone, '-')}" disabled/>
			                                             </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">결제 수단 선택</th>
                                                    <td>
                                                        <div class="sel_wrap tbl_card_radio">
                                                            <span class="radio_wrap radio_wrap_mn">
                                                                <input type="radio" name="gopaymethod" id="payMethod1" value="N" checked>
                                                                <label for="payMethod1">신용카드</label>
                                                	<c:choose>
							        				<c:when test="${cardList != null && fn:length(cardList) > 0}">
                                                          <input type="radio" name="gopaymethod" id="payMethod2" value="S" >
                                                          <label for="payMethod2">스타벅스 카드</label>
                                                          <div class="card_select">
                                                          <!-- 드롭박스 -->
                                                                    <div class="sel_wrap">
                                                                        <p class="user_sel_wrap">
                                                                            <select id="cardNumber_AUTO" name="card_id" class="cardNumber" disabled>
                                                                                <c:forEach var="item" items="${cardList}" varStatus="status">
										                                              <option class="trs_card_AUTO"  data-cash="${item.cash}" value="${item.card_id}">${item.card_name}</option>
															           		 	</c:forEach>
                                                                            </select>
                                                                        </p>
                                                                    </div>
                                                          <!-- 드롭박스 끝 -->
                                                          <!-- 카드정보 -->
					                                                <c:forEach var="item" items="${cardList}" varStatus="status">
					                                                <div class="user_card_wrap_AUTO user_card_wrap clear" style="display: none;" data-cash="${item.cash}" data-card-id="${item.card_id}">
					                                                    <figure>
					                                                        <img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt class="cardImgUrl">
					                                                    </figure>
					                                                    <p>
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
                                                          <!-- 카드정보 끝 -->
                                                            </div>
					                            	</c:when>
					                            	<c:otherwise>
					                            	<input type="radio" name="gopaymethod" id="payMethod2" value="S" disabled>
                                                                <label for="payMethod2">스타벅스 카드</label>
					                            	</c:otherwise>
										    		</c:choose>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">유의사항</th>
                                                    <td>
                                                        <ul class="gift_info_adding2">
                                                            <li>
                                                                <span class="gift_info_add_fb">딜리버리 서비스 이용 시 매장 상황에 따라 40분 이상 소요될 수 있습니다.<br>
                                                                    (40분이 지나도 도착하지 않을 시 매장으로 직접 문의 바랍니다.)</span>
                                                            </li>
                                                        </ul>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- 테이블 끝 -->
                            <div class="gift_info_send_btns">
                                <ul>
                                    <li class="gift_info_send_btn1"><a onclick="history.back(); return false;">뒤로</a></li>
                                    <li class="gift_info_send_btn2"><button type="submit">다음</button></li>
                                </ul>
                            </div>
                        </fieldset>
                    </form>
                    <!-- form 끝 -->
                </section>
                <!-- 내용 끝 -->
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <!-- 다음 우편번호 찾기 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }

                } else {
                    extraAddr = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr + " " + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    </script>
    <!-- 다음 우편번호 찾기 끝 -->
    <script type="text/javascript">
    $(function() {

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#frmUpload").validate({
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
                /*name속성 : {required는 필수, 그외 부가 기능}*/
                zip: "required",
                address: "required",
                addressDetail: "required",
                cart_id:"required"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                zip: "우편번호 찾기를 해주세요.",
                address: "주소지를 입력해주세요.",
                addressDetail: "상세주소를 입력해주세요.",
                cart_id: "상품 정보가 없습니다. 처음부터 다시 시도해주세요."
            }
        }); //end validate()



        /*결제수단 선택시 */
        $(document).on("click", "[name='gopaymethod']", function() {
            if ($("#payMethod1").prop('checked')) {
                $("#cardNumber_AUTO").prop('disabled', true);
                $(".user_card_wrap").hide();
            } else if ($("#payMethod2").prop('checked')) {
                $("#cardNumber_AUTO").prop('disabled', false);
                $(".user_card_wrap").show();
            }
        });
        
        /*AUTO 카드 선택시 */
        $(document).on("change", "#cardNumber_AUTO", CardShow_AUTO);
        $(document).on("change", "#payMethod2", CardShow_AUTO);
        
        /*AUTO 카드 정보 보이기 */
        function CardShow_AUTO() {
            var nIdx = document.getElementById("cardNumber_AUTO").selectedIndex;
            $(".user_card_wrap_AUTO").hide();
			$(".user_card_wrap_AUTO").eq(nIdx).show();
			var cardName = $(".trs_card_AUTO").eq(nIdx).text();
        }
        
    });
    </script>
</body>

</html>