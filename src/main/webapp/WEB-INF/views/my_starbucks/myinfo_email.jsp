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
                <form method="post" action="${pageContext.request.contextPath}/rest/account/myinfo_email" id="myinfo_modify" name="myinfo_modify" class="join_input_frm">
                    <fieldset>
                        <legend>이메일 수정 입력 폼</legend>
                        <!-- 테이블 -->
                        <div class="voc_input_tbl">
                            <!-- 인삿말 -->
                            <div class="">
                                <strong> 이메일 수정 </strong>
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
                                        <th scope="row">아이디 확인</th>
                                        <td>
                                            <div class="sel_wrap">
                                            <p class="mail_at">${member.user_id}</p>
                                                <input type="hidden" id="id" name="id" value="${member.id}"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일 확인</th>
                                        <td>
                                            <div class="sel_wrap">
                                            <p class="mail_at">${member.user_email}</p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">이메일 주소 (중복 확인)<img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="mail_input" id="email1" name="email1" />
                                                <p class="mail_at">@</p>
                                                <input type="text" id="email2" name="email2" class="mail_input" />
                                                <p class="mail_sel_wrap">
                                                    <label for="mail">직접입력</label> <select id="mail" name="mail">
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
                                                <button type="button" id="email-unique-check" class="unique-check">이메일 중복 확인</button>
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
    <script type="text/javascript">
    $(function() {

        //이메일 뒷자리 선택
        $(document).on("change", '[name="mail"]', function() {
            $(this).parent().prev().val($(this).val());
        });
        

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#myinfo_modify").validate({
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
	            // [이메일] 필수 + 이메일 형식 일치 필요
	            email: {
	                required: true, email: true, maxlength: 255,
	                remote : {
	                    url : ROOT_URL + '/rest/account/email_unique_check_jquery',
	                    type : 'post',
	                    data : {
	                        email : function() {
	                            return $("#email").val();
	                        }
	                    }
	                }
	            },
                email1: { required: true, alphanumeric: true },
                email2: "required"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
	            email: {
	                required: '이메일을 입력하세요.',
	                email: '이메일 형식이 잘못되었습니다.',
	                maxlength: '이메일은 최대 {0}글자까지 가능합니다.',
	                remote: '이미 사용중인 이메일 입니다.'
	            },
                email1: {
                    required: "이메일을 입력하세요.",
                    alphanumeric: "이메일 형식이 잘못되었습니다."
                },
                email2: "이메일을 입력하세요."
            },
        }); //validate
        
        $('#myinfo_modify').ajaxForm({
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
						alert("이메일 수정이 완료되었습니다. 마이페이지로 돌아갑니다.");
			            window.location = ROOT_URL + '/mypage';
					} else {
						alert("작성폼을 다시 한번 확인하세요.");
						return false;
					}
				}
		});// end ajax
    	
    	
        $("#email-unique-check").click(function(e) {
        	var email = $("#email1").val() + "@" + $("#email2").val();
            if (!$("#email1").val() || !$("#email2").val()) {
            	alert('이메일을 입력하세요.');
            	
                return false;
            }

            $.post(ROOT_URL + '/rest/account/email_unique_check', {
                user_email: email
            }, function(json) {
            	if (json.rt == "OK") {
            		alert('사용가능한 이메일 입니다.');	}
            });
        }); //email-unique-check
        
        
    });
    </script>
</body>

</html>