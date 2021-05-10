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
                <form method="post" action="${pageContext.request.contextPath}/rest/account/myinfo_modify" id="myinfo_modify" name="myinfo_modify" class="join_input_frm">
                    <fieldset>
                        <legend>개인정보 확인 및 수정 입력 폼</legend>
                        <!-- 테이블 -->
                        <div class="voc_input_tbl">
                            <!-- 인삿말 -->
                            <div class="">
                                <strong> 개인정보 확인 및 수정 </strong>
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
                                        <th scope="row">이름 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력"/></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="voc_ttl_input1 w160" id="user_name" name="user_name" value="${member.user_name}"/>
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
                                                        <option value="F" <c:if test="${member.gender == 'F'}">selected</c:if>>여자</option>
                                                        <option value="M" <c:if test="${member.gender == 'M'}">selected</c:if>>남자</option>
                                                    </select>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">휴대전화 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <p class="phone_sel_wrap">
                                                    <label for="phone1">010</label> <select id="phone1" name="phone1">
													<option value="010"
														<c:if test="${fn:substringBefore(member.phone, ')') == '010'}">selected</c:if>>010</option>
													<option value="011"
														<c:if test="${fn:substringBefore(member.phone, ')') == '011'}">selected</c:if>>011</option>
													<option value="016"
														<c:if test="${fn:substringBefore(member.phone, ')') == '016'}">selected</c:if>>016</option>
													<option value="017"
														<c:if test="${fn:substringBefore(member.phone, ')') == '017'}">selected</c:if>>017</option>
													<option value="018"
														<c:if test="${fn:substringBefore(member.phone, ')') == '018'}">selected</c:if>>018</option>
													<option value="109"
														<c:if test="${fn:substringBefore(member.phone, ')') == '019'}">selected</c:if>>019</option>
												</select>
                                                </p>
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="phone2" name="phone2" maxlength="4" ref="num"
                                                value="${fn:substringBefore(fn:substringAfter(member.phone, ')'), '-')}" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="phone3" name="phone3" maxlength="4" ref="num" 
                                                value="${fn:substringAfter(member.phone, '-')}" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">생일 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap mt10">
                                                <input type="date" name="birthdate" id="birthdate" class="birthdate" value="${member.birthdate}" />
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
                    <input type="hidden" name="phone" id="phone"/>
                    </fieldset>
                </form>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {

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
                // [아이디] 필수 + 알파벳,숫자 조합만 허용
	            id: {
	                required: true
	            },
	            // [이름] 필수
	            user_name: { required: true, kor: true, minlength: 2, maxlength: 30 },
	            // [연락처] 필수
                phone1: "required",
                phone2: { required: true, number: true },
                phone3: { required: true, number: true },
                birthdate: { required: true, date: true },
                gender: "required"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                id: {
	                required: '회원 일련번호 누락.'
	            },
	            user_name: {
	                required: '이름을 입력하세요.',
	                kor: '이름은 한글만 입력 가능합니다.',
	                minlength: '이름은 최소 {0}글자 이상 입력하셔야 합니다.',
	                maxlength: '이름은 최대 {0}글자까지 가능합니다.',
	            },
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
                gender: "성별을 선택해 주세요."
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
						alert("회원 정보 수정이 완료되었습니다. 확인 버튼을 누르면 메인페이지로 이동합니다.");
			            window.location = ROOT_URL + '/';
					} else {
						alert("작성 폼을 다시 한번 확인하세요.");
						return false;
					}
				}
		});// end ajax
        
    });
    </script>
</body>

</html>