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
                <form autocomplete="off" id="join_mem" name="join_mem" class="join_input_frm" method="post" action="${pageContext.request.contextPath}/rest/account/join">
                    <fieldset>
                        <legend>회원가입 입력폼</legend>
                        <!-- 테이블 -->
                        <div class="voc_input_tbl">
                            <!-- 인삿말 -->
                            <div class="join_ttl">
                                <strong> 회원가입 </strong>
                            </div>
                            <!-- 인삿말 끝 -->
                            <p class="must_input">표시 항목은 필수 입력 사항입니다.</p>
                            <table summary="아이디, 비밀번호, 이름, 성별, 이메일 주소, 휴대전화, 생일">
                                <caption>아이디, 비밀번호, 이름, 성별, 이메일 주소, 휴대전화, 생일에 대한 테이블</caption>
                                <colgroup>
                                    <col width="180" />
                                    <col width="720" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">아이디 (중복 확인)<img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="voc_ttl_input1 w300" id="user_id" name="user_id" onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;" />
                                                <button type="button" id="id-unique-check" class="unique-check">아이디 중복 확인</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">비밀번호 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                            	<!-- 비번자동입력방지... -->
												<input type="password" id="temppwd" name="tempwd" style="display:none;">
                                                <input type="password" autocomplete="new-password"  class="voc_ttl_input1 w300" id="user_pw" name="user_pw" onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">비밀번호 확인 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="password" class="voc_ttl_input1 w300" id="user_pw_re" name="user_pw_re" onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;" />
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
                                    <tr>
                                        <th scope="row">휴대전화 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
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
                                        <th scope="row">생일 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap mt10">
                                                <input type="date" id="birthdate" class="birthdate" name="birthdate" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <div class="agree_checkbox clean">
                                                <input id="agree1" name="agree1" type="checkbox" /> <label for="agree1">개인 정보 수집 동의<a href="#none" title="개인정보 수집, 이용 동의 보러가기"><span class="cf66">(필수)</span></a></label>
                                                <input id="agree2" name="agree2" type="checkbox" /> <label for="agree2">이용 약관 동의<a href="#none" title="개인정보 수집, 이용 동의 보러가기"><span class="cf66">(필수)</span></a></label>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 테이블 끝 -->
                        <div class="voc_info_input_btn1">
                            <button type="submit">회원 가입하기</button>
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
        $("#join_mem").validate({
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
                // [아이디] 필수 + 알파벳,숫자 조합만 허용
	            user_id: {
	                required: true, alphanumeric: true, minlength: 4, maxlength: 30,
	                remote : {
	                    url : ROOT_URL + '/rest/account/id_unique_check_jquery',
	                    type : 'post',
	                    data : {
	                        user_id : function() {
	                            return $("#user_id").val();
	                        }
	                    }
	                }
	            },
	            // [비밀번호] 필수 + 글자수 길이 제한
	            user_pw: { required: true, minlength: 4, maxlength: 20 },
	            // [비밀번호 확인] 필수 + 특정 항목과 일치 (id로 연결)
	            user_pw_re: { required: true, equalTo: '#user_pw' },
	            // [이름] 필수
	            user_name: { required: true, kor: true, minlength: 2, maxlength: 30 },
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
	            // [연락처] 필수
	            phone: { required: true, phone: true, minlength: 9, maxlength: 11 },
                email1: { required: true, alphanumeric: true },
                email2: "required",
                phone1: "required",
                phone2: { required: true, number: true },
                phone3: { required: true, number: true },
                birthdate: { required: true, date: true },
                gender: "required",
                agree1: "required",
                agree2: "required"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                user_id: {
	                required: '아이디를 입력하세요.',
	                alphanumeric: '아이디는 영어,숫자만 입력 가능합니다.',
	                minlength: '아이디는 최소 {0}글자 이상 입력하셔야 합니다.',
	                maxlength: '아이디는 최대 {0}글자까지 가능합니다.',
	                remote: '이미 사용중인 아이디 입니다.'
	            },
	            user_pw: {
	                required: '비밀번호를 입력하세요.',
	                minlength: '비밀번호는 최소 {0}글자 이상 입력하셔야 합니다.',
	                maxlength: '비밀번호는 최대 {0}글자까지 가능합니다.',
	            },
	            user_pw_re: {
	                required: '비밀번호 확인값을 입력하세요.',
	                equalTo: '비밀번호 확인이 잘못되었습니다.',
	            },
	            user_name: {
	                required: '이름을 입력하세요.',
	                kor: '이름은 한글만 입력 가능합니다.',
	                minlength: '이름은 최소 {0}글자 이상 입력하셔야 합니다.',
	                maxlength: '이름은 최대 {0}글자까지 가능합니다.',
	            },
	            email: {
	                required: '이메일을 입력하세요.',
	                email: '이메일 형식이 잘못되었습니다.',
	                maxlength: '이메일은 최대 {0}글자까지 가능합니다.',
	                remote: '이미 사용중인 이메일 입니다.'
	            },
	            phone: {
	                required: '연락처를 입력하세요.',
	                phone: '연락처 형식이 잘못되었습니다.',
	                minlength: '연락처는 최소 {0}글자 이상 입력하셔야 합니다.',
	                maxlength: '연락처는 최대 {0}글자까지 가능합니다.',
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
                gender: "성별을 선택해 주세요.",
                agree1: "필수 동의 사항에 체크해 주세요.",
                agree2: "필수 동의 사항에 체크해 주세요."
            },
        }); //validate
        
        $('#join_mem').ajaxForm({
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
						alert("회원가입이 완료되었습니다. 로그인 해 주세요.");
			            window.location = ROOT_URL + '/account/login';
					} else {
						alert("작성폼을 다시 한번 확인하세요.");
						return false;
					}
				}
		});// end ajax
        
        $("#id-unique-check").click(function(e) {
            const userId = $("#user_id").val();

            if (!userId) {
                alert('아이디를 입력하세요.');
                $("#user_id").focus();
                return false;
            }

            $.post(ROOT_URL + '/rest/account/id_unique_check', {
                user_id: userId
            }, function(json) {
            	if (json.rt == "OK") {
            		alert('사용가능한 아이디 입니다.');	
            	}
            	
            });
        }); //id-unique-check

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
        
    }); //$(function()
    </script>
</body>

</html>