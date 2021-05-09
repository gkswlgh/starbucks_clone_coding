<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/head.jsp"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <!-- 내용 시작 -->
    <div id="contents">
        <!-- 플로팅 배너 시작 -->
        <div class="f_banner">
            <div class="xmas">
                <a href="${pageContext.request.contextPath}/" title="자세히 보기"> <img src="${pageContext.request.contextPath}/assets/img/contents/ssg_pop.png" alt="11월 25일 스타벅스 온라인 샵 런칭!" />
                </a>
            </div>
            <div class="plcc">
                <a href="${pageContext.request.contextPath}/" title="자세히 보기"> <img src="${pageContext.request.contextPath}/assets/img/contents/plcc_badge.png" alt="스타벅스 현대카드" />
                </a>
            </div>
        </div>
        <!-- 플로팅 배너 끝 -->
        <!-- 메인비주얼 시작 -->
        <div class="main_visual">
            <div class="main_visual_inner">
                <div class="main_visual_slogan">
                    <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/2021_cherryblossom_slogan.png" alt="FIND YOUR BLOOMING moments" />
                </div>
                <div class="main_visual_set">
                    <div class="set_common set_01">
                        <a href="${pageContext.request.contextPath}/product/menu_detail/100"></a> <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/2021_cherryblossom_chocolate.png" alt="체리블라썸 화이트 초콜릿" />
                    </div>
                    <div class="set_common set_02">
                        <a href="${pageContext.request.contextPath}/product/menu_detail/2"></a> <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/2021_cherryblossom_coldbrew.png" alt="미드나잇 베르가못 콜드 브루" />
                    </div>
                    <div class="set_common set_03">
                        <a href="${pageContext.request.contextPath}/product/menu_detail/56"></a> <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/2021_cherryblossom_blended.png" alt="딸기 딜라이트 요거트 블렌디드" />
                    </div>
                </div>
            </div>
        </div>
        <!-- 메인비주얼 끝 -->
        <!-- line notice 시작 -->
        <div class="line_notice">
            <div class="line_notice_left"></div>
            <div class="line_notice_right"></div>
            <div class="line_notice_bg">
                <div class="line_notice_bgl">
                    <div class="line_notice_bgl_inner">
                        <dl class="bgl_inner_l">
                            <dt class="notice_ttl">공지사항</dt>
                            <dd>
                                <ul class="news_result">
                                    <li>시스템 개선 및 점검 안내</li>
                                    <li>본인인증 시스템 작업 안내</li>
                                    <li>제휴사 서비스 점검으로 인한 My DT Pass - 소유주 인증 진행
                                            불가</li>
                                    <li>SSG PAY 시스템 점검 안내</li>
                                    <li>삼성카드 시스템 점검에 따른 결제 일시 중단 안내</li>
                                </ul>
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="line_notice_bgr">
                    <a href="${pageContext.request.contextPath}/"> <span class="prom_ttl">스타벅스 프로모션</span> <span class="prom_btn"><span id="prom_btn_toggle" class="open" alt="스타벅스 프로모션 펼쳐보기" role="button"></span></span>
                    </a>
                </div>
            </div>
        </div>
        <!-- line notice 끝 -->
        <!-- 프로모션 배너 시작 (덜만듬) -->
        <div class="prom_banner">
            <div class="prom_banner_inner">
                <div class="prom_slider">
                    <div class="prom_slider_inner">
                        <ul class="prom_slider_list">
                            <li class="prom_slide"><img src="${pageContext.request.contextPath}/assets/img/contents/blossom/2VZXBB_20210317110628900.jpg" alt="체리블라썸 프로모션" />
                                
                            </li>
                            <li class="prom_slide"><img src="${pageContext.request.contextPath}/assets/img/contents/banner/ymrqGG_20201201000945683.jpg" alt="스타벅스 현대카드, 5만원 이상 사용 시 별 100개 적립" />
                                
                            </li>
                            <li class="prom_slide"><img src="${pageContext.request.contextPath}/assets/img/contents/blossom/NFg2GI_20210222160854814.jpg" alt="스프링 리저브 원두" />
                                
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 프로모션 배너 끝 -->
        
        <!-- 스타벅스리워드 시작 -->
   		<%-- JSTL을 통해 세션에 직접 접근하기 --%>	
        <c:choose>
            <c:when test="${member == null}">
                <section class="s_rewards">
	            <div class="s_rewards_inner clear">
	                <div class="rewards_logo">
	                    <img src="${pageContext.request.contextPath}/assets/img/contents/rewards-logo.png" alt="Starbucks Rewards" />
	                </div>
	                <div class="rewards_conts">
	                    <div class="conts_info">
	                        <div class="conts_info_txt">
	                            <h2>
	                                집에서 주문 해보세요! <strong>스타벅스 딜리버리</strong>
	                            </h2>
	                            <p>
	                                <strong>스타벅스 회원이세요?</strong> 로그인을 통해 가까운 매장에서 주문해보세요.
	                            </p>
	                            <p>
	                                <strong>스타벅스 회원이 아니세요?</strong> 가입을 통해 스타벅스 딜리버리를 즐기세요.
	                            </p>
	                        </div>
	                        <div class="rewards_btn_group">
	                            <a href="${pageContext.request.contextPath}/account/join" class="rewards_btn_join">회원가입</a> <a href="${pageContext.request.contextPath}/account/login" class="rewards_btn_login">로그인</a>
	                        </div>
	                    </div>
	                    <div class="conts_gift">
	                        <div class="conts_gift_txt">
	                            <p>
	                                회원 가입 후, 스타벅스 e-Gift Card를 <strong>"나에게 선물하기"로 구매하시고,
	                                    편리하게 등록하세요!</strong>
	                            </p>
	                            <p>카드를 등록해서 보다 빠르게 주문하세요!</p>
	                        </div>
	                        <div class="btn_egift">
	                            <a href="${pageContext.request.contextPath}/my/gift_step1">e-Gift Card 선물하기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
	       </c:when>
	       <c:otherwise>
	           <section class="s_rewards">
	            <div class="s_rewards_inner clear">
	                <div class="rewards_logo">
	                    <img src="${pageContext.request.contextPath}/assets/img/contents/rewards-logo.png" alt="Starbucks Rewards" />
	                </div>
	                <div class="rewards_conts">
	                    <div class="conts_info">
	                        <div class="conts_info_txt">
	                            <h2>
	                                안녕하세요! <strong> ${member.user_name} </strong> 님.
	                            </h2>
	                            <p>
	                                <strong><a class="cfff" href="${pageContext.request.contextPath}/product/menu_list">메뉴 보러가기,</a></strong> 주문할 메뉴를 장바구니에 담아보세요!
	                            </p>
	                            <p>
	                                <strong><a class="cfff" href="${pageContext.request.contextPath}/my/cart_step1">주문하러 가기,</a></strong> 장바구니에 담긴 메뉴를 주문해보세요!
	                            </p>
	                        </div>
	                        <div class="rewards_btn_group">
	                            <a href="${pageContext.request.contextPath}/product/menu_list" class="rewards_btn_join">메뉴 보러가기</a> <a href="${pageContext.request.contextPath}/my/cart_step1" class="rewards_btn_login">장바구니</a>
	                        </div>
	                    </div>
	                    <div class="conts_gift">
	                        <div class="conts_gift_txt">
	                            <p>
	                                내 카드 잔고 확인은? <strong><a class="cfff" href="${pageContext.request.contextPath}/mypage">마이페이지 바로가기</a></strong>
	                            </p>
	                            <p>스타벅스 카드를 사용해서 번거로운 결제 절차를 생략하세요!</p>
	                        </div>
	                        <div class="btn_egift">
	                            <a href="${pageContext.request.contextPath}/mypage">마이페이지 바로가기</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </section>
	       </c:otherwise>
        </c:choose>
        
        
        <!-- 스타벅스리워드 끝 -->
        <!-- 메인 빈 시작 -->
        <section class="main_bean">
            <div class="main_bean_inner">
                <div class="bean_img_box">
                    <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/2021_cherryblossom_bean.png" alt="애니버서리 블렌드" />
                </div>
                <div class="bean_txt_box">
                    <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/2021_cherryblossom_bean_txt.png" alt="스타벅스의 50년이 담긴 애니버서리 블렌드. 스타벅스의 50주년을 기념하여 블렌딩된 깊고 진한 풍미의 애니버서리 블렌드입니다." />
                    <div class="bean_detail_btn">
                        <a href="${pageContext.request.contextPath}/">가까운 매장 찾기</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- 메인 빈 끝 -->
        <!-- 리저브 시작 -->
        <section class="reserve">
            <div class="reserve_inner clear">
                <div class="reserve_ttl">
                    <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/reserve_costarica_title.png" alt="costa rica" />
                </div>
                <div class="reserve_visual">
                    <img src="${pageContext.request.contextPath}/assets/img/contents/blossom/reserve_costarica_bean_0217.png" />
                </div>
                <div class="reserve_detail_btn">
                    <a href="${pageContext.request.contextPath}/">가까운 매장 찾기</a>
                </div>
            </div>
        </section>
        <!-- 리저브 끝 -->
        <!-- 메뉴 랩 시작 -->
        <section class="menu_wrap">
            <div class="menu_wrap_inner">
                <div class="menu_wrap_txt01">PICK YOUR FAVORITE</div>
                <div class="menu_wrap_txt02">다양한 메뉴를 스타벅스에서 즐겨보세요. 스타벅스만의 특별함을
                    경험할 수 있는 최상의 선택 음료, 스타벅스 커피와 완벽한 어울림을 자랑하는 푸드, 다양한 시도와 디자인으로 가치를
                    더하는 상품, 소중한 사람에게 마음을 전하는 가장 좋은 방법 스타벅스 카드</div>
                <div class="menu_wrap_img"></div>
                <div class="menu_wrap_btn">
                    <a href="${pageContext.request.contextPath}/product/menu_list">메뉴 보러가기</a>
                </div>
            </div>
        </section>
        <!-- 메뉴 랩 끝 -->
        
        <!-- 매장 랩 시작 -->
        <section class="store_wrap">
            <div class="store_wrap_inner">
                <div class="store_exp_img01"></div>
                <div class="store_exp_img02"></div>
                <div class="store_exp_img03"></div>
                <div class="store_exp_img04"></div>
                <div class="store_txt01">스타벅스를 가까이에서 경험해보세요. 고객님과 가장 가까이 있는
                    매장을 찾아보세요!</div>
                <div class="store_txt02">차별화된 커피 경험을 누릴 수 있는 리저브 매장, 다양한 방법으로
                    편리하게 즐길 수 있는 드라이브 스루 매장, 함께해서 더 따뜻할수 있는 지역사회 소통 공간 커뮤니티 매장</div>
                <div class="store_btn">
                    <a href="${pageContext.request.contextPath}/">매장 찾기</a>
                </div>
            </div>
        </section>
        <!-- 매장 랩 끝 -->
    </div>
    <!-- 내용 끝 -->
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <script type="text/javascript">
    $(function() {

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