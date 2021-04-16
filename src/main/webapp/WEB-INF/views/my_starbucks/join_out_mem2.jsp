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
                        <img src="${pageContext.request.contextPath}/assets/img/util/tit02.png" alt="회원탈퇴" />
                    </h4>
                    <ul class="smap">
                        <li><a href="#"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="#"><span class="en">회원탈퇴</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <div class="wrapper">
            <div class="inner">
            <form id="join_out_mem" name="join_out_mem" action="${pageContext.request.contextPath}/rest/account/join_out" method="post">
                <p class="myinfo_tit">회원 탈퇴</p>
                <div class="info_input_guide">
                    <ul>
                        <li>탈퇴를 진행하기 위해 비밀번호를 입력해주세요.</li>
                    </ul>
                    <input type="hidden" id="id"  name="id" value="${member.id}" />
                    <input type="hidden" id="user_id"  name="user_id" value="${member.user_id}" />
                    <input type="password" id="user_pw" name="user_pw"/>
                </div>
                    <div class="join_out_btn">
                        <button type="submit">회원 탈퇴하기</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    
    $(function() {

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#join_out_mem").validate({
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
                id: { required: true },
                user_id: { required: true },
                user_pw: { required: true }
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                id: {
                    required: "로그인 상태가 아닙니다."
                },
                user_id: {
                    required: "로그인 상태가 아닙니다."
                },
                user_pw: {
                    required: "비밀번호를 입력하세요."
                }
            }
        });
        
        $('#join_out_mem').ajaxForm({
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
                    alert("회원 탈퇴가 성공적으로 완료되었습니다.");
		            window.location = ROOT_URL + '/';
				} else {
					alert("탈퇴 실패. 다시 한번 시도해주세요.");
					return false;
				}
			}
		});// end ajax
		
		
    });
    </script>
</body>

</html>