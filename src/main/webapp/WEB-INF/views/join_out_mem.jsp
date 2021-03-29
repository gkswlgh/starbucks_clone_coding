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
                <p class="myinfo_tit">스타벅스 리워드 서비스 해지 시 유의사항</p>
                <div class="info_input_guide">
                    <ul>
                        <li>회원 탈퇴 시에는 고객님의 개인정보 및 등록하신 스타벅스 카드의 정보가 모두 삭제됩니다.</li>
                        <li>회원탈퇴에 의해 등록 해지된 일반 스타벅스 카드는 재등록을 하지 않은 상태에서도 스타벅스에서 정상적으로 이용이 가능하지만, 별의 지급, 분실, 분실신고 시 잔액보장 등의 다양한 스타벅스 혜택은 더 이상 누리실 수 없게 됩니다.</li>
                        <li>정상 이용하셨던 일반 스타벅스 카드는 탈퇴와 함께 자동 해지되어 회원 재가입 후 본인 또는 다른 사용자에 의해 다시 등록될 수 있지만 이전에 사용하셨던 거래정보는 확인하실 수 없습니다.</li>
                        <li>중지된 카드에 잔액이 남아있는 경우, 잔액이전이나 잔액환불을 통해 잔액이 0원이 되어야 회원탈퇴가 가능하며, 중지된 카드는 재사용 또는 재등록이 불가합니다.</li>
                    </ul>
                </div>
                <form id="join_out_mem" name="join_out_mem">
                    <div class="agree_txt mb40">
                        <input id="agree1" name="agree" type="checkbox" /> <label for="agree1">회원탈퇴 후 스타벅스 리워드 혜택 및 등록한 스타벅스 카드의 소유권 상실에 대해 동의합니다.</label>
                    </div>
                    <div class="join_out_btn">
                        <button type="submit">스타벅스 리워드 서비스 이용내역 일괄삭제</button>
                    </div>
                </form>
            </div>
        </div>
        <!-- 내용 끝 -->
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
            submitHandler: true, //수동 submit
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
        $("#join_out_mem").validate({
            /*입력검사 규칙*/
            rules: {
                /*name속성 : {required는 필수, 그외 부가 기능}*/
                agree: "required"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/

                agree: "필수 동의 사항에 체크해 주세요."
            },
            /*수동 submit*/
            submitHandler: function(form) {
                /*비밀번호 알럿창 - ajax로 성공여부 어쩌구*/
                var join_out_pw = prompt("비밀번호를 입력하세요", "");

                if (join_out_pw != "") {
                    //처리 완료 - 원래라면 백엔드페이지로 SUBMIT할 부분
                    alert("탈퇴 완료");
                    $(form).ajaxSubmit();
                }
            }
        });
    });
    </script>
</body>

</html>