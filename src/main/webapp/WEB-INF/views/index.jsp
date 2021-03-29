<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>

<head>
    <%@ include file="/WEB-INF/views/_inc/head.jsp"%>
</head>

<body>
    <%@ include file="/WEB-INF/views/_inc/top.jsp"%>
    <!-- 내용 시작 -->
    <div id="contents">
        <!-- 플로팅 배너 시작 -->
        <div class="f_banner">
            <div class="xmas">
                <a href="#" title="자세히 보기"> <img src="img/contents/ssg_pop.png" alt="11월 25일 스타벅스 온라인 샵 런칭!" />
                </a>
            </div>
            <div class="plcc">
                <a href="#" title="자세히 보기"> <img src="img/contents/plcc_badge.png" alt="스타벅스 현대카드" />
                </a>
            </div>
        </div>
        <!-- 플로팅 배너 끝 -->
        <!-- 메인비주얼 시작 -->
        <div class="main_visual">
            <div class="main_visual_inner">
                <div class="main_visual_slogan">
                    <img src="img/contents/xmas/2020_xmas2_slogan.png" alt="CARRY the MARRY" />
                </div>
                <div class="main_visual_set">
                    <div class="set_common set_01">
                        <a href="#"></a> <img src="img/contents/xmas/2020_xmas2_popconrn.png" alt="토피 넛 팝콘 트리 프라푸치노" />
                    </div>
                    <div class="set_common set_02">
                        <a href="#"></a> <img src="img/contents/xmas/2020_xmas2_dolce.png" alt="시나몬 롤 돌체 라떼" />
                    </div>
                    <div class="set_common set_03">
                        <a href="#"></a> <img src="img/contents/xmas/2020_xmas2_dark_blended.png" alt="다크 초콜릿 블렌디드" />
                    </div>
                    <div class="set_common set_04">
                        <a href="#"></a> <img src="img/contents/xmas/2020_xmas2_panna.png" alt="크리스마스 콜드 브루 콘 파나" />
                    </div>
                    <div class="set_common set_05">
                        <a href="#"></a> <img src="img/contents/xmas/2020_xmas2_relaxer.png" alt="캐모마일 릴렉서" />
                    </div>
                    <div class="set_common set_06">
                        <a href="#"></a> <img src="img/contents/xmas/2020_xmas2_dark.png" alt="다크 초콜릿" />
                    </div>
                    <div class="set_common set_07">
                        <a href="#"></a> <img src="img/contents/xmas/2020_xmas2_nut.png" alt="토피 넛 라떼" />
                    </div>
                </div>
                <div class="slogan_btn">
                    <a href="#">자세히 보기</a>
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
                                    <li><a href="#">시스템 개선 및 점검 안내</a></li>
                                    <li><a href="#">본인인증 시스템 작업 안내</a></li>
                                    <li><a href="#">제휴사 서비스 점검으로 인한 My DT Pass - 소유주 인증 진행
                                            불가</a></li>
                                    <li><a href="#">SSG PAY 시스템 점검 안내</a></li>
                                    <li><a href="#">삼성카드 시스템 점검에 따른 결제 일시 중단 안내</a></li>
                                </ul>
                            </dd>
                        </dl>
                        <span class="bgl_inner_r"><a href="#" title="공지사항 더보기">더보기</a></span>
                    </div>
                </div>
                <div class="line_notice_bgr">
                    <a href="#"> <span class="prom_ttl">스타벅스 프로모션</span> <span class="prom_btn"><img id="prom_btn_toggle" class="open" src="img/contents/btn_prom_down.png" alt="스타벅스 프로모션 펼쳐보기" role="button" /></span>
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
                            <li class="prom_slide"><img src="img/contents/banner/uX1xA2_20191227175905000.jpg" alt="만원당 별 적립 이벤트" />
                                <div class="prom_inner_btn">
                                    <a href="#">자세히 보기</a>
                                </div>
                            </li>
                            <li class="prom_slide"><img src="img/contents/banner/Cw54A8_20201208085148123.jpg" alt="크리스마스 2020" />
                                <div class="prom_inner_btn">
                                    <a href="#">자세히 보기</a>
                                </div>
                            </li>
                            <li class="prom_slide"><img src="img/contents/banner/1XNXWa_20201203142925287.jpg" alt="크리스마스의 즐거움을 소중한 사람들과 함께하세요!" />
                                <div class="prom_inner_btn">
                                    <a href="#">자세히 보기</a>
                                </div>
                            </li>
                            <li class="prom_slide"><img src="img/contents/banner/ymrqGG_20201201000945683.jpg" alt="스타벅스 현대카드, 5만원 이상 사용 시 별 100개 적립" />
                                <div class="prom_inner_btn">
                                    <a href="#">자세히 보기</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- 프로모션 배너 끝 -->
        <!-- 스타벅스리워드 시작 -->
        <section class="s_rewards">
            <div class="s_rewards_inner clear">
                <div class="rewards_logo">
                    <img src="img/contents/rewards-logo.png" alt="Starbucks Rewards" />
                </div>
                <div class="rewards_conts">
                    <div class="conts_info">
                        <div class="conts_info_txt">
                            <h2>
                                스타벅스만의 특별한 혜택, <strong>스타벅스 리워드</strong>
                            </h2>
                            <p>
                                <strong>스타벅스 회원이세요?</strong> 로그인을 통해 나만의 리워드를 확인해보세요.
                            </p>
                            <p>
                                <strong>스타벅스 회원이 아니세요?</strong> 가입을 통해 리워드 혜택을 즐기세요.
                            </p>
                        </div>
                        <div class="rewards_btn_group">
                            <a href="#" class="rewards_btn_join">회원가입</a> <a href="#" class="rewards_btn_login">로그인</a>
                        </div>
                    </div>
                    <div class="conts_gift">
                        <div class="conts_gift_txt">
                            <p>
                                회원 가입 후, 스타벅스 e-Gift Card를 <strong>"나에게 선물하기"로 구매하시고,
                                    편리하게 등록하세요!</strong>
                            </p>
                            <p>카드를 등록하여 스타벅스 리워드 회원이 되신 후, 첫 구매를 하시면 무료 음료쿠폰을 드립니다!</p>
                        </div>
                        <div class="btn_egift">
                            <a href="#">e-Gift Card 선물하기</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- 스타벅스리워드 끝 -->
        <!-- 메인 빈 시작 -->
        <section class="main_bean">
            <div class="main_bean_inner">
                <div class="bean_img_box">
                    <img src="img/contents/xmas/2020_xmas_bean.png" alt="크리스마스 블렌드" />
                </div>
                <div class="bean_txt_box">
                    <img src="img/contents/xmas/2020_xmas_bean_txt.png" alt="크리스마스를 더욱 특별하게 만들어 줄 커피 크리스마스 블렌드" />
                    <div class="bean_detail_btn">
                        <a href="#">자세히 보기</a>
                    </div>
                </div>
            </div>
        </section>
        <!-- 메인 빈 끝 -->
        <!-- 리저브 시작 -->
        <section class="reserve">
            <div class="reserve_inner clear">
                <div class="reserve_ttl">
                    <img src="img/contents/xmas/reserve_xmas_title.png" alt="RESERVE THE MERRY" />
                </div>
                <div class="reserve_visual">
                    <img src="img/contents/xmas/reserve_xmas_beans.png" />
                </div>
                <div class="reserve_detail_btn">
                    <a href="#">자세히 보기</a>
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
                    <a href="#">자세히 보기</a>
                </div>
            </div>
        </section>
        <!-- 메뉴 랩 끝 -->
        <!-- 리저브 매거진 시작 -->
        <section class="reserve_magazine">
            <div class="reserve_magazine_inner">
                <div class="magazine_left">
                    <img src="img/contents/reserve_visual_pc.png" />
                </div>
                <div class="magazine_right">
                    <img src="img/contents/reserve_text_pc.png" alt="리저브가 선사하는 특별한 경험을 온라인 매거진으로 만나보세요" />
                </div>
            </div>
            <div class="magazine_detail_btn">
                <a href="#">EXPLORE OUR STORY</a>
            </div>
        </section>
        <!-- 리저브 매거진 끝 -->
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
                    <a href="#">매장 찾기</a>
                </div>
            </div>
        </section>
        <!-- 매장 랩 끝 -->
    </div>
    <!-- 내용 끝 -->
    <%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
    <%@ include file="/WEB-INF/views/_inc/js_src.jsp"%>
</body>

</html>