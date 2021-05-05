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
            <form id="change_pw" name="change_pw" action="${pageContext.request.contextPath}/rest/account/change_pw" method="post">
                <fieldset>
                    <legend class="hid">회원 개인정보를 조회하는 폼</legend>
                    <div class="find_mem_ttl">비밀번호 찾기</div>
                    <section class="find_mem_form">
                        <div class="find_mem_result">
                            <div class="find_mem_sally"></div>
                        </div>
                        <div class="find_mem bd_none">
                            <strong>비밀번호 변경하기</strong>
                            <div class="find_mem_input_box bd_none">
                                <label for="txt_change_pw" class="hid">비밀번호</label>
                                <input type="password" class="change_pw mb10" id="txt_change_pw" name="txt_change_pw" placeholder="비밀번호를 입력해 주세요." maxlength="20" required="required" autocomplete="off" />
                                <label for="txt_change_pw_check" class="hid">비밀번호 확인</label>
                                <input type="password" class="change_pw_check mb10" id="txt_change_pw_check" name="txt_change_pw_check" placeholder="비밀번호를 다시 한번 입력해 주세요." maxlength="20" required="required" autocomplete="off" />
                                <p class="btn_find_mem">
                                    <button type="submit">비밀번호 변경</button>
                                </p>
                                <input type="hidden" id="id" name="id" value="${output.id}"/>
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
    $(function(e) {

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#change_pw").validate({
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
                id: { required: true },
                txt_change_pw: { required: true, minlength: 4, maxlength: 20 },
                txt_change_pw_check: { required: true, equalTo: "#txt_change_pw" }
            },
            /*규칙이 맞지 않은 경우의 메시지*/
            messages: {
                /*rules에 맞지 않을 경우 메시지*/
                id: {
                    required: "회원정보가 없습니다."
                },
                txt_change_pw: {
                    required: "비밀번호를 입력하세요.",
                    minlength: "비밀번호는 4글자 이상 입력하셔야 합니다.",
                    maxlength: "비밀번호는 최대 20자까지 입력 가능합니다."
                },
                txt_change_pw_check: {
                    required: "비밀번호 확인값을 입력하세요.",
                    equalTo: "비밀번호 확인이 잘못되었습니다."
                }
            }
        }); //end validate()
        

        $('#change_pw').ajaxForm({
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
			            window.location = ROOT_URL + '/account/find_pw_ok/'+ json.id;
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