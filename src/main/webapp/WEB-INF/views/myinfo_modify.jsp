<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <div id="container">
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <form action="#" id="myinfo_modify" name="myinfo_modify" class="join_input_frm" method="post" enctype="multipart/form-data">
                    <input type="hidden" value="0" id="store_cd" name="store_cd" />
                    <fieldset>
                        <legend>개인정보 확인 및 수정 입력 폼</legend>
                        <!-- 테이블 -->
                        <div class="voc_input_tbl">
                            <!-- 인삿말 -->
                            <div class="">
                                <strong> 개인정보 확인 및 수정 </strong>
                            </div>
                            <!-- 인삿말 끝 -->
                            <p class="must_input">표시 항목은 필수 입력 사항입니다.</p>
                            <table summary="아이디, 이름, 성별, 이메일 주소, 휴대전화, 생일">
                                <caption>아이디, 이름, 성별, 이메일 주소, 휴대전화, 생일에 대한 테이블</caption>
                                <colgroup>
                                    <col width="180" />
                                    <col width="720" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">아이디 (변경 불가능)</th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="voc_ttl_input1 w300" id="user_id" name="user_id" value="회원 아이디" disabled />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이름 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="voc_ttl_input1 w160" id="user_name" name="user_name" onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">성별 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" />
                                        </th>
                                        <td>
                                            <div class="gender_wrap">
                                                <p class="gender_select_wrap">
                                                    <label for="gender" class="hid">성별</label> <select name="gender" id="gender">
                                                        <option value>성별</option>
                                                        <option value="F">여자</option>
                                                        <option value="M">남자</option>
                                                    </select>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일 주소 (본인 확인)<img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="mail_input" id="email1" name="email1" />
                                                <p class="mail_at">@</p>
                                                <input type="text" id="email2" name="email2" class="mail_input" value />
                                                <p class="mail_sel_wrap">
                                                    <label for="mail">직접입력</label> <select id="mail">
                                                        <option selected="selected" value>직접입력</option>
                                                        <option value="hotmail.com">hotmail.com</option>
                                                        <option value="yahoo.co.kr">yahoo.co.kr</option>
                                                        <option value="hanmir.com">hanmir.com</option>
                                                        <option value="naver.com">naver.com</option>
                                                        <option value="empal.com">empal.com</option>
                                                        <option value="hitel.net">hitel.net</option>
                                                        <option value="netian.com">netian.com</option>
                                                        <option value="nate.com">nate.com</option>
                                                        <option value="korea.com">korea.com</option>
                                                        <option value="hanmail.net">hanmail.net</option>
                                                        <option value="freechal.com">freechal.com</option>
                                                        <option value="lycos.co.kr">lycos.co.kr</option>
                                                        <option value="gmail.com">gmail.com</option>
                                                    </select>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대전화</th>
                                        <td>
                                            <div class="sel_wrap">
                                                <p class="phone_sel_wrap">
                                                    <label for="phone1">010</label> <select id="phone1" name="phone1">
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <option value="016">016</option>
                                                        <option value="017">017</option>
                                                        <option value="018">018</option>
                                                        <option value="109">019</option>
                                                    </select>
                                                </p>
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="phone2" name="phone2" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="phone3" name="phone3" maxlength="4" ref="num" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">생일</th>
                                        <td>
                                            <div class="sel_wrap mt10">
                                                <input type="date" id="birthdate" class="birthdate" />
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 테이블 끝 -->
                        <div class="voc_info_input_btn1">
                            <button type="submit">정보 수정하기</button>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
    <script type="text/javascript">
    $(function() {
        var email = $("#email1").val() + "@" + $("#email2").val();
        var tel = $("#phone1").val() + $("#phone2").val() + $("#phone3").val();

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
        //한글검사
        $.validator.addMethod("kor", function(value, element) {
            return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
        });

        //한국식전화번호검사
        $.validator.addMethod("phone", function(value, element) {
            return this.optional(element) ||
                /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) ||
                /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
        });

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#myinfo_modify").validate({
            /*입력검사 규칙*/
            rules: {
                /*name속성 : {required는 필수, 그외 부가 기능}*/
                user_name: { required: true, kor: true },
                email1: { required: true, alphanumeric: true },
                email2: "required",
                phone1: "required",
                phone2: { required: true, number: true },
                phone3: { required: true, number: true },
                birthdate: { required: true, date: true },
                gender: "required"
            },
            /*규칙이 맞지 않은 경우의 메시지*/
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                user_name: {
                    required: "이름를 입력하세요.",
                    kor: "이름은 한글만 입력 가능합니다."
                },
                email1: {
                    required: "이메일을 입력하세요.",
                    alphanumeric: "이메일 형식이 잘못되었습니다."
                },
                email2: "이메일을 입력하세요.",
                phone1: "연락처 형식이 잘못되었습니다.",
                phone2: {
                    required: "연락처를 입력하세요.",
                    number: "연락처 형식이 잘못되었습니다."
                },
                phone3: {
                    required: "연락처를 입력하세요.",
                    number: "연락처 형식이 잘못되었습니다."
                },
                birthdate: {
                    required: "생년월일을 입력하세요.",
                    date: "생년월일의 형식이 잘못되었습니다."
                },
                gender: "성별을 선택해 주세요."
            }
        }); //end validate()
    });
    </script>
</body>

</html>