<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 헤더시작 -->
    <div id="header">
        <div class="header_inner">
            <h1 class="logo">
                <a href="${pageContext.request.contextPath}/" title="스타벅스 메인페이지">스타벅스 코리아</a>
            </h1>
            <nav class="util_nav">
                <ul class="clear">
                    <li class="util_nav01 signIn"><a href="${pageContext.request.contextPath}/account/login">Sign In</a></li>
                    <li class="util_nav01 signOut" style="display: none;"><a href="${pageContext.request.contextPath}/account/logout">Sign Out</a></li>
                    <li class="util_nav02"><a href="${pageContext.request.contextPath}/sitemap">Site Map</a></li>
                    <li class="util_nav03"><a href="${pageContext.request.contextPath}/voc">Customer Service &amp;
                            Ideas</a></li>
                    <li class="util_nav04"><a href="${pageContext.request.contextPath}/">My Cart&nbsp;&nbsp;<span class="fa fa-shopping-cart"></span></a></li>
                </ul>
            </nav>
            <p class="btn_search">
                <a href="${pageContext.request.contextPath}/search"> <img src="${pageContext.request.contextPath}/assets/img/header/icon_magnifier_black.png" alt="통합검색" />
                </a> <label for="totalSearch">통합검색</label> <input type="text" id="totalSearch" placeholder="통합검색" />
            </p>
        </div>
        <nav class="gnb_nav">
            <div class="gnb_nav_inner clear">
                <ul class="clear">
                    <li class="gnb_nav01">
                        <h2>
                            <a href="${pageContext.request.contextPath}/coffee_finder">COFFEE</a>
                        </h2>
                        <div class="gnb_sub_wrap">
                            <div class="gnb_sub">
                                <div class="gnb_sub_inner">
                                    <div class="sub_up clear">
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/coffee_finder">나와 어울리는 커피</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="gnb_sub_txbg">
                                    <div class="gnb_sub_tx_inner">
                                        <h3>
                                            <a href="${pageContext.request.contextPath}/coffee_finder">나와 어울리는 커피 찾기</a>
                                        </h3>
                                        <p class="gnb_sub_ex_txt">스타벅스가 여러분에게 어울리는 커피를 찾아드립니다.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="gnb_nav02">
                        <h2>
                            <a href="${pageContext.request.contextPath}/product/menu_list">MENU</a>
                        </h2>
                        <div class="gnb_sub_wrap">
                            <div class="gnb_sub">
                                <div class="gnb_sub_inner">
                                    <div class="sub_up clear">
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/product/menu_list">음료</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">콜드브루</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">브루드 커피</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">에스프레소</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">프라푸치노</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">블렌디드</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">스타벅스 피지오</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">티(티바나)</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">기타 제조 음료</a></li>
                                            <li><a href="${pageContext.request.contextPath}/product/menu_list">스타벅스 주스(병음료)</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb_sub_txbg">
                                <div class="gnb_sub_tx_inner">
                                    <h3>
                                        <a href="${pageContext.request.contextPath}/product/menu_detail">
                                            나이트로 콜드 브루&nbsp;<img src="${pageContext.request.contextPath}/assets/img/header/icon_gnb_new.png">
                                        </a>
                                    </h3>
                                    <p class="gnb_sub_ex_txt">나이트로 커피 정통의 물결치듯 흘러내리는 캐스케이딩과
                                        부드러운 크림을 경험하세요.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="gnb_nav03">
                        <h2>
                            <a href="${pageContext.request.contextPath}/">STORE</a>
                        </h2>
                        <div class="gnb_sub_wrap">
                            <div class="gnb_sub">
                                <div class="gnb_sub_inner">
                                    <div class="sub_up clear">
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/">오프라인 매장 찾기</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">퀵 검색</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">지역 검색</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb_sub_txbg">
                                <div class="gnb_sub_tx_inner">
                                    <h3>
                                        <a href="${pageContext.request.contextPath}/">매장찾기</a>
                                    </h3>
                                    <p class="gnb_sub_ex_txt">보다 빠르게 매장을 찾아보세요.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="gnb_nav05">
                        <h2>
                            <a href="${pageContext.request.contextPath}/starbucks_card/about_card">STARBUCKS CARDS</a>
                        </h2>
                        <div class="gnb_sub_wrap">
                            <div class="gnb_sub">
                                <div class="gnb_sub_inner">
                                    <div class="sub_up clear">
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/starbucks_card/about_card">스타벅스 카드</a></li>
                                            <li><a href="${pageContext.request.contextPath}/starbucks_card/about_card">스타벅스 카드 소개</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">카드 등록하기</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">카드 충전하기</a></li>
                                        </ul>
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/starbucks_card/about_egift">스타벅스 e-Gift Card</a></li>
                                            <li><a href="${pageContext.request.contextPath}/starbucks_card/about_egift">스타벅스 e-Gift Card 소개</a></li>
                                            <li><a href="${pageContext.request.contextPath}/starbucks_card/gift_step1">선물하기</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb_sub_txbg">
                                <div class="gnb_sub_tx_inner">
                                    <h3>
                                        <a href="${pageContext.request.contextPath}/">스타벅스 카드 등록하기</a>
                                    </h3>
                                    <p class="gnb_sub_ex_txt">카드 등록 후 리워드 서비스를 누리고 사용내역도
                                        조회해보세요.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="gnb_nav06">
                        <h2>
                            <a href="${pageContext.request.contextPath}/my_starbucks">MY STARBUCKS</a>
                        </h2>
                        <div class="gnb_sub_wrap">
                            <div class="gnb_sub">
                                <div class="gnb_sub_inner">
                                    <div class="sub_up clear">
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/">My 스타벅스 카드</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">보유 카드 조회</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">카드 등록</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">카드 충전</a></li>
                                        </ul>
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/">My 스타벅스 e-Gift Card</a></li>
                                            <li><a href="${pageContext.request.contextPath}/starbucks_card/gift_step1">선물하기</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">선물 내역</a></li>
                                        </ul>
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/">My Order</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">장바구니</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">주문 내역</a></li>
                                        </ul>
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/">고객 서비스</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">My 메뉴</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">My 고객의 소리</a></li>
                                        </ul>
                                        <ul>
                                            <li class="gnb_sub_ttl"><a href="${pageContext.request.contextPath}/">개인정보관리</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">개인정보 확인 및 수정</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">회원 탈퇴</a></li>
                                            <li><a href="${pageContext.request.contextPath}/">비밀번호 변경</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="gnb_sub_txbg">
                                <div class="gnb_sub_tx_inner">
                                    <h3>
                                        <a href="${pageContext.request.contextPath}/mystarbucks">My Starbucks 메인페이지</a>
                                    </h3>
                                    <p class="gnb_sub_ex_txt">My Starbucks 메인페이지에서 내 카드를 한눈에 확인하고, 스타벅스 판매 집계도 조회해보세요.</p>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <!-- 헤더끝 -->