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
            <form id="find_pw" name="find_pw" action="${pageContext.request.contextPath}/rest/account/find_pw" method="post">
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
                                <p class="input_warn_text t_006633">인증번호 전송에 시간이 다소 소요될 수 있습니다.
                                <br>뒤로가기나 새로고침을 누르지 마시고, 다음 페이지로 넘어갈 때까지 잠시 기다려주시기 바랍니다.
                                </p>
                            </div>
                        </div>
                    </section>
                </fieldset>
            </form>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <!-- 사용자스크립트 -->
    <script type="text/javascript">
    $(function() {

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#find_pw").validate({
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

        $('#find_pw').ajaxForm({
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
			            window.location = ROOT_URL + '/account/find_pw_au/'+ json.id;
					} else {
						alert("통신 실패. 다시 시도해주세요.");
						return false;
					}
				}
		});// end ajax
        
    });
    </script>
</body>

</html>