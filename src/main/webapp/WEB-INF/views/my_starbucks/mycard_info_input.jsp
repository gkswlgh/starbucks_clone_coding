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
                        <img src="//image.istarbucks.co.kr/common/img/util/reg_card_ttl.png" alt="카드 등록" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my_starbucks"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_card"><span class="en">My 스타벅스 카드</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/mycard_info_input"><span class="en">카드 등록</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <div class="cont">
            <div class="cont_inner">
                <form action="${pageContext.request.contextPath}/my/rest/mycard_info_input" id="mycard_input" name="mycard_input" class="mycard_input_frm" method="post">
                    <fieldset>
                        <legend>카드 등록 입력폼</legend>
                        <!-- 테이블 -->
                        <div class="voc_input_tbl mycard_info_input_tbl">
                            <!-- 인삿말 -->
                            <div class="">
                                <strong> 스타벅스 카드 정보 입력 </strong>
                            </div>
                            <!-- 인삿말 끝 -->
                            <p class="must_input">표시 항목은 필수 입력 사항입니다.</p>
                            <table summary="카드명, 카드번호, PIN번호">
                                <caption>카드명, 카드번호, PIN번호에 대한 테이블</caption>
                                <colgroup>
                                    <col width="180" />
                                    <col width="720" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">카드명 </th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="voc_ttl_input1 w350" id="card_name" name="card_name" placeholder="카드명 최대 20자" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">카드번호 (16자리) <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="cellphone_input" id="card_num1" name="card_num1" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="card_num2" name="card_num2" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="card_num3" name="card_num3" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="card_num4" name="card_num4" maxlength="4" ref="num" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">PIN 번호 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="voc_ttl_input1 w350" id="pin_num" name="pin_num" placeholder="PIN 번호 8자리 입력 (필수)" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="agree_checkbox clean">
                                                <input id="agree1" name="agree1" type="checkbox" /> <label for="agree1">스타벅스 카드 이용약관 동의 <a href="${pageContext.request.contextPath}/" title="스타벅스 카드 이용약관 동의 보러가기"><span class="cf66">(필수)</span></a></label>
                                                <input id="agree2" name="agree2" type="checkbox" /> <label for="agree2">개인정보 수집, 이용 동의 <a href="${pageContext.request.contextPath}/" title="개인정보 수집, 이용 동의 보러가기"><span class="cf66">(필수)</span></a></label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 테이블 끝 -->
                        <div class="voc_info_input_btn1">
                            <button type="submit">카드 등록하기</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {

        /*유효성 검사 추가 함수*/

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#mycard_input").validate({
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
                card_name: { required: true, minlength: 4, maxlength: 20 },
                card_num1: { required: true, number: true, minlength: 4, maxlength: 4 },
                card_num2: { required: true, number: true, minlength: 4, maxlength: 4 },
                card_num3: { required: true, number: true, minlength: 4, maxlength: 4 },
                card_num4: { required: true, number: true, minlength: 4, maxlength: 4 },
                pin_num: { required: true, number: true, minlength: 8, maxlength: 8 },
                agree1: "required",
                agree2: "required"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                card_name: {
                    required: "카드명을 입력하세요.",
                    minlength: "카드명은 최소 4글자 이상 입력해야 합니다.",
                    maxlength: "카드명은 최대 20글자까지만 입력 가능합니다."
                },
                card_num1: {
                    required: "카드 번호를 입력하세요.",
                    number: "카드 번호는 숫자로 입력해 주세요.",
                    minlength: "카드 번호는 각 4자리 숫자로 입력해 주세요.",
                    maxlength: "카드 번호는 각 4자리 숫자로 입력해 주세요."
                },
                card_num2: {
                    required: "카드 번호를 입력하세요.",
                    number: "카드 번호는 숫자로 입력해 주세요.",
                    minlength: "카드 번호는 각 4자리 숫자로 입력해 주세요.",
                    maxlength: "카드 번호는 각 4자리 숫자로 입력해 주세요."
                },
                card_num3: {
                    required: "카드 번호를 입력하세요.",
                    number: "카드 번호는 숫자로 입력해 주세요.",
                    minlength: "카드 번호는 각 4자리 숫자로 입력해 주세요.",
                    maxlength: "카드 번호는 각 4자리 숫자로 입력해 주세요."
                },
                card_num4: {
                    required: "카드 번호를 입력하세요.",
                    number: "카드 번호는 숫자로 입력해 주세요.",
                    minlength: "카드 번호는 각 4자리 숫자로 입력해 주세요.",
                    maxlength: "카드 번호는 각 4자리 숫자로 입력해 주세요."
                },
                pin_num: {
                    required: "PIN번호를 입력하세요.",
                    number: "PIN번호는 8자리 숫자로 입력해 주세요.",
                    minlength: "PIN번호는 8자리 숫자로 입력해 주세요.",
                    maxlength: "PIN번호는 8자리 숫자로 입력해 주세요."
                },
                agree1: "스타벅스 카드 이용약관에 동의해 주세요.",
                agree2: "개인정보 수집, 이용에 동의해 주세요."
            }
        }); //end validate()

        $('#mycard_input').ajaxForm({
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
						if (confirm("카드가 등록되었습니다. 카드 조회 페이지로 이동하시겠습니까?")) {
				            window.location = ROOT_URL + '/my/mycard_list';
						}
					} else {
						alert("작성폼을 다시 한번 확인하세요.");
						return false;
					}
				}
		});// end ajax
        
    });
    </script>
</body>

</html>