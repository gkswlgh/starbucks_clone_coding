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
                        <img src="//image.istarbucks.co.kr/common/img/util/inmycard_ttl.png" alt="보유 카드" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my_starbucks"><span class="en">MyStarbucks</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/starbucks_card/about_card"><span class="en">My 스타벅스 카드</span></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/my/mycard_list"><span class="en">보유 카드</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <!-- 보유카드 목록 -->
                <section class="my_ms_card_detail">
                    <div class="my_ms_card_detail_inner">
                        <header>
                            <h5><strong class="userNameList">${member.user_name}</strong>님의 스타벅스 카드 상세정보</h5>
                        </header>
                        <div class="my_ms_card_detail_cont">
                            <div class="my_ms_card_detail_info">
                                <p class="my_ms_card_detail_id">
                                    <span>${output.card_name}</span>
                                    <a class="icon_pencil pencil" data-cardnickname="${output.card_name}">정보수정</a>
                                </p>
                                <p class="my_ms_card_detail_id_modify">
                                    <input type="text" id name class="my_nick_modify_input" value="${output.card_name}" data-card-id="${output.card_id}">
                                    <a class="my_nick_modify" data-card-id="${output.card_id}">수정</a>
                                    <a class="my_nick_cancel">취소</a>
                                </p>
                                <p class="my_ms_card_num en">●●●● - ●●●● - ●●●● - 1547</p>
                                <p class="my_ms_card_detail_date">
                                    최종 사용일 :
                                    <span class="en">${output.edit_date}</span>
                                    <br>
                                    카드 등록일 :
                                    <span class="en">${output.reg_date}</span>
                                </p>
                                <p class="my_ms_card_detail_price">
                                    잔액
                                    <strong class="en t_0d5f34"> ${output.cash}</strong>
                                    원
                                </p>
                                <div class="my_ms_card_btns_top">
                                    <p class="my_ms_card_btn1">
                                        <a href="${pageContext.request.contextPath}/my/mycard_charge" class="btn_go_charge" data-card-id="${output.card_id}">충전하기</a>
                                    </p>
                                    <p class="my_ms_card_btn2 regi_cancel">
                                        <a id="deleteCard" class="btn_cancel_reg btn_cancel_pop" data-card-id="${output.card_id}" data-cardnickname="${output.card_name}">카드등록해지</a>
                                    </p>
                                </div>
                            </div>
                            <figure>
                                <p><img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt="e-gift 카드"></p>
                            </figure>
                        </div>
                    </div>
                </section>
                <!-- 보유카드 목록 끝 -->
                <div class="egiftCard_btnZone clear mt20">
                    <p class="btn_list">
                        <a href="${pageContext.request.contextPath}/my/mycard_list">목록</a>
                    </p>
                </div>
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {

    	//연필버튼
        $(document).on("click", ".icon_pencil", changeModifyMode);
    	//수정버튼
        $(document).on("click", ".my_nick_modify", modifyNickname);
    	//취소버튼
        $(document).on("click", ".my_nick_cancel", cancelModifyMode);
      	//삭제버튼
        $(document).on("click", "#deleteCard", deleteCard);

        function deleteCard() {
			var card_name = $(this).data("cardnickname");
			var card_id = $(this).data("card-id");
            
            if (!confirm("정말 ["+card_name+"] (을)를 삭제하시겠습니까?")) {
                return;
            }
			
			$.post(ROOT_URL + '/my/rest/del_card', {
            	card_id: card_id
            }, function(json) {
            	if (json.rt == "OK") {
                    alert("카드가 삭제되었습니다.");
            		window.location = ROOT_URL + "/my/mycard_list";
            	}
            });
        }


        function changeModifyMode() {
            var nIdx = $(".icon_pencil").index(this);
            var cardNickname = $(".my_ms_card_detail_id span").eq(nIdx).text();


            $(".my_ms_card_detail_id").eq(nIdx).hide();
            $(".my_nick_modify_input").eq(nIdx).val(cardNickname);
            $(".my_ms_card_detail_id_modify").eq(nIdx).show();
        }

        function modifyNickname() {
            var nIdx = $(".my_nick_modify").index(this);
            var strCardNickname = $(".my_nick_modify_input").eq(nIdx).val();
            var card_id = $(".my_nick_modify_input").eq(nIdx).data("card-id");

            if (strCardNickname == "") {
                alert("카드 닉네임을 입력하세요.");
                $(".my_nick_modify_input").eq(nIdx).focus();
                return;
            }

            //ajax로 이름 수정 후 페이지 새로고침
            $.post(ROOT_URL + '/my/rest/editcard_name', {
            	card_name: strCardNickname,
            	card_id: card_id
            }, function(json) {
            	if (json.rt == "OK") {
                    alert("카드 닉네임이 변경 되었습니다.");
            		location.reload();
            	}
            });
        }

        function cancelModifyMode(_nIdx) {
            if (typeof(_nIdx) != 'number') {
                _nIdx = $(".my_nick_cancel").index(this);
            }

            $(".my_ms_card_detail_id").eq(_nIdx).show();
            $(".my_ms_card_detail_id_modify").eq(_nIdx).hide();
        }

    })
    </script>
</body>

</html>