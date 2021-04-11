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
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">My 스타벅스 카드</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/"><span class="en">카드 등록</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <div class="cont">
            <div class="cont_inner">
                <form action="#" id="mycard_input" name="mycard_input" class="mycard_input_frm" method="post" enctype="multipart/form-data">
                    <input type="hidden" value="0" id="store_cd" name="store_cd" />
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
                                                <input type="text" class="cellphone_input" id="card_num1" name="card_num" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="card_num2" name="card_num" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="card_num3" name="card_num" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="card_num4" name="card_num" maxlength="4" ref="num" />
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

        /*플러그인의 기본 설정 옵션 추가*/
        jQuery.validator.setDefaults({
            onkeyup: false, //키보드 입력시 검사 안함
            onclick: false, //input 태그 클릭시 검사 안함
            onfocusout: false, //포커스가 빠져나올 때 검사 안함
            showErrors: function(errorMap, errorList) { //에러 발생시 호출되는 함수 재정의
                //에러가 있을 때만
                if (this.numberOfInvalids()) {
                    //0번째 에러 메시지에 대한 javascript 기본 alert함수 사용
                    alert(errorList[0].message);
                    //0번째 에러 발생 항목에 포커스 지정
                    $(errorList[0].element).focus();
                }
            }
        });

        /*유효성 검사 추가 함수*/
        //카드명검사
        $.validator.addMethod("cardname", function(value, element) {
            return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value) || /^[a-zA-Z0-9]*$/i.test(value);
        });

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#mycard_input").validate({
            /*입력검사 규칙*/
            rules: {
                /*name속성 : {required는 필수, 그외 부가 기능}*/
                card_name: { required: true, cardname: true, minlength: 4, maxlength: 20 },
                pin_num: { required: true, number: true, minlength: 8, maxlength: 8 },
                agree1: "required",
                agree2: "required"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                card_name: {
                    required: "카드명을 입력하세요.",
                    cardname: "카드명은 한글, 영어, 숫자의 조합만 입력 가능합니다.",
                    minlength: "카드명은 최소 4글자 이상 입력해야 합니다.",
                    maxlength: "카드명은 최대 20글자까지만 입력 가능합니다."
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

        $("#mycard_input").submit(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();
            alert("카드등록완료");
        });
    });
    </script>
</body>

</html>