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
            <form id="find_pw" name="find_pw" action="" method="post">
                <fieldset>
                    <legend class="hid">회원 개인정보를 조회하는 폼</legend>
                    <div class="find_mem_ttl">비밀번호 찾기</div>
                    <section class="find_mem_form">
                        <div class="find_mem_result">
                            <div class="find_mem_sally"></div>
                            <div class="mem_result_txt">
                                <strong>비밀번호가 기억나지 않으세요?</strong> <span class="result_txt_sub">아래
                                    인증 방법을 통해 비밀번호를 변경 하실 수 있습니다.</span>
                            </div>
                        </div>
                        <div class="find_mem bd_none">
                            <strong>이메일 인증하여 비밀번호 찾기</strong>
                            <div class="find_mem_input_box bd_none">
                                <label for="txt_user_id" class="hid">아이디</label> <input type="text" class="find_mem_input_txt mb10" id="txt_user_id" name="txt_user_id" placeholder="아이디를 입력해주세요." maxlength="20" required="required" /> <label for="txt_user_email" class="hid">이메일</label>
                                <input type="text" class="find_mem_input_txt mb10" id="txt_user_email" name="txt_user_email" placeholder="이메일을 입력해 주세요." maxlength="20" required="required" />
                                <p class="btn_find_mem">
                                    <button type="submit">이메일로 인증번호 보내기</button>
                                </p>
                                <p class="input_warn_text t_006633">존재하지 않는 회원 아이디 혹은 이메일입니다.
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
        $("#find_pw").validate({
            /*입력검사 규칙*/
            rules: {
                /*{required는 필수, 그외 부가 기능}*/
                txt_user_id: { required: true, alphanumeric: true },
                txt_user_email: { required: true, email: true }

            },
            /*규칙이 맞지 않은 경우의 메시지*/
            messages: {
                /*rules에 맞지 않을 경우 메시지*/
                txt_user_id: {
                    required: "아이디를 입력하세요.",
                    alphanumeric: "아이디는 영어, 숫자만 입력 가능합니다."
                },
                txt_user_email: {
                    required: "이메일을 입력하세요.",
                    email: "이메일 형식이 잘못되었습니다."
                }
            }
        }); //end validate()
    });
    </script>
</body>

</html>