<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<div id="container"></div>
    <div class="find_mem_wrap">
        <div class="find_mem_inner">
            <form id="myinfo_change_pw" name="myinfo_change_pw" action="" method="post">
                <fieldset>
                    <legend class="hid">회원 개인정보를 조회하는 폼</legend>
                    <div class="find_mem_ttl">비밀번호 변경</div>
                    <section class="find_mem_form">
                        <div class="find_mem_result">
                            <div class="find_mem_sally"></div>
                            <div class="mem_result_txt"><span class="result_txt_sub">새로운 비밀번호로 변경 하실 수 있습니다.</span>
                            </div>
                        </div>
                        <div class="find_mem bd_none">
                            <div class="find_mem_input_box bd_none">
                                <input type="text" class="change_pw mb10" id="txt_change_pw_id" name="txt_change_pw_id" value="회원 아이디" disabled /></div>
                            <span class="result_txt_sub"><b>현재 비밀번호</b></span>
                            <label for="txt_change_pw" class="hid">비밀번호</label>
                            <div class="find_mem_input_box bd_none">
                                <input type="password" class="change_pw mb10" id="txt_change_pw_now" name="txt_change_pw_now" placeholder="비밀번호를 입력해 주세요." maxlength="20" required="required" autocomplete="off" /></div>
                            <span class="result_txt_sub"><b>새 비밀번호</b></span>
                            <div class="find_mem_input_box bd_none">
                                <label for="txt_change_pw" class="hid">비밀번호</label>
                                <input type="password" class="change_pw mb10" id="txt_change_pw" name="txt_change_pw" placeholder="영문, 숫자 혼합하여 10~20자리 이내로 입력하세요." maxlength="20" required="required" autocomplete="off" />
                                <label for="txt_change_pw_check" class="hid">비밀번호 확인</label>
                                <input type="password" class="change_pw_check mb10" id="txt_change_pw_re" name="txt_change_pw_re" placeholder="비밀번호를 다시 한번 입력해 주세요." maxlength="20" required="required" autocomplete="off" />
                                <p class="btn_find_mem">
                                    <button type="submit">확인</button>
                                </p>
                                <p class="input_warn_text t_006633">비밀번호 확인이 잘못되었습니다.
                                </p>
                            </div>
                        </div>
                    </section>
                </fieldset>
            </form>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
    <!-- 사용자스크립트 -->
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

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#myinfo_change_pw").validate({
            /*입력검사 규칙*/
            rules: {
                /*{required는 필수, 그외 부가 기능}*/
                txt_change_pw_now: { required: true, minlength: 4, maxlength: 20 },
                txt_change_pw: { required: true, minlength: 4, maxlength: 20 },
                txt_change_pw_re: { required: true, equalTo: "#txt_change_pw" }
            },
            /*규칙이 맞지 않은 경우의 메시지*/
            messages: {
                /*rules에 맞지 않을 경우 메시지*/
                txt_change_pw_now: {
                    required: "비밀번호를 입력하세요.",
                    minlength: "비밀번호는 4글자 이상 입력하셔야 합니다.",
                    maxlength: "비밀번호는 최대 20자까지 입력 가능합니다."
                },
                txt_change_pw: {
                    required: "새 비밀번호를 입력하세요.",
                    minlength: "새 비밀번호는 4글자 이상 입력하셔야 합니다.",
                    maxlength: "새 비밀번호는 최대 20자까지 입력 가능합니다."
                },
                txt_change_pw_re: {
                    required: "새 비밀번호 확인값을 입력하세요.",
                    equalTo: "새 비밀번호 확인이 잘못되었습니다."
                }
            }
        }); //end validate()
    });
    </script>
</body>

</html>