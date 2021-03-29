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
                <form id="login" action="" method="post">
                    <fieldset>
                        <legend class="hid">로그인 폼</legend>
                        <strong class="login_ttl">로그인</strong>
                        <section class="login_form">
                            <p class="find_form_txt">
                                <span class="t_006633">Welcome!</span> 스타벅스커피 코리아에 오신 것을 환영합니다.
                            </p>
                            <div class="login_input_box bd_none">
                                <label for="txt_user_id" class="hid">아이디</label> <input type="text" class="login_id mb10" id="user_id" name="user_id" placeholder="아이디를 입력해주세요." maxlength="20" required="required" /> <label for="txt_user_pw" class="hid">비밀번호</label>
                                <input type="password" class="login_pw mb10" id="user_pw" name="user_pw" placeholder="비밀번호를 입력해 주세요." maxlength="20" required="required" autocomplete="off" /> <span class="checkWrap"> <input type="checkbox" name="idRemb" id="idRemb" class="mem2" /> <label for="idRemb">아이디 저장</label>
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
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
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
        $("#login").validate({
            /*입력검사 규칙*/
            rules: {
                /*name속성 : {required는 필수, 그외 부가 기능}*/
                user_id: { required: true, alphanumeric: true },
                user_pw: { required: true, minlength: 4, maxlength: 20 }
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                user_id: {
                    required: "아이디를 입력하세요.",
                    alphanumeric: "존재하지 않는 아이디입니다."
                },
                user_pw: {
                    required: "비밀번호를 입력하세요.",
                    minlength: "존재하지 않는 비밀번호입니다.",
                    maxlength: "존재하지 않는 비밀번호입니다."
                }
            }
        }); //end validate()

        /*폼의 데이터 전송(SUBMIT) 이벤트*/
        $("#login").submit(function(e) {
            /*기본 동작 수행 방식*/
            e.preventDefault();

            /*로그인 - ajax로 성공여부 json데이터 받아와서 어쩌구*/

            /*if문안에 로그인완료랑 url*/
            alert("로그인 완료");
            //처리 완료 - 원래라면 백엔드페이지로 SUBMIT할 부분

        });
    });
    </script>
</body>

</html>