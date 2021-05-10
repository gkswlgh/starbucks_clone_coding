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
                        <img src="${pageContext.request.contextPath}/assets/img/util/ms_ttl.png" alt="My Starbucks" />
                    </h4>
                    <ul class="smap">
                        <li><a href="${pageContext.request.contextPath}/"><img src="//image.istarbucks.co.kr/common/img/common/icon_home_w.png" alt="홈으로" /></a></li>
                        <li><img src="//image.istarbucks.co.kr/common/img/common/icon_arrow_w.png" class="arrow" alt="하위메뉴" /></li>
                        <li><a href="${pageContext.request.contextPath}/mypage"><span class="en">My Starbucks</span></a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- 서브타이틀 끝 -->
        <!-- 내용 -->
        <div class="cont">
            <div class="cont_inner">
                <div class="user_index">
                    <h5 class="c222">
                        <span class="mem">${member.user_name}</span>
                        님 안녕하세요.
                    </h5>
                    <div class="user_stat_btns">
                        <ul>
                            <li class="btn_black"><a href="${pageContext.request.contextPath}/account/myinfo_modify">
                                    개인정보 수정
                                </a></li>
                            <li class="btn_gray"><a href="${pageContext.request.contextPath}/account/myinfo_change_pw">
                                    비밀번호 변경
                                </a></li>
                        </ul>
                    </div>
                </div>
                <!-- 보유카드 목록 -->
                <section class="my_ms_card_detail my_ms_card">
                    <div class="my_ms_card_detail_inner my_ms_card_inner">
                        <header>
                            <h5><span class="en">My</span> 스타벅스 카드</h5>
                            <p class="recent_card">총 보유카드 : ${cardCount}장</p>
                    <c:choose>
				        <c:when test="${output != null && fn:length(output) > 0}">
                         <a href="${pageContext.request.contextPath}/my/mycard_list" class="btn_go_charge c063" style="float:right;font-weight:bold;" data-cardnickname="${item.card_name}" data-card-id="${item.card_id}" >전체 카드 목록 보러가기 ▶ </a>
				        </c:when>
                    </c:choose>
                        </header>
                    <c:choose>
				        <c:when test="${output != null && fn:length(output) > 0}">
                        <div class="my_card_slick">
				        	<c:forEach var="item" items="${output}" varStatus="status">
                            <div class="my_ms_card_detail_cont slide">
                                <div class="my_ms_card_detail_info">
                                    <p class="my_ms_card_detail_id">
                                        <span>${item.card_name}</span>
                                        <a class="icon_pencil pencil" data-cardnickname="${item.card_name}">정보수정</a>
                                    </p>
                                    <p class="my_ms_card_detail_id_modify">
                                        <input type="text" id name class="my_nick_modify_input" data-card-id="${item.card_id}" value="${item.card_name}">
                                        <a class="my_nick_modify" data-card-id="${item.card_id}">수정</a>
                                        <a class="my_nick_cancel">취소</a>
                                    </p>
                                    <p class="my_ms_card_price">
                                        <span class="a11y">잔여금액</span>
                                        <strong class="en t_0d5f34"><fmt:formatNumber value="${item.cash}" pattern="#,###" /></strong>원
                                    </p>
                                    <div class="my_ms_card_btns_top">
                                        <p class="my_ms_card_btn1">
                                            <a href="${pageContext.request.contextPath}/my/mycard_view/${item.card_id}" class="btn_go_charge" data-cardnickname="${item.card_name}" data-card-id="${item.card_id}" >카드 관리</a>
                                        </p>
                                        <p class="my_ms_card_btn2">
                                            <a href="${pageContext.request.contextPath}/my/mycard_charge" class="btn_go_charge" data-card-id="${item.card_id}" >충전 하기</a>
                                        </p>
                                    </div>
                                </div>
                                <figure>
                                    <p><img src="https://image.istarbucks.co.kr/cardImg/20210203/007864.png" alt="e-gift 카드"></p>
                                </figure>
                            </div>
					            </c:forEach>
                        </div>
				        	</c:when>
					        <c:otherwise> 
					        <div style="margin:60px 40px 40px 40px;width:550px;font-size:16px;position:relative;line-height:25px;">
					        	등록된 카드가 없습니다.
					        	<br />선물 받은 카드가 있다면 <strong class="c063">카드 등록하기</strong>를,
					        	<br />없다면 <strong class="c063">나에게 선물하기</strong>를 통해 스타벅스 카드를 시작해보세요!
                    <div class="user_stat_btns" style="position: absolute; top:-10px; right:-130px;">
                        <ul>
                            <li class="btn_black"><a style="background-color:#063" href="${pageContext.request.contextPath}/my/mycard_info_input">
                                    카드 등록하기
                                </a></li>
                            <li class="btn_gray"><a style="background-color:#063"  href="${pageContext.request.contextPath}/my/gift_step1">
                                    카드 선물하기
                                </a></li>
                        </ul>
                    </div>
					        </div>
					        </c:otherwise>
					    </c:choose>
                    </div>
                </section>
                <!-- 보유카드 목록 끝 -->
                <!-- 인기랭킹 -->
                <section class="my_ms_rank">
                    <form action="" method="post" name="edwForm">
                        <fieldset>
                            <legend>스타벅스 메뉴 순위 폼</legend>
                            <header class="my_ms_rank_head">
                                <p>스타벅스 코리아를 사랑하는</p>
                                <div class="my_ms_select">
                                    <label for="my_ms_age" class="a11y">연령대</label>
                                    <select id="my_ms_age" class="rank_select">
                                        <option value="10">10대</option>
                                        <option value="20" selected="selected">20대</option>
                                        <option value="30">30대</option>
                                        <option value="40">40대</option>
                                        <option value="50">50대</option>
                                    </select>
                                </div>
                                <div class="my_ms_select">
                                    <label for="my_ms_select" class="a11y">성별</label>
                                    <select id="my_ms_select" class="rank_select">
                                        <option value="M">남성</option>
                                        <option value="F" selected="selected">여성</option>
                                    </select>
                                </div>
                                <p>이 즐기는 메뉴가 궁금하시죠?</p>
                                <a href="${pageContext.request.contextPath}/" role="button" title="메뉴 확인하기" class="my_ms_setBtn">확인</a>
                            </header>
                            <span class="criteria">
                                스타벅스
                                <br>
                                최근 일주일 판매 집계 기준
                            </span>
                            <article class="my_ms_rank_wrap">
                                <div class="my_ms_rank_each my_ms_rank_each1">
                                    <div class="bx-wrapper">
                                        <div class="bx-viewport">
                                            <ul class="edw1">
                                                <li>
                                                    <header>
                                                        부문별 음료 판매 순위
                                                        <br>
                                                        <strong>에스프레소</strong>
                                                    </header>
                                                    <figure>
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">
                                                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[110563]_20150813222100205.jpg" alt>
                                                        </a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 카페 아메리카노</a>
                                                    </p>
                                                    <p class="second_rank ">
                                                        <span class="left">
                                                            <strong>2위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 슈크림 라떼</a>
                                                        </span>
                                                    </p>
                                                    <p class="third_rank ">
                                                        <span class="left">
                                                            <strong>3위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">카페 아메리카노</a>
                                                        </span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="my_ms_rank_each my_ms_rank_each2">
                                    <div class="bx-wrapper">
                                        <div class="bx-viewport">
                                            <ul class="edw1">
                                                <li>
                                                    <header>
                                                        부문별 음료 판매 순위
                                                        <br>
                                                        <strong>에스프레소</strong>
                                                    </header>
                                                    <figure>
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">
                                                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[110563]_20150813222100205.jpg" alt>
                                                        </a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 카페 아메리카노</a>
                                                    </p>
                                                    <p class="second_rank ">
                                                        <span class="left">
                                                            <strong>2위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 슈크림 라떼</a>
                                                        </span>
                                                    </p>
                                                    <p class="third_rank ">
                                                        <span class="left">
                                                            <strong>3위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">카페 아메리카노</a>
                                                        </span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="my_ms_rank_each my_ms_rank_each3">
                                    <div class="bx-wrapper">
                                        <div class="bx-viewport">
                                            <ul class="edw1">
                                                <li>
                                                    <header>
                                                        부문별 음료 판매 순위
                                                        <br>
                                                        <strong>에스프레소</strong>
                                                    </header>
                                                    <figure>
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">
                                                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[110563]_20150813222100205.jpg" alt>
                                                        </a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 카페 아메리카노</a>
                                                    </p>
                                                    <p class="second_rank ">
                                                        <span class="left">
                                                            <strong>2위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 슈크림 라떼</a>
                                                        </span>
                                                    </p>
                                                    <p class="third_rank ">
                                                        <span class="left">
                                                            <strong>3위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">카페 아메리카노</a>
                                                        </span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="my_ms_rank_each my_ms_rank_each1">
                                    <div class="bx-wrapper">
                                        <div class="bx-viewport">
                                            <ul class="edw1">
                                                <li>
                                                    <header>
                                                        부문별 음료 판매 순위
                                                        <br>
                                                        <strong>에스프레소</strong>
                                                    </header>
                                                    <figure>
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">
                                                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[110563]_20150813222100205.jpg" alt>
                                                        </a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 카페 아메리카노</a>
                                                    </p>
                                                    <p class="second_rank ">
                                                        <span class="left">
                                                            <strong>2위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 슈크림 라떼</a>
                                                        </span>
                                                    </p>
                                                    <p class="third_rank ">
                                                        <span class="left">
                                                            <strong>3위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">카페 아메리카노</a>
                                                        </span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="my_ms_rank_each my_ms_rank_each2">
                                    <div class="bx-wrapper">
                                        <div class="bx-viewport">
                                            <ul class="edw1">
                                                <li>
                                                    <header>
                                                        부문별 음료 판매 순위
                                                        <br>
                                                        <strong>에스프레소</strong>
                                                    </header>
                                                    <figure>
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">
                                                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[110563]_20150813222100205.jpg" alt>
                                                        </a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 카페 아메리카노</a>
                                                    </p>
                                                    <p class="second_rank ">
                                                        <span class="left">
                                                            <strong>2위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 슈크림 라떼</a>
                                                        </span>
                                                    </p>
                                                    <p class="third_rank ">
                                                        <span class="left">
                                                            <strong>3위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">카페 아메리카노</a>
                                                        </span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="my_ms_rank_each my_ms_rank_each3">
                                    <div class="bx-wrapper">
                                        <div class="bx-viewport">
                                            <ul class="edw1">
                                                <li>
                                                    <header>
                                                        부문별 음료 판매 순위
                                                        <br>
                                                        <strong>에스프레소</strong>
                                                    </header>
                                                    <figure>
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">
                                                            <img src="https://image.istarbucks.co.kr/upload/store/skuimg/2015/08/[110563]_20150813222100205.jpg" alt>
                                                        </a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 카페 아메리카노</a>
                                                    </p>
                                                    <p class="second_rank ">
                                                        <span class="left">
                                                            <strong>2위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">아이스 슈크림 라떼</a>
                                                        </span>
                                                    </p>
                                                    <p class="third_rank ">
                                                        <span class="left">
                                                            <strong>3위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/" class="goDrink">카페 아메리카노</a>
                                                        </span>
                                                    </p>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </fieldset>
                    </form>
                </section>
                <!-- 인기랭킹 끝 -->
            </div>
        </div>
        <!-- 내용 끝 -->
    </div>
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {


        $(document).on("click", ".icon_pencil", changeModifyMode);
        $(document).on("click", ".my_nick_modify", modifyNickname);
        $(document).on("click", ".my_nick_cancel", cancelModifyMode);


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

            //ajax로 이름 수정 후 마이페이지 새로고침
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

        /*카드 슬라이더 my_ms_card_detail_cont*/
        $('.my_card_slick').slick({
            slidesToShow: 1,
            infinite: true,
            slidesToScroll: 1,
            dots: true
        });

        /*일주일 집계 슬라이드 my_ms_rank_each */
        $('.my_ms_rank_wrap').slick({
            slidesToShow: 3,
            infinite: true,
            slidesToScroll: 3
        });

        /*슬라이드 화살표*/
        $(".slick-prev").hover(
            function() {
                $(".slick-prev").css({
                    background: 'url(${pageContext.request.contextPath}/assets/img/contents/arrow_left_on.png) center no-repeat'
                });
            },
            function() {
                $(".slick-prev").css({
                    background: 'url(${pageContext.request.contextPath}/assets/img/contents/arrow_left_on.png) center no-repeat'
                });
            }
        );

        $(".slick-next").hover(
            function() {
                $(".slick-next").css({
                    background: 'url(${pageContext.request.contextPath}/assets/img/contents/arrow_right_on.png) center no-repeat'
                });
            },
            function() {
                $(".slick-next").css({
                    background: 'url(${pageContext.request.contextPath}/assets/img/contents/arrow_right_on.png) center no-repeat'
                });
            }
        );
    })
    </script>
</body>

</html>