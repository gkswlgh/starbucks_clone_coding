<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<div id="container"></div>
    <div class="login_bg_wrap">
        <div class="login_wrap">
            <div class="login_inner">
                <form id="login" action="${pageContext.request.contextPath}/rest/account/login" method="post" autocomplete="off">
                    <fieldset>
                        <legend class="hid">로그인 폼</legend>
                        <strong class="login_ttl">로그인</strong>
                        <section class="login_form">
                            <p class="find_form_txt">
                                <span class="t_006633">Welcome!</span> 스타벅스커피 코리아에 오신 것을 환영합니다.
                            </p>
                            <div class="login_input_box bd_none">
                                <label for="txt_user_id" class="hid">아이디</label> <input type="text" class="login_id mb10" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." maxlength="20" required="required" /> <label for="txt_user_pw" class="hid">비밀번호</label>
                                <!-- 비번자동입력방지... -->
								<input type="password" id="temppwd" name="tempwd" style="display:none;">
                                <input type="password" autocomplete="new-password" class="login_pw mb10" id="user_pw" name="user_pw" placeholder="비밀번호를 입력해 주세요." maxlength="20" required="required" autocomplete="off" /> <span class="checkWrap"> 
                                </span>
                                <p class="btn_mem_login">
                                    <button class="login_btn" type="submit">로그인</button>
                                </p>
                                <p class="input_warn_text t_006633">
                                    * 타 사이트와 비밀번호를 동일하게 사용할 경우 도용의 위험이 있으므로, 정기적인 비밀번호 변경을 해주시길
                                    바랍니다. <br /> * 스타벅스 커피 코리아의 공식 홈페이지는 Internet Explorer 9.0 이상,
                                    Chrome, Firefox, Safari 브라우저에 최적화 되어있습니다.
                                </p>
                            </div>
                            <div class="login_btn_wrap">
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/account/join">회원가입</a></li>
                                    <li><a href="${pageContext.request.contextPath}/account/find_id">아이디 찾기</a></li>
                                    <li class="last"><a href="${pageContext.request.contextPath}/account/find_pw">비밀번호 찾기</a></li>
                                </ul>
                            </div>
                        </section>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#login").validate({
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
                user_id: { required: true },
                user_pw: { required: true }
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                user_id: {
                    required: "아이디를 입력하세요."
                },
                user_pw: {
                    required: "비밀번호를 입력하세요."
                }
            }
        }); //end validate()
        

        $('#login').ajaxForm({
            // submit 전에 호출된다.
            beforeSubmit: function(arr, form, options) {
                // validation 플러그인을 수동으로 호출하여 결과를 리턴한다.
                // 검사규칙에 위배되어 false가 리턴될 경우 submit을 중단한다.
                return $(form).valid();
            },
            success: function(json) {
            	console.log(">> 성공!!!! >> " + json);
				
            	if (json.rt == "OK") {
	                alert("로그인 완료");
		            window.location = ROOT_URL + '/';
				} else {
					alert("아이디 혹은 비밀번호를 다시 한번 확인하세요.");
					return false;
				}
            },
        }); // end ajaxForm

    });
    </script>
</body>

</html>