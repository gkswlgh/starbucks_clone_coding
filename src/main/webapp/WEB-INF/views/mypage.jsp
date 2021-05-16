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
                <div class="user_index" style="height:40px;">
                    <h5 class="c222">
                        <span class="mem">${member.user_name}</span>
                        님 안녕하세요.
                    </h5>
                    <div class="user_stat_btns" style="margin-top:-40px;">
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
                <div class="user_index" style="margin-top:-55px;">
                    <span style="color:#666;">
                        <strong style="color:#bb9f65;">My 메뉴</strong>
                        에서 
                        <strong style="color:#bb9f65;">내가 자주 이용한 음료 순위</strong>
                        와 
                        <strong style="color:#bb9f65;">좋아하는 음료로 등록한 메뉴</strong>
                        들을 찾아보세요!
                    </span>
                    <div class="user_stat_btns" style="margin-top:-35px;">
                        <ul>
                            <li class="btn_gray" style="background:#bb9f65;border:1px solid #bb9f65;"><a href="${pageContext.request.contextPath}/my/my_menu">
                                    My메뉴 바로가기
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
                                        <input type="text" class="my_nick_modify_input" data-card-id="${item.card_id}" value="${item.card_name}">
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
                                            <a href="${pageContext.request.contextPath}/my/mycard_charge?param_card_id=${item.card_id}" class="btn_go_charge" data-card-id="${item.card_id}" >충전 하기</a>
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
                    <form action="${pageContext.request.contextPath}/mypage" method="get" name="edwForm">
                        <fieldset>
                            <legend>스타벅스 메뉴 순위 폼</legend>
                            <header class="my_ms_rank_head">
                                <p>스타벅스 코리아를 사랑하는</p>
                                <div class="my_ms_select">
                                    <label for="my_ms_select" class="a11y">성별</label>
                                    <select id="my_ms_select" name="gender" class="rank_select">
                                        <option value="M" <c:if test="${gender == 'M'}">selected</c:if> >남성</option>
                                        <option value="F" <c:if test="${gender == 'F'}">selected</c:if> >여성</option>
                                    </select>
                                </div>
                                <p>이 즐기는 메뉴가 궁금하시죠?</p>
                                <button type="submit" title="메뉴 확인하기" class="my_ms_setBtn" style="cursor:pointer;">확인</button>
                            </header>
                            <span class="criteria">
                                스타벅스 딜리버리
                                <br>
                                전체 회원 대상 판매 집계 기준
                            </span>
                            <article class="my_ms_rank_wrap">
              <!-- list 리스트 (menu_class 0~8까지) 반복문 -->
                <c:choose>
		        <c:when test="${list != null && fn:length(list) > 0}">
		        <c:forEach var="listItem" items="${list}" varStatus="status">
                                <div class="my_ms_rank_each my_ms_rank_each3">
                                    <div class="bx-wrapper">
                                        <div class="bx-viewport">
                                            <ul class="edw1">
                                                <li>
                                                    <header>
                                                        부문별 음료 판매 순위
                                                        <br>
                                                        <strong>
                                                        <!-- 조건문 -->
														<c:choose>
														    <c:when test="${status.index == 0}">콜드 브루 커피</c:when>
														    <c:when test="${status.index == 1}">브루드 커피</c:when>
														    <c:when test="${status.index == 2}">에스프레소</c:when>
														    <c:when test="${status.index == 3}">프라푸치노</c:when>
														    <c:when test="${status.index == 4}">블렌디드</c:when>
														    <c:when test="${status.index == 5}">스타벅스 피지오</c:when>
														    <c:when test="${status.index == 6}">티(티바나)</c:when>
														    <c:when test="${status.index == 7}">기타 제조 음료</c:when>
														    <c:when test="${status.index == 8}">스타벅스 주스(병음료)</c:when>
						                                </c:choose>
                                                        <!-- 조건문 끝-->
                                                        </strong>
                                                    </header>
                                                    
                            	<!-- list 리스트 안에서 각 menu정보 든 객체 list2 반복문 -->
	                                <c:choose>
							        <c:when test="${listItem != null && fn:length(listItem) > 0}">
							        <c:forEach var="item" items="${listItem}" varStatus="status">
										        
										        	<!-- 조건문 -->
										        	<c:choose>
													<c:when test="${status.index == 0}">
                                                    <figure>
                                                        <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="goDrink">
                                                            <img src="${item.list_img}">
                                                        </a>
                                                    </figure>
                                                    <p class="first_bev">1위</p>
                                                    <p class="coffee_name">
                                                        <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="goDrink">${item.name}</a>
                                                    </p>
                                                	</c:when>
                                                	<c:when test="${status.index == 1}">
                                                    <p class="second_rank ">
                                                        <span class="left">
                                                            <strong>2위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="goDrink">${item.name}</a>
                                                        </span>
                                                    </p>
                                                    </c:when>
                                                    <c:when test="${status.index == 2}">
                                                    <p class="third_rank ">
                                                        <span class="left">
                                                            <strong>3위</strong>
                                                        </span>
                                                        <span class="right">
                                                            <a href="${pageContext.request.contextPath}/product/menu_detail/${item.menu_id}" class="goDrink">${item.name}</a>
                                                        </span>
                                                    </p>
                                                    </c:when>
                                                  </c:choose>
                                                  <!-- 조건문 끝 -->
                                                    
	                                  </c:forEach>
	                                  </c:when>
	                                  </c:choose>
                            		<!-- list 리스트 안에서 각 menu정보 든 객체 list2 반복문 끝 -->
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                     </c:forEach>
                     </c:when>
                     </c:choose>
              <!-- list 리스트 (menu_class 0~8까지) 반복문 끝 -->
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