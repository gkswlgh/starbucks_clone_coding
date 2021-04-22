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
                        <img src="//image.istarbucks.co.kr/common/img/util/reward/ms_suggestion_ttl.png" alt="고객의 소리" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/voc"><span class="en">고객의 소리</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont w1100">
            <div class="cont_inner">
                <form action="${pageContext.request.contextPath}/rest/voc" id="vocVO" name="vocForm" class="voc_input_frm" method="post">
                    <fieldset>
                        <legend>
                        고객의 소리 입력 폼</legend>
                        <!-- 인삿말 -->
                        <div class="voc_top_bg">
                            <div class="voc_top_txt">
                                <strong> 귀한 말씀 들려 주십시오. 작은 소리도 듣겠습니다. </strong> <br />
                                <p>
                                    스타벅스에서는 고객 여러분의 즐겁고 행복한 시간을 위해 정성을 다하고 있습니다. <br /> 만족스러운
                                    서비스였는지, 불만스러운 점은 없으셨는지 귀한 의견을 들려주시기 바랍니다. 보다 나은 서비스로 보답하겠습니다.
                                </p>
                                <span>고객의 소리 운영시간 : 월~ 일 09:00 ~ 18:00 (연중무휴)</span>
                            </div>
                            <a href="${pageContext.request.contextPath}/my/voclist/${member.id}" class="btn_ask_list">나의 문의 내역 보기</a>
                        </div>
                        <!-- 인삿말 끝 -->
                        <!-- 테이블 -->
                        <div class="voc_input_tbl">
		                		<c:choose>
		                        	<c:when test="${member == null}">
	                        			<div class="voc_ttl"><strong> 비회원 고객 문의 작성 폼 </strong></div>
		                        	</c:when>
		                        </c:choose>
                            <p class="must_input">표시 항목은 필수 입력 사항입니다.</p>
                            <table class=" w1000" summary="분야, 답변 받으실 메일, 연락처, 장소, 제목, 내용">
                                <caption>분야, 답변 받으실 메일, 연락처, 장소, 제목, 내용에 대한 테이블</caption>
                                <colgroup>
                                    <col width="200" />
                                    <col width="740" />
                                </colgroup>
                                <tbody>
			                		<c:choose>
			                        	<c:when test="${member != null}">
		                                    <tr>
		                                        <th scope="row">문의 회원</th>
		                                        <td>
		                                            <div class="sel_wrap">
		                                                <input type="text" class="voc_ttl_input1" value="${member.user_name}(${member.user_id})" disabled/>
		                                                <input type="hidden" id="id" name="id" value="${member.id}"/>
		                                            </div>
		                                        </td>
		                                    </tr>
			                        	</c:when>
			                        </c:choose>
                                    <tr>
                                        <th scope="row">분야 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" />
                                        </th>
                                        <td>
                                            <div class="sel_wrap">
                                                <p class="cate_sel_wrap">
                                                    <label for="TP_VOC_DEMAND">문의유형</label> <select name="TP_VOC_DEMAND" id="TP_VOC_DEMAND">
                                                        <option value>문의유형</option>
                                                        <option value="1">문의</option>
                                                        <option value="2">칭찬</option>
                                                        <option value="3">제안</option>
                                                        <option value="4">불만</option>
                                                    </select>
                                                </p>
                                                <p class="cate_sel_wrap">
                                                    <label for="CD_VOC_CAUSE">분류</label> <select name="CD_VOC_CAUSE" id="CD_VOC_CAUSE">
                                                        <option value>분류</option>
                                                        <option value="1">제품/상품</option>
                                                        <option value="2">스타벅스 카드</option>
                                                        <option value="3">결제정책/전자영수증</option>
                                                        <option value="4">사이렌오더/e-Gift Item</option>
                                                        <option value="5">스타벅스 딜리버스</option>
                                                        <option value="6">고객경험설문/마이스타벅스리뷰</option>
                                                        <option value="7">스토어케어/고객센터</option>
                                                    </select>
                                                </p>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">답변 받으실 메일 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="mail_input" id="email1" name="email1" value="${member.email1}"/>
                                                <p class="mail_at">@</p>
                                                <input type="text" class="mail_input" id="email2" name="email2" value="${member.email2}"/>
                                            
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
                                           </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">연락처</th>
                                        <td>
                                            <div class="sel_wrap">
                                                <p class="phone_sel_wrap">
                                                    <label for="phone1">010</label> <select id="phone1" name="phone1" value="${member.phone1}" formnovalidate>
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <option value="016">016</option>
                                                        <option value="017">017</option>
                                                        <option value="018">018</option>
                                                        <option value="109">019</option>
                                                    </select>
                                                </p>
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="phone2" name="phone2" value="${member.phone2}" maxlength="4" ref="num" />
                                                <p class="cell_hyphen">-</p>
                                                <input type="text" class="cellphone_input" id="phone3" name="phone3" value="${member.phone3}" maxlength="4" ref="num" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">장소 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="tbl_radio_wrap">
                                                <input id="VISIT1" name="visit" checked type="radio" value="Y" /> <label for="VISIT1">매장 방문</label>
                                                <input id="VISIT2" name="visit" type="radio" value="N" /> <label for="VISIT2">매장 방문
                                                    외</label>
                                            </div>
                                            <div class="sel_wrap mt10">
                                                <p class="visit_txt">방문매장</p>
                                                <input type="text" id="VISIT_STORE" name="visit_store" class="visit_input" placeholder="지점명을 적어주세요." />
                                            </div>
                                            <div class="sel_wrap mt10">
                                                <p class="visit_txt">방문일</p>
                                                <input type="date" id="VISIT_DATE" name="visit_date" class="visit_input" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">제목 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td>
                                            <div class="sel_wrap">
                                                <input type="text" class="voc_ttl_input1" id="DS_VOC_TITLE" name="voc_title"  onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">내용 <img src="//image.istarbucks.co.kr/common/img/common/bullet_star_red.gif" alt="필수입력" /></th>
                                        <td><textarea class="textArea" name="voc_txt" id="voc_txt" onpaste="fnPaste(); return false;" oncopy="fnCopy(); return false;"  placeholder="관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보 보안, 불충분한 증거/귀책 사유에 대한 개인 음해성/음란성 비방, 의도적인 업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지 않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 점 양지하여 주시기 바랍니다."></textarea>
                                            <br /> <span id="realByte">0 / 2500byte</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 테이블 끝 -->
                        <div class="voc_info_input_guide w1000">
                            <ul>
                                <li>본 고객의 소리는 e-mail을 통한 상담으로만 진행됩니다. 전화 상담 요청은 불가하오니 양해 부탁
                                    드립니다.</li>
                                <li>고객이 동의한 개인정보처리방침에 따라 고객의 소리 민원 처리를 위해 작성자의 개인정보를 활용할 수
                                    있습니다.</li>
                                <li>답변은 직접 기재하여 주신 메일주소로 발송되며, 기재 오류 및 계정문제가 발생한 경우에는 답변이
                                    불가할 수 있으므로 메일 주소를 꼭 확인해 주시기 바랍니다.</li>
                                <li>관계 법령에 저촉되거나 사회통념 등에 어긋나는 내용(예: 개인정보보안, 불충분한 증거/귀책 사유에
                                    대한 개인 음해성/음란성 비방, 의도적인 업무 방해 등) 또는 광고성 게시물은 별도의 사전 통보 없이 답변이 되지
                                    않을 수 있으며, 등록된 의견은 처리가 시작되면 수정이 불가하오니 이 점 양지하여 주시기 바랍니다.</li>
                                <li>공정거래위원회에서 고시한 소비자분쟁해결기준에 의거 소비자 피해에 대한 교환/환불 처리 해드립니다.</li>
                            </ul>
                        </div>
                        <div class="voc_info_input_btn1">
                            <button type="submit">고객의 소리 등록
                                하기</button>
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
        //텍스트검사
        $.validator.addMethod("voc_txt", function(value, element) {
            return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value) || /^[a-zA-Z0-9]*$/i.test(value);
        });

        /*form태그에 부여한 id속성에 대한 유효성 검사 함수 호출*/
        $("#vocVO").validate({
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
                TP_VOC_DEMAND: "required",
                CD_VOC_CAUSE: "required",
                email1: { required: true, alphanumeric: true },
                email2: "required",
                phone2: { number: true },
                phone3: { number: true },
                voc_title: { required: true },
                voc_txt: "required",
                visit: "required",
                visit_store: "voc_txt"
            },
            messages: {
                /*name속성 : {rules에 맞지 않을 경우 메시지}*/
                TP_VOC_DEMAND: "문의 유형을 선택하세요",
                CD_VOC_CAUSE: "문의 내용에 대한 분류를 선택하세요",
                email1: {
                    required: "이메일을 입력하세요.",
                    alphanumeric: "이메일 형식이 잘못되었습니다."
                },
                email2: "이메일을 입력하세요.",
                phone2: {
                    number: "연락처 형식이 잘못되었습니다."
                },
                phone3: {
                    number: "연락처 형식이 잘못되었습니다."
                },
                voc_title: {
                    required: "제목을 입력하세요."
                },
                voc_txt: "내용을 입력하세요.",
                visit: "매장 방문 여부를 선택하세요",
                visit_store: "지점명은 한글, 숫자, 영어만 입력 가능합니다."
            }
        });
        
        $('#vocVO').ajaxForm({
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
			            window.location = ROOT_URL + '/voc_ok';
					} else {
						alert("작성폼을 다시 한번 확인하세요.");
						return false;
					}
				}
		});// end ajax


        /*  장소 구분 선택   */
        $("input[name=visit]").click(function() {
            // 매장방문
            if ($(this).val() == "Y") {
                $(".mt10").show();
                // 매장방문 외
            } else if ($(this).val() == "N") {
                $("#VISIT_STORE").val("");
                $("#VISIT_DATE").val("");
                $(".mt10").hide();
            }
        });

        //내용 글자수제한
        //byte check;
        $('#voc_txt').keyup(function(event) {
            var maxByte = 2500; //최대 입력 바이트 수
            var str = $("#voc_txt").val();
            var str_len = str.length;

            var rbyte = 0;
            var rlen = 0;
            var one_char = "";
            var str2 = "";

            for (var i = 0; i < str_len; i++) {
                one_char = str.charAt(i);

                if (escape(one_char).length > 4) {
                    rbyte += 2; //한글2Byte
                } else {
                    rbyte++; //영문 등 나머지 1Byte
                }

                if (rbyte <= maxByte) {
                    rlen = i + 1; //return할 문자열 갯수
                }
            }

            $('#realByte').text(rbyte + ' / 2500byte');
            if (rbyte > maxByte) {
                alert("한글 " + (maxByte / 2) + "자 / 영문 " + maxByte + "자를 초과 입력할 수 없습니다.");
                str2 = str.substr(0, rlen); //문자열 자르기
                $('#realByte').text('2500 / 2500byte');
            }
        });

    });


    //복사 붙여넣기 방지 alert event
    function fnPaste() {
        alert('도배글 등을 방지하기 위해 복사/붙여넣기를 하실 수 없습니다.');
    }

    function fnCopy() {
        alert('도배글 등을 방지하기 위해 복사/붙여넣기를 하실 수 없습니다.');
    }
    </script>
</body>

</html>